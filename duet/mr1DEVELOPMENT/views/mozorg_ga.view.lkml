view: mozorg_ga {
  derived_table: {
    sql: SELECT
          date,
          CASE WHEN country in('United States',
                                'India',
                                'Germany',
                                'Brazil',
                                'France',
                                'Mexico',
                                'Italy',
                                'Spain',
                                'United Kingdom',
                                'Poland',
                                'Indonesia',
                                'Canada',
                                'Japan',
                                'Russia',
                                'Colombia',
                                'Turkey',
                                'Philippines',
                                'Argentina',
                                'Vietnam',
                                'China') THEN country ELSE 'ROW' END as country,
          device_category,
          CASE
              WHEN medium = 'organic' THEN 'organic search'
              WHEN SOURCE = '(direct)'
                   AND NOT ((page_name LIKE '%firstrun%'
                            OR page_name LIKE '%whatsnew%'
                            OR page_name LIKE '%releasenotes%'
                            OR page_name LIKE '%preferences-service%'
                            OR page_name LIKE '%about%'
                            OR page_name LIKE '%welcome%') AND browser = 'Firefox') THEN 'direct'
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
                            OR page_name LIKE '%welcome%') AND browser = 'Firefox')) THEN 'FF browser surface'
              WHEN medium = 'referral'
                   AND (lower(SOURCE) LIKE '%firefox%'
                        OR lower(SOURCE) LIKE '%moz%') THEN 'other mozilla website'
              WHEN medium IN ('cpc',
                              'paidsearch') THEN 'paid search'
              WHEN SUBSTR(ad_content, 1, 4) = 'A144' THEN 'paid ad'
              ELSE 'UNKNOWN'
          END AS traffic_type,
          sum(sessions) as sessions,
          sum(non_fx_sessions) as non_fx_sessions,
          sum(sessions - non_fx_sessions) as fx_sessions,
          sum(downloads) as downloads,
          sum(non_fx_downloads) as non_fx_downloads,
          sum(downloads - non_fx_downloads) as fx_downloads
        FROM
          `moz-fx-data-marketing-prod.ga_derived.www_site_landing_page_metrics_v1`
        WHERE
          date >= '2021-03-23'
        GROUP BY 1, 2, 3, 4
         ;;
  }

######################################################

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: traffic_type {
    type: string
    sql: ${TABLE}.traffic_type ;;
  }

######################################################

  measure: sessions {
    type: sum
    sql: ${TABLE}.sessions;;
    drill_fields: [detail*]
  }

  measure: non_fx_sessions {
    type: sum
    sql: ${TABLE}.non_fx_sessions;;
    drill_fields: [detail*]
  }

  measure: fx_sessions {
    type: sum
    sql: ${TABLE}.fx_sessions;;
    drill_fields: [detail*]
  }

  measure: downloads {
    type: sum
    sql: ${TABLE}.downloads;;
    drill_fields: [detail*]
  }

  measure: non_fx_downloads {
    type: sum
    sql: ${TABLE}.non_fx_downloads;;
    drill_fields: [detail*]
  }

  measure: fx_downloads {
    type: sum
    sql: ${TABLE}.fx_downloads;;
    drill_fields: [detail*]
  }


######################################################

  set: detail {
    fields: [date, country, device_category, traffic_type]
  }
}
