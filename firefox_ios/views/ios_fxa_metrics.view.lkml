
view: ios_fxa_metrics {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.metrics`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2021-03-17'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(metrics.counter.sync_create_account_pressed), 0) AS sync_create_account_pressed,
          COALESCE(SUM(metrics.counter.sync_open_tab), 0) AS sync_open_tab,
          COALESCE(SUM(metrics.counter.sync_sign_in_sync_pressed), 0) AS sync_sign_in_sync_pressed

          FROM `mozdata.firefox_ios.metrics`
      where DATE(submission_timestamp) >= '2021-03-17'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --sync_create_account_pressed
          100*COUNT(DISTINCT CASE WHEN sync_create_account_pressed > 0 THEN client_id END) AS sync_create_account_pressed_users,
          100*COALESCE(SUM(sync_create_account_pressed), 0) AS sync_create_account_pressed,
          --sync_open_tab
          100*COUNT(DISTINCT CASE WHEN sync_open_tab > 0 THEN client_id END) AS sync_open_tab_users,
          100*COALESCE(SUM(sync_open_tab), 0) AS sync_open_tab,
          --sync_sign_in_sync_pressed
          100*COUNT(DISTINCT CASE WHEN sync_sign_in_sync_pressed > 0 THEN client_id END) AS sync_sign_in_sync_pressed_users,
          100*COALESCE(SUM(sync_sign_in_sync_pressed), 0) AS sync_sign_in_sync_pressed
          FROM product_features
      where submission_date >= '2021-03-17'
      group by 1)


      select submission_date
      , dau
      , sync_create_account_pressed_users
      , sync_create_account_pressed
      , sync_open_tab_users
      , sync_open_tab
      , sync_sign_in_sync_pressed_users
      , sync_sign_in_sync_pressed
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

  measure: sync_create_account_pressed_users {
    type: sum
    sql: ${TABLE}.sync_create_account_pressed_users ;;
  }

  measure: sync_create_account_pressed {
    type: sum
    sql: ${TABLE}.sync_create_account_pressed ;;
  }

  measure: sync_open_tab_users {
    type: sum
    sql: ${TABLE}.sync_open_tab_users ;;
  }

  measure: sync_open_tab {
    type: sum
    sql: ${TABLE}.sync_open_tab ;;
  }

  measure: sync_sign_in_sync_pressed_users {
    type: sum
    sql: ${TABLE}.sync_sign_in_sync_pressed_users ;;
  }

  measure: sync_sign_in_sync_pressed {
    type: sum
    sql: ${TABLE}.sync_sign_in_sync_pressed ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      sync_create_account_pressed_users,
      sync_create_account_pressed,
      sync_open_tab_users,
      sync_open_tab,
      sync_sign_in_sync_pressed_users,
      sync_sign_in_sync_pressed
    ]
  }
}
