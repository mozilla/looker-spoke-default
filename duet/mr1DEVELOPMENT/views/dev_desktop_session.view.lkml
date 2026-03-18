view: dev_desktop_session {
  derived_table: {
    sql:
WITH tbl AS (
SELECT session_date AS submission_date,
       CASE
           WHEN (DATE_DIFF(current_date(), session_date, DAY) BETWEEN 0 AND 28
                 OR DATE_DIFF(current_date(), session_date, DAY) BETWEEN 0+365 AND 28+365) THEN FALSE
           ELSE TRUE
       END AS week4_reported_date,
       CASE
           WHEN country = 'USA' THEN 'US'
           WHEN country = 'Canada' THEN 'CA'
           WHEN country = 'Brazil' THEN 'BR'
           WHEN country = 'Mexico' THEN 'MX'
           WHEN country = 'China' THEN 'CN'
           WHEN country = 'India' THEN 'IN'
           WHEN country = 'Australia' THEN 'AU'
           WHEN country = 'Russia' THEN 'RU'
           ELSE 'ROW'
       END AS normalized_country_code_subset,
       CASE
           WHEN LOWER(device_category) != 'desktop' THEN 'mobile'
           WHEN LOWER(COALESCE(browser, '')) IN ('mozilla',
                                                 'firefox') THEN 'existing user'
           WHEN LOWER(COALESCE(browser, '')) NOT IN ('mozilla',
                                                     'firefox')
                AND LOWER(os) = 'windows' THEN 'mozorg windows funnel'
           WHEN LOWER(COALESCE(browser, '')) NOT IN ('mozilla',
                                                     'firefox')
                AND LOWER(os) = 'macintosh' THEN 'mozorg mac funnel'
           ELSE 'mozorg other'
       END AS funnel_derived,
COUNTIF(COALESCE((((lower(manual_source) LIKE '%www.mozilla.org%'
                           OR lower(manual_source) = 'mozilla.org'
                           OR lower(first_source_from_event_params) LIKE '%www.mozilla.org%'
                           OR lower(first_source_from_event_params) = 'mozilla.org')
                          AND flag = 'FIREFOX.COM')
                         OR ((lower(manual_source) IN ('www.firefox.com', 'firefox.com', 'firefox-com')
                              OR lower(first_source_from_event_params) IN ('www.firefox.com', 'firefox.com', 'firefox-com'))
                             AND flag = 'MOZILLA.ORG')), FALSE) IS FALSE) AS non_fx_sessions,
       countif(firefox_desktop_downloads > 0) AS non_fx_downloads
FROM `mozdata.telemetry.ga4_sessions_firefoxcom_mozillaorg_combined`
WHERE session_date >= '2021-01-01'
  AND device_category = 'desktop'
  AND coalesce(browser, '') NOT IN ('Firefox',
                                'Mozilla')
  AND COALESCE(country, '') NOT IN ('Austria',
                                    'Germany',
                                    'United Kingdom',
                                    'Netherlands',
                                    'Poland',
                                    'Spain',
                                    'Italy',
                                    'Switzerland',
                                    'Czechia',
                                    'Sweden',
                                    'Bulgaria',
                                    'Belgium',
                                    'Slovakia',
                                    'Latvia',
                                    'Estonia',
                                    'Lithuania',
                                    'France',
                                    'Croatia',
                                    'Portugal',
                                    'Slovenia',
                                    'Denmark',
                                    'Finland',
                                    'Hungary',
                                    'Iceland',
                                    'Ireland',
                                    'Norway',
                                    'Romania')
GROUP BY ALL
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
