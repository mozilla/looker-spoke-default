view: dev_desktop_usage {
  derived_table: {
    sql:
        SELECT
          first_seen_date,
          country_code,
          channel,
          build_id,
          os,
          distribution_id,
          attribution_source,
          attribution_ua,
          startup_profile_selection_reason,
          returned_second_day,
          retained_week4
        FROM `mozdata.telemetry.clients_first_seen_28_days_later`
        WHERE first_seen_date >= '2021-01-01'
    ;;
  }

  dimension: week4_reported_date{
    sql:  CASE
    WHEN (DATE_DIFF(current_date(), ${TABLE}.first_seen_date, DAY) BETWEEN 0 and 28
    OR
    DATE_DIFF(current_date(), ${TABLE}.first_seen_date, DAY) BETWEEN 0+365 and 28+365
    )
    THEN FALSE
    ELSE TRUE
    END;;
    type: yesno
    description: "check if date has week 4 metrics reported"
  }

  dimension_group: submission {
    sql: ${TABLE}.first_seen_date ;;
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
    sql: CASE WHEN ${TABLE}.country_code IN ('US', 'GB', 'DE', 'FR','CA', 'BR','MX', 'CN', 'IN', 'AU', 'NL', 'ES', 'RU')
              THEN ${TABLE}.country_code
              ELSE 'ROW'
              END
              ;;
    type: string
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code. Other then those 8 countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: CASE
          WHEN ${TABLE}.channel = 'release'
          AND LOWER(${TABLE}.os) like '%windows%'
          AND DATE_DIFF(  -- Only use builds from the last month
                DATE(${TABLE}.first_seen_date),
                SAFE.PARSE_DATE('%Y%m%d', SUBSTR(${TABLE}.build_id, 0, 8)),
                WEEK
                ) <= 6
          AND ${TABLE}.attribution_source IS NOT NULL
          AND ${TABLE}.attribution_ua != 'firefox'
          AND ${TABLE}.attribution_ua IS NOT NULL
          AND ${TABLE}.startup_profile_selection_reason IN ('firstrun-created-default')
          THEN 'mozorg windows funnel'
          ELSE 'other'
          END
          ;;
    type: string
    description: "defining membership in the different firefox acquisition funnels"
  }

  measure: returned_second_day {
    type: sum
    sql: CASE WHEN returned_second_day = TRUE THEN 1 ELSE 0 END ;;
    description: "Total number of new profiles who returned for a second session within 28 days"
  }

  measure: retained_week4 {
    type: sum
    sql: CASE WHEN retained_week4 = TRUE THEN 1 ELSE 0 END ;;
    description: "Total number of new profiles who were week 4 retained: active (sent main ping) between days 21-28"
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
