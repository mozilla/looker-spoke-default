view: dev_desktop_install_partners {
  derived_table: {
    sql:
    WITH tbl AS
      (SELECT DATE(submission_timestamp) AS submission_date,
              CASE
                  WHEN country IN ('US','GB','DE','FR','CA','BR','MX',
                                                   'CN','IN','AU','NL','ES','RU') THEN country
                  ELSE 'ROW'
              END AS normalized_country_code_subset,
              CASE
                  WHEN CONCAT(split(os_version, '.')[offset(0)], '.', split(os_version, '.')[offset(1)]) = '10.0' THEN 'Win10/11'
                  WHEN CONCAT(split(os_version, '.')[offset(0)], '.', split(os_version, '.')[offset(1)]) = '6.1' THEN 'Win7'
                  WHEN CONCAT(split(os_version, '.')[offset(0)], '.', split(os_version, '.')[offset(1)]) IN ('6.2',
                                                                                                             '6.3') THEN 'Win8/8.1'
                  ELSE 'Win Other'
              END AS os_group,
              funnel_derived,
              partner_org,
              distribution_model,
      CASE WHEN distribution_id = '0' THEN null ELSE distribution_id
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
      GROUP BY 1,
      2,
      3,
      4,
      5,
      6, 7),
    tbl2 AS
      (SELECT *,
      AVG(new_installs) OVER (PARTITION BY funnel_derived,
      normalized_country_code_subset,
      os_group,
      partner_org,
      distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS new_installs_smoothed,
      AVG(paveover_installs) OVER (PARTITION BY funnel_derived,
      normalized_country_code_subset,
      os_group,
      partner_org,
      distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS paveover_installs_smoothed,
      AVG(installs) OVER (PARTITION BY funnel_derived,
      normalized_country_code_subset,
      os_group,
      partner_org,
      distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS installs_smoothed
      FROM tbl)

    SELECT
      *
    FROM
      tbl2
    WHERE
      submission_date IN (SELECT distinct first_seen_date
                          FROM `mozdata.telemetry.clients_first_seen_28_days_later`
                          WHERE first_seen_date >= '2021-01-01'
                          AND DATE_DIFF(current_date(), first_seen_date, DAY) > 1
                          )
      ;;
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
    convert_tz:  no
    datatype:  date
    description: "Date when we recieved the first Telemetry ping from user. Is renamed from first_seen_date"
  }

  dimension: normalized_country_code_subset {
    sql: ${TABLE}.normalized_country_code_subset ;;
    type: string
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code. Other then those 8 countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: ${TABLE}.funnel_derived;;
    type: string
    description: "defining membership in the different firefox acquisition funnels"
  }

  dimension: os_group {
    sql: ${TABLE}.os_group
      ;;
    type: string
    description: "os grouping"
  }

  dimension: partner_org {
    sql: ${TABLE}.partner_org
      ;;
    type: string
    description: "which partner org acquisition is from - only valid for funnel_derived = partner, otherwise will be non-distribution"
  }

  dimension: distribution_model {
    sql: ${TABLE}.distribution_model
      ;;
    type: string
    description: "how partner distributes FF - only valid for funnel_derived = partner, otherwise will be non-distribution"
  }

  dimension: distribution_id {
    sql: ${TABLE}.distribution_id
      ;;
    type: string
    description: "raw distribution id"
  }

  measure: new_installs {
    type: sum
    sql:  ${TABLE}.new_installs ;;
    description: "Total number of new installs (no previous installation found)."
  }

  measure: paveover_installs{
    type: sum
    sql:  ${TABLE}.paveover_installs ;;
    description: "Total number of paverover installs (previous install found during install)."
  }

  measure: total_installs {
    type: sum
    sql:  ${TABLE}.installs ;;
    description: "new_installs + paveover_installs"
  }

  measure: new_installs_smoothed {
    type: sum
    sql:  ${TABLE}.new_installs_smoothed ;;
    description: "7 day MA"
  }

  measure: paveover_installs_smoothed{
    type: sum
    sql:  ${TABLE}.paveover_installs_smoothed ;;
    description: "7 day MA"
  }

  measure: total_installs_smoothed {
    type: sum
    sql:  ${TABLE}.installs_smoothed ;;
    description: "7 day MA"
  }

  # parameters below

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores."
    sql: TRUE ;;
  }

  filter: analysis_period {
    type: date
    description: "the start date and end date of the window being checked. will be dashboard or user inputed, not referring to data in the table"
  }

  parameter: year_over_year {
    type: yesno
    description: "Flag to determine whether data from last year should be used"
    default_value: "no"
  }

}
