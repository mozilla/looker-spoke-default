
view: ios_credit_card_events {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.events_unnested`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2023-01-06'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
      client_info.client_id,
      DATE(submission_timestamp) as submission_date,

      CASE WHEN event_category = 'credit_card' AND event_name = 'autofill_failed' THEN 1 ELSE 0 END as autofill_failed,
      CASE WHEN event_category = 'credit_card' AND event_name = 'autofill_settings_tapped' THEN 1 ELSE 0 END as autofill_settings_tapped,
      CASE WHEN event_category = 'credit_card' AND event_name = 'autofill_toggle' THEN 1 ELSE 0 END as autofill_toggle,
      CASE WHEN event_category = 'credit_card' AND event_name = 'autofilled' THEN 1 ELSE 0 END as autofilled,
      CASE WHEN event_category = 'credit_card' AND event_name = 'form_detected' THEN 1 ELSE 0 END as form_detected,
      CASE WHEN event_category = 'credit_card' AND event_name = 'save_prompt_create' THEN 1 ELSE 0 END as save_prompt_create,
      CASE WHEN event_category = 'credit_card' AND event_name = 'sync_toggle' THEN 1 ELSE 0 END as sync_toggle


      FROM `mozdata.firefox_ios.events_unnested`
      where DATE(submission_timestamp) >= '2023-01-06'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date,

      --autofill_failed
      100*SUM(autofill_failed) as autofill_failed,
      100*COUNT(DISTINCT CASE WHEN autofill_failed > 0 THEN client_id END) AS autofill_failed_users,
      -- Autofill Settings Tapped
      100*SUM(autofill_settings_tapped) as autofill_settings_tapped,
      100*COUNT(DISTINCT CASE WHEN autofill_settings_tapped > 0 THEN client_id END) AS autofill_settings_tapped_users,
      -- Autofill Toggle
      100*SUM(autofill_toggle) as autofill_toggle,
      100*COUNT(DISTINCT CASE WHEN autofill_toggle > 0 THEN client_id END) AS autofill_toggle_users,
      -- Autofilled
      100*SUM(autofilled) as autofilled,
      100*COUNT(DISTINCT CASE WHEN autofilled > 0 THEN client_id END) AS autofilled_users,
      -- Form Detected
      100*SUM(form_detected) as form_detected,
      100*COUNT(DISTINCT CASE WHEN form_detected > 0 THEN client_id END) AS form_detected_users,
      -- Save Prompt Create
      100*SUM(save_prompt_create) as save_prompt_create,
      100*COUNT(DISTINCT CASE WHEN save_prompt_create > 0 THEN client_id END) AS save_prompt_create_users,
      -- Sync Toggle
      100*SUM(sync_toggle) as sync_toggle,
      100*COUNT(DISTINCT CASE WHEN sync_toggle > 0 THEN client_id END) AS sync_toggle_users
      FROM product_features
      where submission_date >= '2023-01-06'
      group by 1
      )

      select d.submission_date,
      dau,
      autofill_failed,
      autofill_failed_users,
      autofill_settings_tapped,
      autofill_settings_tapped_users,
      autofill_toggle,
      autofill_toggle_users,
      autofilled,
      autofilled_users,
      form_detected,
      form_detected_users,
      save_prompt_create,
      save_prompt_create_users,
      sync_toggle,
      sync_toggle_users
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

  measure: autofill_failed {
    type: sum
    sql: ${TABLE}.autofill_failed ;;
  }

  measure: autofill_failed_users {
    type: sum
    sql: ${TABLE}.autofill_failed_users ;;
  }

  measure: autofill_settings_tapped {
    type: sum
    sql: ${TABLE}.autofill_settings_tapped ;;
  }

  measure: autofill_settings_tapped_users {
    type: sum
    sql: ${TABLE}.autofill_settings_tapped_users ;;
  }

  measure: autofill_toggle {
    type: sum
    sql: ${TABLE}.autofill_toggle ;;
  }

  measure: autofill_toggle_users {
    type: sum
    sql: ${TABLE}.autofill_toggle_users ;;
  }

  measure: autofilled {
    type: sum
    sql: ${TABLE}.autofilled ;;
  }

  measure: autofilled_users {
    type: sum
    sql: ${TABLE}.autofilled_users ;;
  }

  measure: form_detected {
    type: sum
    sql: ${TABLE}.form_detected ;;
  }

  measure: form_detected_users {
    type: sum
    sql: ${TABLE}.form_detected_users ;;
  }

  measure: save_prompt_create {
    type: sum
    sql: ${TABLE}.save_prompt_create ;;
  }

  measure: save_prompt_create_users {
    type: sum
    sql: ${TABLE}.save_prompt_create_users ;;
  }

  measure: sync_toggle {
    type: sum
    sql: ${TABLE}.sync_toggle ;;
  }

  measure: sync_toggle_users {
    type: sum
    sql: ${TABLE}.sync_toggle_users ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      autofill_failed,
      autofill_failed_users,
      autofill_settings_tapped,
      autofill_settings_tapped_users,
      autofill_toggle,
      autofill_toggle_users,
      autofilled,
      autofilled_users,
      form_detected,
      form_detected_users,
      save_prompt_create,
      save_prompt_create_users,
      sync_toggle,
      sync_toggle_users
    ]
  }
}
