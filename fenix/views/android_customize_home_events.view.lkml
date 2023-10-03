
view: android_customize_home_events {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.events_unnested`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-09-21'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,

          CASE WHEN event_category = 'app_menu' AND event_name = 'customize_homepage' THEN 1 ELSE 0 END as app_menu_customize_homepage,
          CASE WHEN event_category = 'home_screen' AND event_name = 'customize_home_clicked' THEN 1 ELSE 0 END as home_page_customize_home_clicked


          FROM `mozdata.fenix.events_unnested`
      where DATE(submission_timestamp) >= '2021-09-21'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date

      --app_menu_customize_homepage
      , 100*SUM(app_menu_customize_homepage) as app_menu_customize_homepage
      , 100*COUNT(DISTINCT CASE WHEN app_menu_customize_homepage > 0 THEN client_id END) AS app_menu_customize_homepage_users
      --home_page_customize_home_clicked
      , 100*SUM(home_page_customize_home_clicked) as home_page_customize_home_clicked
      , 100*COUNT(DISTINCT CASE WHEN home_page_customize_home_clicked > 0 THEN client_id END) AS home_page_customize_home_clicked_users

      FROM product_features
      where submission_date >= '2021-09-21'
      group by 1
      )

      select d.submission_date
      , dau
      , app_menu_customize_homepage
      , app_menu_customize_homepage_users
      , home_page_customize_home_clicked
      , home_page_customize_home_clicked_users

      from dau_segments d
      LEFT JOIN product_features_agg p
      ON d.submission_date = p.submission_date ;;
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

  measure: app_menu_customize_homepage {
    type: sum
    sql: ${TABLE}.app_menu_customize_homepage ;;
  }

  measure: app_menu_customize_homepage_users {
    type: sum
    sql: ${TABLE}.app_menu_customize_homepage_users ;;
  }

  measure: home_page_customize_home_clicked {
    type: sum
    sql: ${TABLE}.home_page_customize_home_clicked ;;
  }

  measure: home_page_customize_home_clicked_users {
    type: sum
    sql: ${TABLE}.home_page_customize_home_clicked_users ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      app_menu_customize_homepage,
      app_menu_customize_homepage_users,
      home_page_customize_home_clicked,
      home_page_customize_home_clicked_users
    ]
  }
}
