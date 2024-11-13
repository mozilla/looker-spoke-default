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
                          normalized_country_code_subset
             ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                ) AS new_installs_smoothed,
          AVG(paveover_installs) OVER
            (PARTITION BY funnel_derived,
                          normalized_country_code_subset
             ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                ) AS paveover_installs_smoothed,
          AVG(installs) OVER
            (PARTITION BY funnel_derived,
                          normalized_country_code_subset
             ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                ) AS installs_smoothed
   FROM tbl_agg),

tbl_YOY AS
(SELECT a.*,
       b.new_installs AS new_installs_prev_year,
       b.paveover_installs AS paveover_installs_prev_year,
       b.installs AS installs_prev_year,
       b.new_installs_smoothed AS new_installs_smoothed_prev_year,
       b.paveover_installs_smoothed AS paveover_installs_smoothed_prev_year,
       b.installs_smoothed AS installs_smoothed_prev_year
FROM tbl_smoothed a
LEFT JOIN tbl_smoothed b ON (
    DATE_ADD(b.submission_date, INTERVAL 1 YEAR) = a.submission_date
    AND COALESCE(a.funnel_derived, 'tmp_NA') = COALESCE(b.funnel_derived, 'tmp_NA')
    AND COALESCE(a.normalized_country_code_subset, 'tmp_NA') = COALESCE(b.normalized_country_code_subset, 'tmp_NA')
                    )
  )
-- next part is complete hack to make this data source date availability
-- match with the 28 days later table
    SELECT
    a.*
    FROM
      tbl_YOY a
    LEFT JOIN
      (SELECT distinct first_seen_date as submission_date
      FROM `mozdata.telemetry.clients_first_seen_28_days_later`
      WHERE sample_id = 1 AND first_seen_date >= '2021-01-01') b
    ON (a.submission_date = b.submission_date)
    WHERE b.submission_date is not null
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

  measure: new_installs_prev_year {
    description: "installs where no existing installation existed."
    type: sum
    sql: ${TABLE}.new_installs_prev_year ;;
  }

  measure: paveover_installs_prev_year {
    description: "installs where existing installation existed."
    type: sum
    sql: ${TABLE}.paveover_installs_prev_year ;;
  }

  measure: installs_prev_year {
    description: "total installs."
    type: sum
    sql: ${TABLE}.installs_prev_year ;;
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
