view: desktop_funnels_web {
  derived_table: {
    sql:
    WITH tbl_agg AS (
      SELECT session_date AS submission_date,
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
       countif(NOT (((lower(manual_source) LIKE '%www.mozilla.org%'
                      OR lower(manual_source) = 'mozilla.org'
                      OR lower(first_source_from_event_params) LIKE '%www.mozilla.org%'
                      OR lower(first_source_from_event_params) = 'mozilla.org')
                     AND flag = 'FIREFOX.COM')
                    OR ((lower(manual_source) IN ('www.firefox.com', 'firefox.com', 'firefox-com')
                         OR lower(first_source_from_event_params) IN ('www.firefox.com', 'firefox.com', 'firefox-com'))
                        AND flag = 'MOZILLA.ORG'))) AS non_fx_sessions,
       countif(firefox_desktop_downloads > 0) AS non_fx_downloads
      FROM `mozdata.telemetry.ga4_sessions_firefoxcom_mozillaorg_combined`
      WHERE session_date >= '2021-01-01'
      AND device_category = 'desktop'
      AND coalesce(browser, '') NOT IN ('Firefox','Mozilla')
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
      ),
    tbl_smoothed AS
      (SELECT
      *,
      AVG(non_fx_sessions) OVER
      (PARTITION BY
          funnel_derived,
          normalized_country_code_subset
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      AS non_fx_sessions_smoothed,
      AVG(non_fx_downloads) OVER
      (PARTITION BY
          funnel_derived,
          normalized_country_code_subset
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      AS non_fx_downloads_smoothed
      FROM tbl_agg),

    tbl_YOY AS
      (SELECT
        a.*,
        b.non_fx_sessions AS non_fx_sessions_prev_year,
        b.non_fx_downloads AS non_fx_downloads_prev_year,
        b.non_fx_sessions_smoothed AS non_fx_sessions_smoothed_prev_year,
        b.non_fx_downloads_smoothed AS non_fx_downloads_smoothed_prev_year
      FROM
        tbl_smoothed a
      LEFT JOIN
        tbl_smoothed b
      ON (DATE_ADD(b.submission_date, INTERVAL 1 YEAR) = a.submission_date
          AND COALESCE(a.funnel_derived, 'tmp_NA') = COALESCE(b.funnel_derived, 'tmp_NA')
          AND COALESCE(a.normalized_country_code_subset,
                       'tmp_NA') = COALESCE(b.normalized_country_code_subset, 'tmp_NA')
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

  measure: non_fx_sessions_prev_year {
    description: "visits from non-Firefox browsers from previous year"
    type: sum
    sql: ${TABLE}.non_fx_sessions_prev_year ;;
  }

  measure: non_fx_downloads_prev_year {
    description: "downloads from non-Firefox browsers from previous year"
    type: sum
    sql: ${TABLE}.non_fx_downloads_prev_year ;;
  }

  measure: non_fx_sessions_smoothed_prev_year {
    description: "visits from non-Firefox browsers from previous year"
    type: sum
    sql: ${TABLE}.non_fx_sessions_smoothed_prev_year ;;
  }

  measure: non_fx_downloads_smoothed_prev_year {
    description: "downloads from non-Firefox browsers from previous year"
    type: sum
    sql: ${TABLE}.non_fx_downloads_smoothed_prev_year ;;
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
