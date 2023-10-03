
view: ios_fxa_events {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.events_unnested`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2022-03-21'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          CASE WHEN event_category = 'sync' AND event_name = 'disconnect' THEN 1 ELSE 0 END as disconnect,
          CASE WHEN event_category = 'sync' AND event_name = 'login_completed_view' THEN 1 ELSE 0 END as login_completed_view,
          CASE WHEN event_category = 'sync' AND event_name = 'login_token_view' THEN 1 ELSE 0 END as login_token_view,
          CASE WHEN event_category = 'sync' AND event_name = 'login_view' THEN 1 ELSE 0 END as login_view,
          CASE WHEN event_category = 'sync' AND event_name = 'paired' THEN 1 ELSE 0 END as paired,
          CASE WHEN event_category = 'sync' AND event_name = 'registration_code_view' THEN 1 ELSE 0 END as registration_code_view,
          CASE WHEN event_category = 'sync' AND event_name = 'registration_completed_view' THEN 1 ELSE 0 END as registration_completed_view,
          CASE WHEN event_category = 'sync' AND event_name = 'registration_view' THEN 1 ELSE 0 END as registration_view,
          CASE WHEN event_category = 'sync' AND event_name = 'use_email' THEN 1 ELSE 0 END as use_email

          FROM `mozdata.firefox_ios.events_unnested`
      where DATE(submission_timestamp) >= '2022-03-21'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date,
      --disconnect
      100*SUM(disconnect) as disconnect,
      100*COUNT(DISTINCT CASE WHEN disconnect > 0 THEN client_id END) AS disconnect_users,
       -- Login Completed View
      100*SUM(login_completed_view) as login_completed_view,
      100*COUNT(DISTINCT CASE WHEN login_completed_view > 0 THEN client_id END) AS login_completed_view_users,
      -- Login Token View
      100*SUM(login_token_view) as login_token_view,
      100*COUNT(DISTINCT CASE WHEN login_token_view > 0 THEN client_id END) AS login_token_view_users,
      -- Login View
      100*SUM(login_view) as login_view,
      100*COUNT(DISTINCT CASE WHEN login_view > 0 THEN client_id END) AS login_view_users,
      -- Paired
      100*SUM(paired) as paired,
      100*COUNT(DISTINCT CASE WHEN paired > 0 THEN client_id END) AS paired_users,
      -- Registration Code View
      100*SUM(registration_code_view) as registration_code_view,
      100*COUNT(DISTINCT CASE WHEN registration_code_view > 0 THEN client_id END) AS registration_code_view_users,
      -- Registration Completed View
      100*SUM(registration_completed_view) as registration_completed_view,
      100*COUNT(DISTINCT CASE WHEN registration_completed_view > 0 THEN client_id END) AS registration_completed_view_users,
      -- Registration View
      100*SUM(registration_view) as registration_view,
      100*COUNT(DISTINCT CASE WHEN registration_view > 0 THEN client_id END) AS registration_view_users,
      -- Use Email
      100*SUM(use_email) as use_email,
      100*COUNT(DISTINCT CASE WHEN use_email > 0 THEN client_id END) AS use_email_users

      FROM product_features
      where submission_date >= '2022-03-21'
      group by 1
      )

      select d.submission_date,
          dau,
          disconnect,
          disconnect_users,
          login_completed_view,
          login_completed_view_users,
          login_token_view,
          login_token_view_users,
          login_view,
          login_view_users,
          paired,
          paired_users,
          registration_code_view,
          registration_code_view_users,
          registration_completed_view,
          registration_completed_view_users,
          registration_view,
          registration_view_users,
          use_email,
          use_email_users


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

  measure: disconnect {
    type: sum
    sql: ${TABLE}.disconnect ;;
  }

  measure: disconnect_users {
    type: sum
    sql: ${TABLE}.disconnect_users ;;
  }

  measure: login_completed_view {
    type: sum
    sql: ${TABLE}.login_completed_view ;;
  }

  measure: login_completed_view_users {
    type: sum
    sql: ${TABLE}.login_completed_view_users ;;
  }

  measure: login_token_view {
    type: sum
    sql: ${TABLE}.login_token_view ;;
  }

  measure: login_token_view_users {
    type: sum
    sql: ${TABLE}.login_token_view_users ;;
  }

  measure: login_view {
    type: sum
    sql: ${TABLE}.login_view ;;
  }

  measure: login_view_users {
    type: sum
    sql: ${TABLE}.login_view_users ;;
  }

  measure: paired {
    type: sum
    sql: ${TABLE}.paired ;;
  }

  measure: paired_users {
    type: sum
    sql: ${TABLE}.paired_users ;;
  }

  measure: registration_code_view {
    type: sum
    sql: ${TABLE}.registration_code_view ;;
  }

  measure: registration_code_view_users {
    type: sum
    sql: ${TABLE}.registration_code_view_users ;;
  }

  measure: registration_completed_view {
    type: sum
    sql: ${TABLE}.registration_completed_view ;;
  }

  measure: registration_completed_view_users {
    type: sum
    sql: ${TABLE}.registration_completed_view_users ;;
  }

  measure: registration_view {
    type: sum
    sql: ${TABLE}.registration_view ;;
  }

  measure: registration_view_users {
    type: sum
    sql: ${TABLE}.registration_view_users ;;
  }

  measure: use_email {
    type: sum
    sql: ${TABLE}.use_email ;;
  }

  measure: use_email_users {
    type: sum
    sql: ${TABLE}.use_email_users ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      disconnect,
      disconnect_users,
      login_completed_view,
      login_completed_view_users,
      login_token_view,
      login_token_view_users,
      login_view,
      login_view_users,
      paired,
      paired_users,
      registration_code_view,
      registration_code_view_users,
      registration_completed_view,
      registration_completed_view_users,
      registration_view,
      registration_view_users,
      use_email,
      use_email_users
    ]
  }
}
