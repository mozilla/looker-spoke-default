view: feature_usage {
  derived_table: {
    sql: SELECT
          submission_date,
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
          count(*) as cc,
          sum(CASE WHEN scalar_parent_os_environment_is_taskbar_pinned = true THEN 1 ELSE 0 END) as browser_pinned,
          count(*) - sum(CASE WHEN scalar_parent_os_environment_is_taskbar_pinned = true THEN 1 ELSE 0 END) as browser_not_pinned,
          sum(CASE WHEN is_default_browser = true THEN 1 ELSE 0 END) as browser_default,
          count(*) - sum(CASE WHEN is_default_browser = true THEN 1 ELSE 0 END) as browser_not_default
        FROM
          `moz-fx-data-shared-prod.telemetry.clients_daily`
        WHERE
          normalized_channel = 'release'
          AND submission_date >= '2021-03-23'
        GROUP BY 1, 2, 3
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

  measure: browser_pinned {
    type: sum
    sql: ${TABLE}.browser_pinned;;
    drill_fields: [detail*]
  }

  measure: browser_default {
    type: sum
    sql: ${TABLE}.browser_default;;
    drill_fields: [detail*]
  }

  measure: browser_not_pinned {
    type: sum
    sql: ${TABLE}.browser_not_pinned;;
    drill_fields: [detail*]
  }

  measure: browser_not_default {
    type: sum
    sql: ${TABLE}.browser_not_default;;
    drill_fields: [detail*]
  }

######################################################

  set: detail {
    fields: [submission_date, os_type, country]
  }
}
