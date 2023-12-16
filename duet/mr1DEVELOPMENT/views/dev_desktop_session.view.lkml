view: dev_desktop_session {
  derived_table: {
    sql: SELECT
            date,
            standardized_country_name,
            browser,
            operating_system,
            sum(non_fx_sessions) as non_fx_sessions,
            sum(non_fx_downloads) as non_fx_downloads
         FROM `moz-fx-data-marketing-prod.ga_derived.www_site_metrics_summary_v1`
         WHERE date >= '2021-01-01'
         AND device_category = 'desktop'
         GROUP BY 1, 2, 3, 4
    ;;
  }

  dimension: normalized_country_code_subset {
    type: string
    sql: CASE WHEN ${TABLE}.standardized_country_name = 'USA' THEN 'US'
              WHEN ${TABLE}.standardized_country_name = 'United Kingdom' THEN 'GB'
              WHEN ${TABLE}.standardized_country_name = 'Germany' THEN 'DE'
              WHEN ${TABLE}.standardized_country_name = 'France' THEN 'FR'
              WHEN ${TABLE}.standardized_country_name = 'Canada' THEN 'CA'
              WHEN ${TABLE}.standardized_country_name = 'Brazil' THEN 'BR'
              WHEN ${TABLE}.standardized_country_name = 'Mexico' THEN 'MX'
              WHEN ${TABLE}.standardized_country_name = 'China' THEN 'CN'
              WHEN ${TABLE}.standardized_country_name = 'India' THEN 'IN'
              WHEN ${TABLE}.standardized_country_name = 'Australia' THEN 'AU'
              WHEN ${TABLE}.standardized_country_name = 'Netherlands' THEN 'NL'
              WHEN ${TABLE}.standardized_country_name = 'Spain' THEN 'ES'
              WHEN ${TABLE}.standardized_country_name = 'Russia' THEN 'RU'
              ELSE 'ROW'
              END
    ;;
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code. Other then those countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: CASE WHEN ${TABLE}.browser in ('Mozilla', 'Firefox') THEN 'existing user'
                -- note, the sessions and downloads should always be zero due to
                -- the measures being *_non_fx_*
                -- but useful if we change the structure
              WHEN ${TABLE}.browser NOT in ('Mozilla', 'Firefox')
                   AND ${TABLE}.operating_system = 'Windows' THEN 'mozorg windows funnel'
              WHEN ${TABLE}.browser NOT in ('Mozilla', 'Firefox')
                   AND ${TABLE}.operating_system = 'Macintosh' THEN 'mozorg mac funnel'
          ELSE 'other'
          END
          ;;
    type: string
    description: "defining membership in the different firefox acquisition funnels"
  }

  dimension: week4_reported_date{
    sql:  CASE
          WHEN (DATE_DIFF(current_date(), ${TABLE}.date, DAY) BETWEEN 0 and 28
                OR
                DATE_DIFF(current_date(), ${TABLE}.date, DAY) BETWEEN 0+365 and 28+365
                )
             THEN FALSE
           ELSE TRUE
           END;;
    type: yesno
    description: "check if date has week 4 metrics reported"
  }

  dimension_group: submission {
    sql: ${TABLE}.date ;;
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

  measure: non_fx_sessions {
    description: "visits from non-Firefox browsers."
    type: sum
    sql: ${TABLE}.non_fx_sessions ;;
  }

  measure: non_fx_downloads {
    description: "downloads from non-Firefox browsers."
    type: sum
    sql: ${TABLE}.non_fx_downloads ;;
  }

  # parameters below

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores. Purely for ease of building charts"
    sql: TRUE ;;
  }

  filter: analysis_period {
    type: date
    description: "the start date and end date of the window being checked. will be dashboard or user inputed, not referring to data in the table"
  }

  parameter: year_over_year {
    type: yesno
    description: "flag to determine if we want last year's data"
    default_value: "no"
  }

}
