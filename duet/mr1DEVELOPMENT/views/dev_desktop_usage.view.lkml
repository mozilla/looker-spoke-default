view: dev_desktop_usage {
  derived_table: {
    sql:
    WITH tbl AS (
        SELECT
          first_seen_date AS submission_date,
          CASE WHEN (
            DATE_DIFF(current_date(),
                      first_seen_date,
                      DAY) BETWEEN 0 and 28
            OR
            DATE_DIFF(current_date(),
                      first_seen_date,
                      DAY) BETWEEN 0+365 and 28+365
                    )
          THEN FALSE
          ELSE TRUE
          END
            AS week4_reported_date,
          CASE WHEN country_code IN ('US', 'GB', 'DE', 'FR','CA', 'BR','MX',
                                              'CN', 'IN', 'AU', 'NL', 'ES', 'RU')
              THEN country_code
              ELSE 'ROW'
              END
                AS normalized_country_code_subset,
          CASE
            WHEN channel = 'release'
            AND LOWER(os) like '%windows%'
            AND DATE_DIFF(  -- Only use builds from the last month
                  DATE(first_seen_date),
                  SAFE.PARSE_DATE('%Y%m%d', SUBSTR(build_id, 0, 8)),
                  WEEK
                  ) <= 6
            AND attribution_source IS NOT NULL
            AND attribution_ua != 'firefox'
            AND attribution_ua IS NOT NULL
            AND startup_profile_selection_reason IN ('firstrun-created-default')
            THEN 'mozorg windows funnel'
            ELSE 'other'
            END
              AS funnel_derived,
          SUM(CASE WHEN returned_second_day = TRUE THEN 1 ELSE 0 END) AS returned_second_day,
          SUM(CASE WHEN retained_week4 = TRUE THEN 1 ELSE 0 END) AS retained_week4
        FROM `mozdata.telemetry.clients_first_seen_28_days_later`
        WHERE first_seen_date >= '2021-01-01'
              AND DATE_DIFF(current_date(), first_seen_date, DAY) > 1
        GROUP BY 1, 2, 3, 4
        )
    SELECT
      *,
      AVG(returned_second_day) OVER
        (PARTITION BY funnel_derived, normalized_country_code_subset
         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
          AS returned_second_day_smoothed,
      AVG(retained_week4) OVER
        (PARTITION BY funnel_derived, normalized_country_code_subset
         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
          AS retained_week4_smoothed
    FROM tbl
    ;;
  }

  dimension: week4_reported_date{
    sql:  ${TABLE}.week4_reported_date;;
    type: yesno
    description: "check if date has week 4 metrics reported"
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
    sql: ${TABLE}.normalized_country_code_subset
              ;;
    type: string
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code. Other then those 8 countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: ${TABLE}.funnel_derived
          ;;
    type: string
    description: "defining membership in the different firefox acquisition funnels"
  }

  measure: returned_second_day {
    type: sum
    sql: ${TABLE}.returned_second_day ;;
    description: "Total number of new profiles who returned for a second session within 28 days"
  }

  measure: retained_week4 {
    type: sum
    sql: ${TABLE}.retained_week4;;
    description: "Total number of new profiles who were week 4 retained: active (sent main ping) between days 21-28"
  }

  measure: returned_second_day_smoothed {
    type: sum
    sql: ${TABLE}.returned_second_day_smoothed ;;
    description: "metric 7 day smoothed"
  }

  measure: retained_week4_smoothed {
    type: sum
    sql: ${TABLE}.retained_week4_smoothed;;
    description: "metric 7 day smoothed"
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
