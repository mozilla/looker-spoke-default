view: dev_desktop_session {
  derived_table: {
    sql:
WITH tbl AS (
  SELECT date AS submission_date,
         CASE
             WHEN (DATE_DIFF(current_date(), date, DAY) BETWEEN 0 AND 28
                   OR DATE_DIFF(current_date(), date, DAY) BETWEEN 0+365 AND 28+365) THEN FALSE
             ELSE TRUE
         END AS week4_reported_date,
         CASE
             WHEN standardized_country_name = 'USA' THEN 'US'
             WHEN standardized_country_name = 'United Kingdom' THEN 'GB'
             WHEN standardized_country_name = 'Germany' THEN 'DE'
             WHEN standardized_country_name = 'France' THEN 'FR'
             WHEN standardized_country_name = 'Canada' THEN 'CA'
             WHEN standardized_country_name = 'Brazil' THEN 'BR'
             WHEN standardized_country_name = 'Mexico' THEN 'MX'
             WHEN standardized_country_name = 'China' THEN 'CN'
             WHEN standardized_country_name = 'India' THEN 'IN'
             WHEN standardized_country_name = 'Australia' THEN 'AU'
             WHEN standardized_country_name = 'Netherlands' THEN 'NL'
             WHEN standardized_country_name = 'Spain' THEN 'ES'
             WHEN standardized_country_name = 'Russia' THEN 'RU'
             ELSE 'ROW'
         END AS normalized_country_code_subset,
         CASE
             WHEN browser IN ('Mozilla',
                              'Firefox') THEN 'existing user' -- note, the sessions and downloads should always be zero due to
   -- the measures being *_non_fx_*
   -- but useful if we change the structure

             WHEN browser NOT IN ('Mozilla',
                                  'Firefox')
                  AND operating_system = 'Windows' THEN 'mozorg windows funnel'
             WHEN browser NOT IN ('Mozilla',
                                  'Firefox')
                  AND operating_system = 'Macintosh' THEN 'mozorg mac funnel'
             ELSE 'other'
         END AS funnel_derived,
         sum(non_fx_sessions) AS non_fx_sessions,
         sum(non_fx_downloads) AS non_fx_downloads
  FROM `moz-fx-data-shared-prod.mozilla_org.www_site_metrics_summary`
  WHERE date >= '2021-01-01'
    AND DATE_DIFF(current_date(), date, DAY) > 1
    AND device_category = 'desktop'
  GROUP BY 1,
           2,
           3,
           4
      )
    SELECT
      *,
      AVG(non_fx_sessions) OVER
        (PARTITION BY funnel_derived, normalized_country_code_subset
         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
          AS non_fx_sessions_smoothed,
      AVG(non_fx_downloads) OVER
        (PARTITION BY funnel_derived, normalized_country_code_subset
         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
          AS non_fx_downloads_smoothed
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

  dimension: normalized_country_code_subset {
    type: string
    sql: ${TABLE}.normalized_country_code_subset
    ;;
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code. Other then those countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: ${TABLE}.funnel_derived
          ;;
    type: string
    description: "defining membership in the different firefox acquisition funnels"
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

  measure: non_fx_sessions_smoothed {
    description: "visits from non-Firefox browsers."
    type: sum
    sql: ${TABLE}.non_fx_sessions_smoothed ;;
  }

  measure: non_fx_downloads_smoothed {
    description: "downloads from non-Firefox browsers."
    type: sum
    sql: ${TABLE}.non_fx_downloads_smoothed ;;
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
