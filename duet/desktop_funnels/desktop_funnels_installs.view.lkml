view: desktop_funnels_installs {
derived_table: {
  sql:
WITH tbl_agg AS
  (SELECT DATE(submission_timestamp) AS submission_date,
          CASE
              WHEN normalized_country_code IN
                    ('US','GB','DE','FR','CA','BR',
                     'MX','CN','IN','AU','NL','ES',
                     'RU') THEN normalized_country_code
              ELSE 'ROW'
          END AS normalized_country_code_subset,
          funnel_derived,
          distribution_model,
          partner_org,
          CASE
              WHEN distribution_id = '0' THEN NULL
              ELSE distribution_id
          END AS distribution_id,
          SUM(CASE
                  WHEN succeeded = TRUE
                       AND had_old_install IS NOT TRUE THEN 1
                  ELSE 0
              END) AS new_installs,
          SUM(CASE
                  WHEN succeeded = TRUE
                       AND had_old_install = TRUE THEN 1
                  ELSE 0
              END) AS paveover_installs,
          SUM(CASE
                  WHEN succeeded = TRUE THEN 1
                  ELSE 0
              END) AS installs
   FROM `mozdata.firefox_installer.install`
   WHERE date(submission_timestamp) >= '2021-01-01'
     AND DATE_DIFF(current_date(), date(submission_timestamp), DAY) > 1
   GROUP BY ALL),
     tbl_smoothed AS
  (SELECT *,
          AVG(new_installs) OVER
            (PARTITION BY funnel_derived,
                          normalized_country_code_subset,
                          partner_org,
                          distribution_model,
                          distribution_id
             ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                ) AS new_installs_smoothed,
          AVG(paveover_installs) OVER
            (PARTITION BY funnel_derived,
                          normalized_country_code_subset,
                          partner_org,
                          distribution_model,
                          distribution_id
             ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                ) AS paveover_installs_smoothed,
          AVG(installs) OVER
            (PARTITION BY funnel_derived,
                          normalized_country_code_subset,
                          partner_org,
                          distribution_model,
                          distribution_id
             ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                ) AS installs_smoothed
   FROM tbl_agg)

SELECT a.*,
       b.new_installs_smoothed AS new_installs_smoothed_prev_year,
       b.paveover_installs_smoothed AS paveover_installs_smoothed_prev_year,
       b.installs_smoothed AS installs_smoothed_prev_year
FROM tbl_smoothed a
LEFT JOIN tbl_smoothed b ON (
    DATE_ADD(b.submission_date, INTERVAL 1 YEAR) = a.submission_date
    AND COALESCE(a.funnel_derived, 'tmp_NA') = COALESCE(b.funnel_derived, 'tmp_NA')
    AND COALESCE(a.distribution_model, 'tmp_NA') = COALESCE(b.distribution_model, 'tmp_NA')
    AND COALESCE(a.partner_org, 'tmp_NA') = COALESCE(b.partner_org, 'tmp_NA')
    AND COALESCE(a.normalized_country_code_subset, 'tmp_NA') = COALESCE(b.normalized_country_code_subset, 'tmp_NA')
   AND COALESCE(a.distribution_id, 'tmp_NA') = COALESCE(b.distribution_id, 'tmp_NA')
                    )
      ;;

  }

  dimension: normalized_country_code_subset {
    type: string
    sql: ${TABLE}.normalized_country_code_subset
      ;;
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code.
    Other then those countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: ${TABLE}.funnel_derived
      ;;
    type: string
    description: "meta identifer: defining membership in the different firefox acquisition funnels"
  }

  dimension: distribution_model {
    sql: ${TABLE}.distribution_model
      ;;
    type: string
    description: "only relevent for Distribution Builds funnel, describes how build is distributed"
  }

  dimension: partner_org {
    sql: ${TABLE}.partner_org
      ;;
    type: string
    description: "only relevent for Distribution Builds funnel, partnership org associated with build"
  }

  dimension: distribution_id {
    sql: ${TABLE}.distribution_id
      ;;
    type: string
    description: "only relevent for Distribution Builds funnel, partnership org associated with build"
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    description: "derived from GA timestamp of the raw data, this is a date in the underlying table"
  }

  measure: new_installs {
    description: "installs where no existing installation existed."
    type: sum
    sql: ${TABLE}.new_installs ;;
  }

  measure: paveover_installs {
    description: "installs where existing installation existed."
    type: sum
    sql: ${TABLE}.paveover_installs ;;
  }

  measure: installs {
    description: "total installs."
    type: sum
    sql: ${TABLE}.installs ;;
  }

  measure: new_installs_smoothed {
    description: "installs where no existing installation existed."
    type: sum
    sql: ${TABLE}.new_installs_smoothed ;;
  }

  measure: paveover_installs_smoothed {
    description: "installs where existing installation existed."
    type: sum
    sql: ${TABLE}.paveover_installs_smoothed ;;
  }

  measure: installs_smoothed {
    description: "total installs."
    type: sum
    sql: ${TABLE}.installs_smoothed ;;
  }

  measure: new_installs_smoothed_prev_year {
    description: "installs where no existing installation existed."
    type: sum
    sql: ${TABLE}.new_installs_smoothed_prev_year ;;
  }

  measure: paveover_installs_smoothed_prev_year {
    description: "installs where existing installation existed."
    type: sum
    sql: ${TABLE}.paveover_installs_smoothed_prev_year ;;
  }

  measure: installs_smoothed_prev_year {
    description: "total installs."
    type: sum
    sql: ${TABLE}.installs_smoothed_prev_year ;;
  }

  # parameters below

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores. Purely for ease of building charts"
    sql: TRUE ;;
  }

  filter: analysis_period {
    type: date
    description: "the start date and end date of the window being checked. will be dashboard or user
    inputed, not referring to data in the table"
  }

}
