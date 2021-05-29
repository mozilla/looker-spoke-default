view: feature_usage {
  derived_table: {
    sql: SELECT
          submission_date,
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
       CASE WHEN profile_age_in_days = 0 THEN 'new' ELSE 'exisitng' END as is_new,
          count(*) as cc,
          sum(CASE WHEN scalar_parent_os_environment_is_taskbar_pinned = true THEN 1 ELSE 0 END) as browser_pinned,
          count(*) - sum(CASE WHEN scalar_parent_os_environment_is_taskbar_pinned = true THEN 1 ELSE 0 END) as browser_not_pinned,
          sum(CASE WHEN is_default_browser = true THEN 1 ELSE 0 END) as browser_default,
          count(*) - sum(CASE WHEN is_default_browser = true THEN 1 ELSE 0 END) as browser_not_default
        FROM
          `moz-fx-data-shared-prod.telemetry.clients_daily`
        WHERE
          normalized_channel = 'release'
          AND submission_date >= '2021-05-18'
          AND sample_id = 1
        GROUP BY 1, 2, 3, 4
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: Desktop_OS {
    type: string
    sql: ${TABLE}.Desktop_OS ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: is_new {
    type: string
    sql: ${TABLE}.is_new ;;
  }

######################################################

  measure: cc {
    type:sum
    sql: ${TABLE}.cc;;
  }

  measure: browser_pinned {
    type:sum
    sql: ${TABLE}.browser_pinned;;
  }

  measure: browser_default {
    type:sum
    sql: ${TABLE}.browser_default;;
  }

  measure: browser_not_pinned {
    type:sum
    sql: ${TABLE}.browser_not_pinned;;
  }

  measure: browser_not_default {
    type:sum
    sql: ${TABLE}.browser_not_default;;
  }

}

#################################################################################
#################################################################################
#################################################################################
