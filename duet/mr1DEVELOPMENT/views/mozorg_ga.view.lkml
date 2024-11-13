view: mozorg_ga {
  derived_table: {
    sql: WITH website_stats AS
        (SELECT date, CASE
                          WHEN operating_system IN ('Windows',
                                                    'Linux') THEN operating_system
                          WHEN operating_system = 'Macintosh' THEN 'Mac'
                          ELSE 'Other'
                      END AS Desktop_OS,
                      CASE
                          WHEN country = 'United States' THEN 'US'
                          WHEN country = 'India' THEN 'IN'
                          WHEN country = 'Germany' THEN 'DE'
                          WHEN country = 'Brazil' THEN 'BR'
                          WHEN country = 'France' THEN 'FR'
                          WHEN country = 'Mexico' THEN 'MX'
                          WHEN country = 'Italy' THEN 'IT'
                          WHEN country = 'Spain' THEN 'ES'
                          WHEN country = 'United Kingdom' THEN 'UK'
                          WHEN country = 'Poland' THEN 'PL'
                          WHEN country = 'Indonesia' THEN 'ID'
                          WHEN country = 'Canada' THEN 'CA'
                          WHEN country = 'Japan' THEN 'JP'
                          WHEN country = 'Russia' THEN 'RU'
                          WHEN country = 'Colombia' THEN 'CO'
                          WHEN country = 'Turkey' THEN 'TR'
                          WHEN country = 'Philippines' THEN 'PH'
                          WHEN country = 'Argentina' THEN 'AR'
                          WHEN country = 'Vietnam' THEN 'VN'
                          WHEN country = 'China' THEN 'CN'
                          ELSE 'ROW'
                      END AS country,
                      CASE
                          WHEN browser IN ('Chrome',
                                           'Edge',
                                           'Internet Explorer',
                                           'Safari',
                                           'Firefox') THEN browser
                          ELSE 'Other'
                      END AS browser,
                      device_category,
                      CASE
                          WHEN medium = 'organic' THEN 'organic search'
                          WHEN SOURCE = '(direct)'
                               AND NOT ((page_name LIKE '%firstrun%'
                                         OR page_name LIKE '%whatsnew%'
                                         OR page_name LIKE '%releasenotes%'
                                         OR page_name LIKE '%preferences-service%'
                                         OR page_name LIKE '%about%'
                                         OR page_name LIKE '%welcome%')
                                        AND browser = 'Firefox') THEN 'direct'
                          WHEN medium = 'referral'
                               AND NOT (lower(SOURCE) LIKE '%firefox%'
                                        OR lower(SOURCE) LIKE '%moz%') THEN '3rd party referral'
                          WHEN medium = 'email' THEN 'email'
                          WHEN medium = 'social' THEN 'social'
                          WHEN SOURCE = 'firefox-browser'
                               OR medium = 'firefox-browser'
                               OR (SOURCE = '(direct)'
                                   AND ((page_name LIKE '%firstrun%'
                                         OR page_name LIKE '%whatsnew%'
                                         OR page_name LIKE '%releasenotes%'
                                         OR page_name LIKE '%preferences-service%'
                                         OR page_name LIKE '%about%'
                                         OR page_name LIKE '%welcome%')
                                        AND browser = 'Firefox')) THEN 'FF browser surface'
                          WHEN medium = 'referral'
                               AND (lower(SOURCE) LIKE '%firefox%'
                                    OR lower(SOURCE) LIKE '%moz%') THEN 'other mozilla website'
                          WHEN medium IN ('cpc',
                                          'paidsearch') THEN 'paid search'
                          WHEN SUBSTR(ad_content, 1, 4) = 'A144' THEN 'paid ad'
                          ELSE 'UNKNOWN'
                      END AS traffic_type,
                      sum(sessions) AS sessions,
                      sum(non_fx_sessions) AS non_fx_sessions,
                      sum(downloads) AS downloads,
                      sum(non_fx_downloads) AS non_fx_downloads
         FROM `moz-fx-data-shared-prod.mozilla_org.www_site_landing_page_metrics`
         WHERE date >= '2020-04-18'
         GROUP BY 1,
                  2,
                  3,
                  4,
                  5,
                  6)
      SELECT a.*
      EXCEPT (doy), a.non_fx_downloads AS non_fx_downloads_2021,
                    b.non_fx_downloads AS non_fx_downloads_2020
      FROM
        (SELECT *,
                EXTRACT(DAYOFYEAR
                        FROM date(date)) AS doy
         FROM website_stats
         WHERE date >= '2021-05-18') a
      LEFT JOIN
        (SELECT *,
                EXTRACT(DAYOFYEAR
                        FROM date(date)) AS doy
         FROM website_stats
         WHERE date BETWEEN '2020-04-18' AND '2020-12-31') b ON (a.Desktop_OS = b.Desktop_OS
                                           AND a.browser = b.browser
                                           AND a.country = b.country
                                           AND a.traffic_type = b.traffic_type
                                           AND a.device_category = b.device_category
                                           AND a.doy = b.doy)
               ;;
  }

######################################################

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: Desktop_OS {
    type: string
    sql: ${TABLE}.Desktop_OS ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: traffic_type {
    type: string
    sql: ${TABLE}.traffic_type ;;
  }

######################################################

  measure: sessions {
    type:sum
    sql: ${TABLE}.sessions;;
  }

  measure: non_fx_sessions {
    type:sum
    sql: ${TABLE}.non_fx_sessions;;
  }

  measure: downloads {
    type:sum
    sql: ${TABLE}.downloads;;
  }

  measure: non_fx_downloads {
    type:sum
    sql: ${TABLE}.non_fx_downloads;;
  }

  measure: non_fx_downloads_2020 {
    type:sum
    sql: ${TABLE}.non_fx_downloads_2020;;
  }

  measure: non_fx_downloads_2021 {
    type:sum
    sql: ${TABLE}.non_fx_downloads_2021;;
  }

}
