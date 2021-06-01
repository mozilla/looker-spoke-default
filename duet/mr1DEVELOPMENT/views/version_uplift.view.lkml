view: version_uplift {
  derived_table: {
    sql:
    SELECT submission_date,
          CASE
           WHEN os = 'Darwin' THEN 'Mac'
           WHEN os = 'Linux' THEN 'Linux'
           WHEN os = 'Windows_NT' THEN 'Windows'
           ELSE 'Other'
       END AS Desktop_OS,
       CASE
           WHEN country IN ('AR',
                            'PH',
                            'TR',
                            'CO',
                            'US',
                            'DE',
                            'FR',
                            'CN',
                            'PL',
                            'IN',
                            'RU',
                            'BR',
                            'IT',
                            'ID',
                            'GB',
                            'ES',
                            'JP',
                            'CA',
                            'VN',
                            'MX') THEN country
           ELSE 'ROW'
       END AS country,
       date('2021-06-01') as release_date,
       count(DISTINCT client_id) AS cc,
       count(DISTINCT CASE
                          WHEN substr(app_version, 1, 2) >= '89' THEN client_id
                          ELSE NULL
                      END) AS Updated,
       count(DISTINCT CASE
                          WHEN NOT substr(app_version, 1, 2) >= '89' THEN client_id
                          ELSE NULL
                      END) AS Non_updated
FROM `moz-fx-data-shared-prod.telemetry.clients_daily`
WHERE submission_date >= '2021-05-18' -- change this to real release date

  AND normalized_channel = 'release'
GROUP BY 1,
         2,
         3
       ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: desktop_OS {
    type: string
    sql: ${TABLE}.desktop_OS ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: release_date {
    type: date
    datatype: date
    sql: ${TABLE}.release_date ;;
  }

######################################################

  measure: cc {
    type:sum
    sql: ${TABLE}.cc;;
  }

  measure: Updated {
    type: sum
    sql: ${TABLE}.Updated;;
  }

  measure: Non_updated {
    type: sum
    sql: ${TABLE}.Non_updated;;
  }

  measure: uplift {
    type: number
    sql: ${Updated} / ${cc} * 100;;
  }


######################################################

}




view: version_uplift_mobile {
  derived_table: {
    sql:WITH android AS
        (SELECT submission_date,
                CASE
                 WHEN country IN ('AR',
                                  'PH',
                                  'TR',
                                  'CO',
                                  'US',
                                  'DE',
                                  'FR',
                                  'CN',
                                  'PL',
                                  'IN',
                                  'RU',
                                  'BR',
                                  'IT',
                                  'ID',
                                  'GB',
                                  'ES',
                                  'JP',
                                  'CA',
                                  'VN',
                                  'MX') THEN country
                 ELSE 'ROW'
             END AS country,
                canonical_name,
                count(DISTINCT client_id) AS cc,
                count(DISTINCT CASE
                                   WHEN SUBSTR(app_version, 1, 2) >= '89' THEN client_id
                                   ELSE NULL
                               END) AS Updated,
                count(DISTINCT CASE
                                   WHEN NOT SUBSTR(app_version, 1, 2) >= '89' THEN client_id
                                   ELSE NULL
                               END) AS Non_updated
         FROM telemetry.nondesktop_clients_last_seen
         WHERE submission_date >= '2021-05-18'
           AND days_since_seen = 0
           AND canonical_name IN ('Firefox for Android (Fennec)',
                                  'Firefox for Android (Fenix)')
           AND normalized_channel = 'release'
         GROUP BY 1,
                  2,
                  3),
           IOS AS
        (SELECT submission_date,
                CASE
                 WHEN country IN ('AR',
                                  'PH',
                                  'TR',
                                  'CO',
                                  'US',
                                  'DE',
                                  'FR',
                                  'CN',
                                  'PL',
                                  'IN',
                                  'RU',
                                  'BR',
                                  'IT',
                                  'ID',
                                  'GB',
                                  'ES',
                                  'JP',
                                  'CA',
                                  'VN',
                                  'MX') THEN country
                 ELSE 'ROW'
             END AS country,
                canonical_name,
                count(DISTINCT client_id) AS cc,
                count(DISTINCT CASE
                                   WHEN SUBSTR(app_version, 1, 2) >= '34' THEN client_id
                                   ELSE NULL
                               END) AS Updated,
                count(DISTINCT CASE
                                   WHEN NOT SUBSTR(app_version, 1, 2) >= '34' THEN client_id
                                   ELSE NULL
                               END) AS Non_updated
         FROM telemetry.nondesktop_clients_last_seen
         WHERE submission_date >= '2021-05-18'
           AND days_since_seen = 0
           AND canonical_name IN ('Firefox for iOS')
           AND normalized_channel = 'release'
         GROUP BY 1,
                  2,
                  3)
      SELECT *
      FROM
        (SELECT *
         FROM android)
      UNION ALL
        (SELECT *
         FROM IOS)
             ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: canonical_name {
    type: string
    sql: ${TABLE}.canonical_name ;;
  }

######################################################

  measure: cc {
    type:sum
    sql: ${TABLE}.cc;;
  }

  measure: Updated {
    type: sum
    sql: ${TABLE}.Updated;;
  }

  measure: Non_updated {
    type: sum
    sql: ${TABLE}.Non_updated;;
  }

  measure: uplift {
    type: number
    sql: ${Updated} / ${cc} * 100;;
  }
}
