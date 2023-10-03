
view: ios_privacy_events {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.events_unnested`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2022-05-16'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          CASE WHEN event_category = 'preferences' AND event_name = 'private_browsing_button_tapped' AND extra.key = 'is_private'
          AND extra.value = 'true' THEN 1 ELSE 0 END as private_browsing_button_tapped_enter_private_mode,
          CASE WHEN event_category = 'preferences' AND event_name = 'private_browsing_button_tapped' THEN 1 ELSE 0 END as private_browsing_button_tapped,
          CASE WHEN event_category = 'tabs_tray' AND event_name = 'private_browsing_icon_tapped' THEN 1 ELSE 0 END as private_browsing_icon_tapped,
          CASE WHEN event_category = 'app_icon' AND event_name = 'new_private_tab_tapped' THEN 1 ELSE 0 END as app_icon_new_private_tab_tapped,
          CASE WHEN event_category = 'tabs_tray' AND event_name = 'new_private_tab_tapped' THEN 1 ELSE 0 END as tabs_tray_new_private_tab_tapped

          FROM `mozdata.firefox_ios.events_unnested`
          LEFT JOIN UNNEST(event_extra) AS extra
      where DATE(submission_timestamp) >= '2022-05-16'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date,
      --private_browsing_button_tapped
      100*SUM(private_browsing_button_tapped) as private_browsing_button_tapped,
      100*COUNT(DISTINCT CASE WHEN private_browsing_button_tapped > 0 THEN client_id END) AS private_browsing_button_tapped_users,
      --private_browsing_button_tapped_enter_private_mode
      100*SUM(private_browsing_button_tapped_enter_private_mode) as private_browsing_button_tapped_enter_private_mode,
      100*COUNT(DISTINCT CASE WHEN private_browsing_button_tapped_enter_private_mode > 0 THEN client_id END) AS private_browsing_button_tapped_enter_private_mode_users,

      -- Private Browsing Icon Tapped
      100*SUM(private_browsing_icon_tapped) as private_browsing_icon_tapped,
      100*COUNT(DISTINCT CASE WHEN private_browsing_icon_tapped > 0 THEN client_id END) AS private_browsing_icon_tapped_users,

      -- App Icon New Private Tab Tapped
      100*SUM(app_icon_new_private_tab_tapped) as app_icon_new_private_tab_tapped,
      100*COUNT(DISTINCT CASE WHEN app_icon_new_private_tab_tapped > 0 THEN client_id END) AS app_icon_new_private_tab_tapped_users,

      -- Tabs Tray New Private Tab Tapped
      100*SUM(tabs_tray_new_private_tab_tapped) as tabs_tray_new_private_tab_tapped,
      100*COUNT(DISTINCT CASE WHEN tabs_tray_new_private_tab_tapped > 0 THEN client_id END) AS tabs_tray_new_private_tab_tapped_users

      FROM product_features
      where submission_date >= '2022-05-16'
      group by 1
      )

      select d.submission_date,
          dau,
          private_browsing_button_tapped,
          private_browsing_button_tapped_users,
          private_browsing_button_tapped_enter_private_mode,
          private_browsing_button_tapped_enter_private_mode_users,
          private_browsing_icon_tapped,
          private_browsing_icon_tapped_users,
          app_icon_new_private_tab_tapped,
          app_icon_new_private_tab_tapped_users,
          tabs_tray_new_private_tab_tapped,
          tabs_tray_new_private_tab_tapped_users


      from dau_segments d
      LEFT JOIN product_features_agg p
      ON d.submission_date = p.submission_date
      ORDER BY d.submission_date ;;
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

  measure: private_browsing_button_tapped {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped ;;
  }

  measure: private_browsing_button_tapped_users {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_users ;;
  }

  measure: private_browsing_button_tapped_enter_private_mode {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_enter_private_mode ;;
  }

  measure: private_browsing_button_tapped_enter_private_mode_users {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_enter_private_mode_users ;;
  }

  measure: private_browsing_icon_tapped {
    type: sum
    sql: ${TABLE}.private_browsing_icon_tapped ;;
  }

  measure: private_browsing_icon_tapped_users {
    type: sum
    sql: ${TABLE}.private_browsing_icon_tapped_users ;;
  }

  measure: app_icon_new_private_tab_tapped {
    type: sum
    sql: ${TABLE}.app_icon_new_private_tab_tapped ;;
  }

  measure: app_icon_new_private_tab_tapped_users {
    type: sum
    sql: ${TABLE}.app_icon_new_private_tab_tapped_users ;;
  }

  measure: tabs_tray_new_private_tab_tapped {
    type: sum
    sql: ${TABLE}.tabs_tray_new_private_tab_tapped ;;
  }

  measure: tabs_tray_new_private_tab_tapped_users {
    type: sum
    sql: ${TABLE}.tabs_tray_new_private_tab_tapped_users ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      private_browsing_button_tapped,
      private_browsing_button_tapped_users,
      private_browsing_button_tapped_enter_private_mode,
      private_browsing_button_tapped_enter_private_mode_users,
      private_browsing_icon_tapped,
      private_browsing_icon_tapped_users,
      app_icon_new_private_tab_tapped,
      app_icon_new_private_tab_tapped_users,
      tabs_tray_new_private_tab_tapped,
      tabs_tray_new_private_tab_tapped_users
    ]
  }
}
