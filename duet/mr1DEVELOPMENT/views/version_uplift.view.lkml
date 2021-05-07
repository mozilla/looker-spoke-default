view: version_uplift {
  derived_table: {
    sql: SELECT submission_date,
       CASE
           WHEN os IN ('Darwin',
                       'Linux') THEN os
           WHEN os = 'Windows_NT'
                AND os_version = '10.0' THEN 'Windows 10'
           WHEN os = 'Windows_NT'
                AND os_version != '10.0' THEN 'Windows Older'
           ELSE 'other'
       END AS os_type,
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
       count(DISTINCT client_id) AS cc,
       count(DISTINCT CASE
                          WHEN substr(app_version, 1, 2) >= '87' THEN client_id
                          ELSE NULL
                      END) AS cc_latest,
       count(DISTINCT CASE
                          WHEN NOT substr(app_version, 1, 2) >= '87' THEN client_id
                          ELSE NULL
                      END) AS cc_older
FROM telemetry.clients_daily
WHERE submission_date >= '2021-03-23' -- change this to real release date

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

  dimension: os_type {
    type: string
    sql: ${TABLE}.os_type ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

######################################################

  measure: cc {
    type: sum
    sql: ${TABLE}.cc;;
    drill_fields: [detail*]
  }

  measure: cc_latest {
    type: sum
    sql: ${TABLE}.cc_latest;;
    drill_fields: [detail*]
  }

  measure: cc_older {
    type: sum
    sql: ${TABLE}.cc_older;;
    drill_fields: [detail*]
  }

  measure: uplift {
    type: number
    sql: ${cc_latest} / ${cc} * 100;;
    drill_fields: [detail*]
  }


######################################################


  set: detail {
    fields: [submission_date, os_type, country]
  }
}
