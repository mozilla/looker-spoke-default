
view: ios_default_browser_metrics {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.metrics`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2021-01-01'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(metrics.counter.app_opened_as_default_browser), 0) AS app_opened_as_default_browser,
          COALESCE(SUM(metrics.counter.settings_menu_set_as_default_browser_pressed), 0) AS settings_menu_set_as_default_browser_pressed

          FROM `mozdata.firefox_ios.metrics`
      where DATE(submission_timestamp) >= '2021-01-01'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --app_opened_as_default_browser
          100*COUNT(DISTINCT CASE WHEN app_opened_as_default_browser > 0 THEN client_id END) AS app_opened_as_default_browser_users,
          100*COALESCE(SUM(app_opened_as_default_browser), 0) AS app_opened_as_default_browser,
          -- settings_menu_set_as_default_browser_pressed
          100*COUNT(DISTINCT CASE WHEN settings_menu_set_as_default_browser_pressed > 0 THEN client_id END) AS settings_menu_set_as_default_browser_pressed_users,
          100*COALESCE(SUM(settings_menu_set_as_default_browser_pressed), 0) AS settings_menu_set_as_default_browser_pressed,

          FROM product_features
      where submission_date >= '2021-01-01'
      group by 1)


      select submission_date,
      dau,
      app_opened_as_default_browser_users,
      app_opened_as_default_browser,
      settings_menu_set_as_default_browser_pressed_users,
      settings_menu_set_as_default_browser_pressed

      from dau_segments
      JOIN product_features_agg
      USING (submission_date) ;;
  }

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: app_opened_as_default_browser_users {
    type: sum
    sql: ${TABLE}.app_opened_as_default_browser_users ;;
  }

  measure: app_opened_as_default_browser {
    type: sum
    sql: ${TABLE}.app_opened_as_default_browser ;;
  }

  measure: settings_menu_set_as_default_browser_pressed_users {
    type: sum
    sql: ${TABLE}.settings_menu_set_as_default_browser_pressed_users ;;
  }

  measure: settings_menu_set_as_default_browser_pressed {
    type: sum
    sql: ${TABLE}.settings_menu_set_as_default_browser_pressed ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      app_opened_as_default_browser_users,
      app_opened_as_default_browser,
      settings_menu_set_as_default_browser_pressed_users,
      settings_menu_set_as_default_browser_pressed
    ]
  }
}
