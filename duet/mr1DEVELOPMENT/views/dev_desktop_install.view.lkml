
view: dev_desktop_install {
  derived_table: {
    sql:
    WITH tbl AS (
          SELECT
            DATE(submission_timestamp) AS submission_date,
            CASE WHEN (
              DATE_DIFF(current_date(),
                        DATE(submission_timestamp),
                        DAY) BETWEEN 0 and 28
              OR
              DATE_DIFF(current_date(),
                        DATE(submission_timestamp),
                        DAY) BETWEEN 0+365 and 28+365
                      )
              THEN FALSE
              ELSE TRUE
              END
                AS week4_reported_date,
            CASE
              WHEN normalized_country_code IN ('US', 'GB', 'DE', 'FR','CA', 'BR',
                                               'MX', 'CN', 'IN', 'AU', 'NL', 'ES', 'RU')
              THEN normalized_country_code
              ELSE 'ROW'
              END
                AS normalized_country_code_subset,
            CASE
              WHEN (silent = FALSE OR silent IS NULL)
              AND DATE_DIFF(  -- Only use builds from the last month
                    DATE(submission_timestamp),
                    SAFE.PARSE_DATE('%Y%m%d', SUBSTR(build_id, 0, 8)),
                    WEEK
                    ) <= 6
              AND IF((attribution IS NULL OR attribution = '' OR attribution = '0'),
                 NULL,
                 SPLIT(
                    SPLIT(
                        attribution,
                        '26ua%3D')[SAFE_OFFSET(1)],
                        '%')[SAFE_OFFSET(0)]
                        ) != 'firefox'
              AND IF((attribution IS NULL OR attribution = '' OR attribution = '0'),
                 NULL,
                 SPLIT(
                    SPLIT(
                        attribution,
                        '26ua%3D')[SAFE_OFFSET(1)],
                        '%')[SAFE_OFFSET(0)]
                        ) IS NOT NULL
              THEN 'mozorg windows funnel'
              ELSE 'other'
              END
                AS funnel_derived,
            SUM(
              CASE WHEN succeeded = TRUE
                   AND had_old_install IS NOT TRUE
                   THEN 1
                   ELSE 0 END
                   )
              AS new_installs,
            SUM(
              CASE WHEN succeeded = TRUE
                   AND had_old_install = TRUE
                   THEN 1
                   ELSE 0 END
                   )
              AS paveover_installs,
            SUM(
              CASE WHEN succeeded = TRUE
                   THEN 1
                   ELSE 0 END
                   )
              AS installs
          FROM `mozdata.firefox_installer.install`
          WHERE date(submission_timestamp) >= '2021-01-01'
          AND DATE_DIFF(current_date(), date(submission_timestamp), DAY) > 1
          GROUP BY 1, 2, 3, 4
        )
    SELECT
      *,
      AVG(new_installs) OVER
        (PARTITION BY funnel_derived, normalized_country_code_subset
         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
          AS new_installs_smoothed,
      AVG(paveover_installs) OVER
        (PARTITION BY funnel_derived, normalized_country_code_subset
         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
          AS paveover_installs_smoothed,
      AVG(installs) OVER
        (PARTITION BY funnel_derived, normalized_country_code_subset
         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
          AS installs_smoothed
    FROM tbl
    ;;
  }

  dimension: week4_reported_date_described {
    type: string
    sql: CASE WHEN ${TABLE}.week4_reported_date = TRUE THEN 'data complete'
         WHEN ${TABLE}.week4_reported_date = FALSE THEN 'awaiting wk4 results'
         ELSE 'data complete'
        END
      ;;
    description: "field as string"
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

  dimension: week4_reported_date{
    sql: ${TABLE}.week4_reported_date;;
    type: yesno
    description: "check if date has week 4 metrics reported"
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
