
view: ios_customize_home_metrics {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.metrics`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2021-10-18'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(CASE WHEN metrics.boolean.preferences_jump_back_in THEN 1 ELSE 0 END), 0) AS preferences_jump_back_in,
          COALESCE(SUM(CASE WHEN metrics.boolean.preferences_recently_visited THEN 1 ELSE 0 END), 0) AS preferences_recently_visited,
          COALESCE(SUM(CASE WHEN metrics.boolean.preferences_recently_saved THEN 1 ELSE 0 END), 0) AS preferences_recently_saved,
          COALESCE(SUM(CASE WHEN metrics.boolean.preferences_pocket THEN 1 ELSE 0 END), 0) AS preferences_pocket,
          COALESCE(SUM(metrics.counter.app_menu_customize_homepage), 0) AS app_menu_customize_homepage,
          COALESCE(SUM(metrics.counter.firefox_home_page_customize_homepage_button), 0) AS firefox_home_page_customize_homepage_button

          FROM `mozdata.firefox_ios.metrics`
      where DATE(submission_timestamp) >= '2021-10-18'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --preferences_jump_back_in
          100*COUNT(DISTINCT CASE WHEN preferences_jump_back_in > 0 THEN client_id END) AS preferences_jump_back_in_users,
          100*COALESCE(SUM(preferences_jump_back_in), 0) AS preferences_jump_back_in,
          -- Preferences Recently Visited
          100*COUNT(DISTINCT CASE WHEN preferences_recently_visited > 0 THEN client_id END) AS preferences_recently_visited_users,
          100*COALESCE(SUM(preferences_recently_visited), 0) AS preferences_recently_visited,

          -- Preferences Recently Saved
          100*COUNT(DISTINCT CASE WHEN preferences_recently_saved > 0 THEN client_id END) AS preferences_recently_saved_users,
          100*COALESCE(SUM(preferences_recently_saved), 0) AS preferences_recently_saved,

          -- Preferences Pocket
          100*COUNT(DISTINCT CASE WHEN preferences_pocket > 0 THEN client_id END) AS preferences_pocket_users,
          100*COALESCE(SUM(preferences_pocket), 0) AS preferences_pocket,

          -- App Menu Customize Homepage
          100*COUNT(DISTINCT CASE WHEN app_menu_customize_homepage > 0 THEN client_id END) AS app_menu_customize_homepage_users,
          100*COALESCE(SUM(app_menu_customize_homepage), 0) AS app_menu_customize_homepage,

          -- Firefox Home Page Customize Homepage Button
          100*COUNT(DISTINCT CASE WHEN firefox_home_page_customize_homepage_button > 0 THEN client_id END) AS firefox_home_page_customize_homepage_button_users,
          100*COALESCE(SUM(firefox_home_page_customize_homepage_button), 0) AS firefox_home_page_customize_homepage_button

          FROM product_features
      where submission_date >= '2021-10-18'
      group by 1)


      select submission_date,
      dau,
      preferences_jump_back_in_users,
      preferences_jump_back_in,
      preferences_recently_visited_users,
      preferences_recently_visited,
      preferences_recently_saved_users,
      preferences_recently_saved,
      preferences_pocket_users,
      preferences_pocket,
      app_menu_customize_homepage_users,
      app_menu_customize_homepage,
      firefox_home_page_customize_homepage_button_users,
      firefox_home_page_customize_homepage_button

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

  measure: preferences_jump_back_in_users {
    type: sum
    sql: ${TABLE}.preferences_jump_back_in_users ;;
  }

  measure: preferences_jump_back_in {
    type: sum
    sql: ${TABLE}.preferences_jump_back_in ;;
  }

  measure: preferences_recently_visited_users {
    type: sum
    sql: ${TABLE}.preferences_recently_visited_users ;;
  }

  measure: preferences_recently_visited {
    type: sum
    sql: ${TABLE}.preferences_recently_visited ;;
  }

  measure: preferences_recently_saved_users {
    type: sum
    sql: ${TABLE}.preferences_recently_saved_users ;;
  }

  measure: preferences_recently_saved {
    type: sum
    sql: ${TABLE}.preferences_recently_saved ;;
  }

  measure: preferences_pocket_users {
    type: sum
    sql: ${TABLE}.preferences_pocket_users ;;
  }

  measure: preferences_pocket {
    type: sum
    sql: ${TABLE}.preferences_pocket ;;
  }

  measure: app_menu_customize_homepage_users {
    type: sum
    sql: ${TABLE}.app_menu_customize_homepage_users ;;
  }

  measure: app_menu_customize_homepage {
    type: sum
    sql: ${TABLE}.app_menu_customize_homepage ;;
  }

  measure: firefox_home_page_customize_homepage_button_users {
    type: sum
    sql: ${TABLE}.firefox_home_page_customize_homepage_button_users ;;
  }

  measure: firefox_home_page_customize_homepage_button {
    type: sum
    sql: ${TABLE}.firefox_home_page_customize_homepage_button ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      preferences_jump_back_in_users,
      preferences_jump_back_in,
      preferences_recently_visited_users,
      preferences_recently_visited,
      preferences_recently_saved_users,
      preferences_recently_saved,
      preferences_pocket_users,
      preferences_pocket,
      app_menu_customize_homepage_users,
      app_menu_customize_homepage,
      firefox_home_page_customize_homepage_button_users,
      firefox_home_page_customize_homepage_button
    ]
  }
}
