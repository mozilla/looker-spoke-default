
view: android_fxa_events {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.events_unnested`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-01-01'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
      client_info.client_id,
      DATE(submission_timestamp) as submission_date,

      CASE WHEN event_category = 'sync' AND event_name = 'failed' THEN 1 ELSE 0 END as failed,
      CASE WHEN event_category = 'sync_account' AND event_name = 'opened' THEN 1 ELSE 0 END as sync_account_opened,
      CASE WHEN event_category = 'sync_account' AND event_name = 'send_tab' THEN 1 ELSE 0 END as sync_account_send_tab,
      CASE WHEN event_category = 'sync_account' AND event_name = 'sign_in_to_send_tab' THEN 1 ELSE 0 END as sync_account_sign_in_to_send_tab,
      CASE WHEN event_category = 'sync_account' AND event_name = 'sync_now' THEN 1 ELSE 0 END as sync_account_sync_now,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'closed' THEN 1 ELSE 0 END as sync_auth_closed,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'opened' THEN 1 ELSE 0 END as sync_auth_opened,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'other_external' THEN 1 ELSE 0 END as sync_auth_other_external,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'paired' THEN 1 ELSE 0 END as sync_auth_paired,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'recovered' THEN 1 ELSE 0 END as sync_auth_recovered,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'scan_pairing' THEN 1 ELSE 0 END as sync_auth_scan_pairing,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'sign_in' THEN 1 ELSE 0 END as sync_auth_sign_in,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'sign_out' THEN 1 ELSE 0 END as sync_auth_sign_out,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'sign_up' THEN 1 ELSE 0 END as sync_auth_sign_up,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'use_email' THEN 1 ELSE 0 END as sync_auth_use_email,
      CASE WHEN event_category = 'sync_auth' AND event_name = 'use_email_problem' THEN 1 ELSE 0 END as sync_auth_use_email_problem


      FROM `mozdata.fenix.events_unnested`
      where DATE(submission_timestamp) >= '2021-01-01'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date

      --failed
      , 100*SUM(failed) as failed
      , 100*COUNT(DISTINCT CASE WHEN failed > 0 THEN client_id END) AS failed_users
      --sync_account_opened
      , 100*SUM(sync_account_opened) as sync_account_opened
      , 100*COUNT(DISTINCT CASE WHEN sync_account_opened > 0 THEN client_id END) AS sync_account_opened_users
      --sync_account_send_tab
      , 100*SUM(sync_account_send_tab) as sync_account_send_tab
      , 100*COUNT(DISTINCT CASE WHEN sync_account_send_tab > 0 THEN client_id END) AS sync_account_send_tab_users
      --sync_account_sign_in_to_send_tab
      , 100*SUM(sync_account_sign_in_to_send_tab) as sync_account_sign_in_to_send_tab
      , 100*COUNT(DISTINCT CASE WHEN sync_account_sign_in_to_send_tab > 0 THEN client_id END) AS sync_account_sign_in_to_send_tab_users
      --sync_account_sync_now
      , 100*SUM(sync_account_sync_now) as sync_account_sync_now
      , 100*COUNT(DISTINCT CASE WHEN sync_account_sync_now > 0 THEN client_id END) AS sync_account_sync_now_users
      --sync_auth_closed
      , 100*SUM(sync_auth_closed) as sync_auth_closed
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_closed > 0 THEN client_id END) AS sync_auth_closed_users
      --sync_auth_opened
      , 100*SUM(sync_auth_opened) as sync_auth_opened
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_opened > 0 THEN client_id END) AS sync_auth_opened_users
      --sync_auth_other_external
      , 100*SUM(sync_auth_other_external) as sync_auth_other_external
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_other_external > 0 THEN client_id END) AS sync_auth_other_external_users
      --sync_auth_paired
      , 100*SUM(sync_auth_paired) as sync_auth_paired
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_paired > 0 THEN client_id END) AS sync_auth_paired_users
      --sync_auth_recovered
      , 100*SUM(sync_auth_recovered) as sync_auth_recovered
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_recovered > 0 THEN client_id END) AS sync_auth_recovered_users
      --sync_auth_scan_pairing
      , 100*SUM(sync_auth_scan_pairing) as sync_auth_scan_pairing
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_scan_pairing > 0 THEN client_id END) AS sync_auth_scan_pairing_users
      --sync_auth_sign_in
      , 100*SUM(sync_auth_sign_in) as sync_auth_sign_in
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_sign_in > 0 THEN client_id END) AS sync_auth_sign_in_users
      --sync_auth_sign_out
      , 100*SUM(sync_auth_sign_out) as sync_auth_sign_out
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_sign_out > 0 THEN client_id END) AS sync_auth_sign_out_users
      --sync_auth_sign_up
      , 100*SUM(sync_auth_sign_up) as sync_auth_sign_up
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_sign_up > 0 THEN client_id END) AS sync_auth_sign_up_users
      --sync_auth_use_email
      , 100*SUM(sync_auth_use_email) as sync_auth_use_email
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_use_email > 0 THEN client_id END) AS sync_auth_use_email_users
      --sync_auth_use_email_problem
      , 100*SUM(sync_auth_use_email_problem) as sync_auth_use_email_problem
      , 100*COUNT(DISTINCT CASE WHEN sync_auth_use_email_problem > 0 THEN client_id END) AS sync_auth_use_email_problem_users


      FROM product_features
      where submission_date >= '2021-01-01'
      group by 1
      )

      select d.submission_date,
      dau,
      failed,
      failed_users,
      sync_account_opened,
      sync_account_opened_users,
      sync_account_send_tab,
      sync_account_send_tab_users,
      sync_account_sign_in_to_send_tab,
      sync_account_sign_in_to_send_tab_users,
      sync_account_sync_now,
      sync_account_sync_now_users,
      sync_auth_closed,
      sync_auth_closed_users,
      sync_auth_opened,
      sync_auth_opened_users,
      sync_auth_other_external,
      sync_auth_other_external_users,
      sync_auth_paired,
      sync_auth_paired_users,
      sync_auth_recovered,
      sync_auth_recovered_users,
      sync_auth_scan_pairing,
      sync_auth_scan_pairing_users,
      sync_auth_sign_in,
      sync_auth_sign_in_users,
      sync_auth_sign_out,
      sync_auth_sign_out_users,
      sync_auth_sign_up,
      sync_auth_sign_up_users,
      sync_auth_use_email,
      sync_auth_use_email_users,
      sync_auth_use_email_problem,
      sync_auth_use_email_problem_users
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

  measure: failed {
    type: sum
    sql: ${TABLE}.failed ;;
  }

  measure: failed_users {
    type: sum
    sql: ${TABLE}.failed_users ;;
  }

  measure: sync_account_opened {
    type: sum
    sql: ${TABLE}.sync_account_opened ;;
  }

  measure: sync_account_opened_users {
    type: sum
    sql: ${TABLE}.sync_account_opened_users ;;
  }

  measure: sync_account_send_tab {
    type: sum
    sql: ${TABLE}.sync_account_send_tab ;;
  }

  measure: sync_account_send_tab_users {
    type: sum
    sql: ${TABLE}.sync_account_send_tab_users ;;
  }

  measure: sync_account_sign_in_to_send_tab {
    type: sum
    sql: ${TABLE}.sync_account_sign_in_to_send_tab ;;
  }

  measure: sync_account_sign_in_to_send_tab_users {
    type: sum
    sql: ${TABLE}.sync_account_sign_in_to_send_tab_users ;;
  }

  measure: sync_account_sync_now {
    type: sum
    sql: ${TABLE}.sync_account_sync_now ;;
  }

  measure: sync_account_sync_now_users {
    type: sum
    sql: ${TABLE}.sync_account_sync_now_users ;;
  }

  measure: sync_auth_closed {
    type: sum
    sql: ${TABLE}.sync_auth_closed ;;
  }

  measure: sync_auth_closed_users {
    type: sum
    sql: ${TABLE}.sync_auth_closed_users ;;
  }

  measure: sync_auth_opened {
    type: sum
    sql: ${TABLE}.sync_auth_opened ;;
  }

  measure: sync_auth_opened_users {
    type: sum
    sql: ${TABLE}.sync_auth_opened_users ;;
  }

  measure: sync_auth_other_external {
    type: sum
    sql: ${TABLE}.sync_auth_other_external ;;
  }

  measure: sync_auth_other_external_users {
    type: sum
    sql: ${TABLE}.sync_auth_other_external_users ;;
  }

  measure: sync_auth_paired {
    type: sum
    sql: ${TABLE}.sync_auth_paired ;;
  }

  measure: sync_auth_paired_users {
    type: sum
    sql: ${TABLE}.sync_auth_paired_users ;;
  }

  measure: sync_auth_recovered {
    type: sum
    sql: ${TABLE}.sync_auth_recovered ;;
  }

  measure: sync_auth_recovered_users {
    type: sum
    sql: ${TABLE}.sync_auth_recovered_users ;;
  }

  measure: sync_auth_scan_pairing {
    type: sum
    sql: ${TABLE}.sync_auth_scan_pairing ;;
  }

  measure: sync_auth_scan_pairing_users {
    type: sum
    sql: ${TABLE}.sync_auth_scan_pairing_users ;;
  }

  measure: sync_auth_sign_in {
    type: sum
    sql: ${TABLE}.sync_auth_sign_in ;;
  }

  measure: sync_auth_sign_in_users {
    type: sum
    sql: ${TABLE}.sync_auth_sign_in_users ;;
  }

  measure: sync_auth_sign_out {
    type: sum
    sql: ${TABLE}.sync_auth_sign_out ;;
  }

  measure: sync_auth_sign_out_users {
    type: sum
    sql: ${TABLE}.sync_auth_sign_out_users ;;
  }

  measure: sync_auth_sign_up {
    type: sum
    sql: ${TABLE}.sync_auth_sign_up ;;
  }

  measure: sync_auth_sign_up_users {
    type: sum
    sql: ${TABLE}.sync_auth_sign_up_users ;;
  }

  measure: sync_auth_use_email {
    type: sum
    sql: ${TABLE}.sync_auth_use_email ;;
  }

  measure: sync_auth_use_email_users {
    type: sum
    sql: ${TABLE}.sync_auth_use_email_users ;;
  }

  measure: sync_auth_use_email_problem {
    type: sum
    sql: ${TABLE}.sync_auth_use_email_problem ;;
  }

  measure: sync_auth_use_email_problem_users {
    type: sum
    sql: ${TABLE}.sync_auth_use_email_problem_users ;;
  }

  set: detail {
    fields: [submission_date,
      dau,
      failed,
      failed_users,
      sync_account_opened,
      sync_account_opened_users,
      sync_account_send_tab,
      sync_account_send_tab_users,
      sync_account_sign_in_to_send_tab,
      sync_account_sign_in_to_send_tab_users,
      sync_account_sync_now,
      sync_account_sync_now_users,
      sync_auth_closed,
      sync_auth_closed_users,
      sync_auth_opened,
      sync_auth_opened_users,
      sync_auth_other_external,
      sync_auth_other_external_users,
      sync_auth_paired,
      sync_auth_paired_users,
      sync_auth_recovered,
      sync_auth_recovered_users,
      sync_auth_scan_pairing,
      sync_auth_scan_pairing_users,
      sync_auth_sign_in,
      sync_auth_sign_in_users,
      sync_auth_sign_out,
      sync_auth_sign_out_users,
      sync_auth_sign_up,
      sync_auth_sign_up_users,
      sync_auth_use_email,
      sync_auth_use_email_users,
      sync_auth_use_email_problem,
      sync_auth_use_email_problem_users
    ]
  }
}
