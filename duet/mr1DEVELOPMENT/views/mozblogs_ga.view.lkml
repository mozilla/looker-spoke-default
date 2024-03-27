view: mozblogs_ga {
  derived_table: {
    sql: SELECT date, blog,
             CASE
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
             CASE
                 WHEN medium = 'organic' THEN 'organic search'
                 WHEN SOURCE = '(direct)' THEN 'direct'
                 WHEN medium = 'referral'
                      AND NOT (lower(SOURCE) LIKE '%firefox%'
                               OR lower(SOURCE) LIKE '%moz%') THEN '3rd party referral'
                 WHEN medium = 'email' THEN 'email'
                 WHEN medium = 'social' THEN 'social'
                 WHEN SOURCE = 'firefox-browser'
                      OR medium = 'firefox-browser' THEN 'FF browser surface'
                 WHEN medium = 'referral'
                      AND (lower(SOURCE) LIKE '%firefox%'
                           OR lower(SOURCE) LIKE '%moz%') THEN 'other mozilla website'
                 WHEN medium IN ('cpc',
                                 'paidsearch') THEN 'paid search'
                 WHEN SUBSTR(content, 1, 4) = 'A144' THEN 'paid ad'
                 ELSE 'UNKNOWN'
             END AS traffic_type,
             device_category,
             sum(sessions) AS sessions,
             sum(CASE
                     WHEN device_category = 'desktop' THEN sessions
                     ELSE 0
                 END) AS desktop_sessions,
             sum(CASE
                     WHEN device_category IN ('mobile', 'tablet') THEN sessions
                     ELSE 0
                 END) AS mobile_sessions
FROM `moz-fx-data-marketing-prod.ga.blogs_landing_page_summary`
WHERE date >= '2021-05-18'
GROUP BY 1,
         2,
         3,
         4,
         5,
         6,
         7
         ;;
  }

######################################################

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: blog {
    type: string
    sql: ${TABLE}.blog ;;
  }

  dimension: Desktop_OS {
    type: string
    sql: ${TABLE}.Desktop_OS ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: traffic_type {
    type: string
    sql: ${TABLE}.traffic_type ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }


######################################################

  measure: sessions {
    type:sum
    sql: ${TABLE}.sessions;;
    drill_fields: [detail*]
  }

  measure: desktop_sessions {
    type:sum
    sql: ${TABLE}.desktop_sessions;;
    drill_fields: [detail*]
  }

  measure: mobile_sessions {
    type:sum
    sql: ${TABLE}.mobile_sessions;;
    drill_fields: [detail*]
  }


######################################################

  set: detail {
    fields: [traffic_type]
  }
}
