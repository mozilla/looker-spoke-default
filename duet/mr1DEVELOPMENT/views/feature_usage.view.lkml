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



view: feature_usage_themes {
  derived_table: {
    sql: WITH theme_data AS
        (SELECT submission_date,
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
                count(DISTINCT CASE
                                   WHEN active_theme.addon_id = "default-theme@mozilla.org" THEN client_id
                                   ELSE NULL
                               END) AS system_default_theme, -- note treating this as a non-customized state
                count(DISTINCT CASE
                                   WHEN active_theme.addon_id = "firefox-alpenglow@mozilla.org" THEN client_id
                                   ELSE NULL
                               END) AS alpenglow_theme,
                count(DISTINCT CASE
                                   WHEN active_theme.addon_id = "firefox-compact-light.org" THEN client_id
                                   ELSE NULL
                               END) AS light_theme,
                count(DISTINCT CASE
                                   WHEN active_theme.addon_id = "firefox-compact-dark@mozilla.org" THEN client_id
                                   ELSE NULL
                               END) AS dark_theme,
                count(DISTINCT CASE
                                   WHEN active_theme.addon_id IN ("firefox-alpenglow@mozilla.org", "firefox-compact-light@mozilla.org", "firefox-compact-dark@mozilla.org") THEN client_id
                                   ELSE NULL
                               END) AS customized_theme
         FROM `moz-fx-data-shared-prod.telemetry.main_summary`
         WHERE submission_date >= '2021-05-18'
           AND active_theme.addon_id IN ("default-theme@mozilla.org",
                                         "firefox-alpenglow@mozilla.org",
                                         "firefox-compact-light@mozilla.org",
                                         "firefox-compact-dark@mozilla.org")
           AND active_theme.user_disabled = FALSE
           AND active_theme.app_disabled = FALSE
           AND sample_id = 1
           AND normalized_channel = 'release'
         GROUP BY 1,
                  2,
                  3),
           baseline AS
        (SELECT submission_date,
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
                count(*) AS cc
         FROM `moz-fx-data-shared-prod.telemetry.clients_daily`
         WHERE normalized_channel = 'release'
           AND submission_date >= '2021-05-18'
           AND sample_id = 1
         GROUP BY 1,
                  2,
                  3)
      SELECT a.*,
             coalesce(b.system_default_theme, 0) AS system_default_theme,
             coalesce(b.alpenglow_theme, 0) AS alpenglow_theme,
             coalesce(b.light_theme, 0) AS light_theme,
             coalesce(b.dark_theme, 0) AS dark_theme,
             coalesce(b.customized_theme, 0) AS customized_theme,
             a.cc - coalesce(b.customized_theme, 0) AS non_customized
      FROM baseline a
      LEFT JOIN theme_data b ON (a.submission_date = b.submission_date
                                 AND a.Desktop_OS = b.Desktop_OS
                                 AND a.country = b.country)
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


######################################################

  measure: cc {
    type:sum
    sql: ${TABLE}.cc;;
  }

  measure: system_default_theme {
    type:sum
    sql: ${TABLE}.system_default_theme;;
  }

  measure: alpenglow_theme {
    type:sum
    sql: ${TABLE}.alpenglow_theme;;
  }

  measure: light_theme {
    type:sum
    sql: ${TABLE}.light_theme;;
  }

  measure: dark_theme {
    type:sum
    sql: ${TABLE}.dark_theme;;
  }

  measure: customized_theme {
    type:sum
    sql: ${TABLE}.customized_theme;;
  }

  measure: non_customized {
    type:sum
    sql: ${TABLE}.non_customized;;
  }

}

#################################################################################
#################################################################################
#################################################################################
