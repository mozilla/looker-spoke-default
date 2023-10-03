
view: android_credential_management_events {
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
          /*Logins*/
          --autofill
          CASE WHEN event_category = 'logins' AND event_name = 'autofill_prompt_shown' THEN 1 ELSE 0 END as autofill_prompt_shown_logins,
          CASE WHEN event_category = 'logins' AND event_name = 'autofill_prompt_dismissed' THEN 1 ELSE 0 END as autofill_prompt_dismissed_logins,
          CASE WHEN event_category = 'logins' AND event_name = 'autofilled' THEN 1 ELSE 0 END as autofilled_logins,
          --management
          CASE WHEN event_category = 'logins' AND event_name = 'management_add_tapped' THEN 1 ELSE 0 END as management_add_tapped_logins,
          CASE WHEN event_category = 'logins' AND event_name = 'management_logins_tapped' THEN 1 ELSE 0 END as management_tapped_logins,

          /*Credit Card*/
          --autofill
          CASE WHEN event_category = 'credit_cards' AND event_name = 'form_detected' THEN 1 ELSE 0 END as form_detected_cc,
          CASE WHEN event_category = 'credit_cards' AND event_name = 'autofill_prompt_shown' THEN 1 ELSE 0 END as autofill_prompt_shown_cc,
          CASE WHEN event_category = 'credit_cards' AND event_name = 'autofill_prompt_expanded' THEN 1 ELSE 0 END as autofill_prompt_expanded_cc,
          CASE WHEN event_category = 'credit_cards' AND event_name = 'autofill_prompt_dismissed' THEN 1 ELSE 0 END as autofill_prompt_dismissed_cc,
          CASE WHEN event_category = 'credit_cards' AND event_name = 'autofilled' THEN 1 ELSE 0 END as autofilled_cc,
          --save prompt
          CASE WHEN event_category = 'credit_cards' AND event_name = 'save_prompt_shown' THEN 1 ELSE 0 END as save_prompt_shown_cc,
          CASE WHEN event_category = 'credit_cards' AND event_name = 'save_prompt_create' THEN 1 ELSE 0 END as save_prompt_create_cc,
          CASE WHEN event_category = 'credit_cards' AND event_name = 'save_prompt_update' THEN 1 ELSE 0 END as save_prompt_update_cc,
          --management
          CASE WHEN event_category = 'credit_cards' AND event_name = 'management_add_tapped' THEN 1 ELSE 0 END as management_add_tapped_cc,
          CASE WHEN event_category = 'credit_cards' AND event_name = 'management_card_tapped' THEN 1 ELSE 0 END as management_tapped_cc,
          CASE WHEN event_category = 'credit_cards' AND event_name = 'modified' THEN 1 ELSE 0 END as modified_cc,

          /*Addresses*/
          --autofill
          CASE WHEN event_category = 'addresses' AND event_name = 'form_detected' THEN 1 ELSE 0 END as form_detected_address,
          CASE WHEN event_category = 'addresses' AND event_name = 'autofill_prompt_shown' THEN 1 ELSE 0 END as autofill_prompt_shown_address,
          CASE WHEN event_category = 'addresses' AND event_name = 'autofill_prompt_expanded' THEN 1 ELSE 0 END as autofill_prompt_expanded_address,
          CASE WHEN event_category = 'addresses' AND event_name = 'autofill_prompt_dismissed' THEN 1 ELSE 0 END as autofill_prompt_dismissed_address,
          CASE WHEN event_category = 'addresses' AND event_name = 'autofilled' THEN 1 ELSE 0 END as autofilled_address,
          --management
          CASE WHEN event_category = 'addresses' AND event_name = 'management_add_tapped' THEN 1 ELSE 0 END as management_add_tapped_address,
          CASE WHEN event_category = 'addresses' AND event_name = 'management_address_tapped' THEN 1 ELSE 0 END as management_tapped_address,

            FROM `mozdata.fenix.events_unnested`
      where DATE(submission_timestamp) >= '2021-01-01'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date

      /*Logins*/
      --autofill_prompt_shown
      , 100*SUM(autofill_prompt_shown_logins) as autofill_prompt_shown_sum_logins
      , 100*COUNT(DISTINCT CASE WHEN autofill_prompt_shown_logins > 0 THEN client_id END) AS autofill_prompt_shown_users_logins
      --autofill_prompt_dismissed
      , 100*SUM(autofill_prompt_dismissed_logins) as autofill_prompt_dismissed_sum_logins
      , 100*COUNT(DISTINCT CASE WHEN autofill_prompt_dismissed_logins > 0 THEN client_id END) AS autofill_prompt_dismissed_users_logins
      --autofilled
      , 100*SUM(autofilled_logins) as autofilled_sum_logins
      , 100*COUNT(DISTINCT CASE WHEN autofilled_logins > 0 THEN client_id END) AS autofilled_users_logins
      --management_add_tapped
      , 100*SUM(management_add_tapped_logins) as management_add_tapped_sum_logins
      , 100*COUNT(DISTINCT CASE WHEN management_add_tapped_logins > 0 THEN client_id END) AS management_add_tapped_users_logins
      --management_card_tapped
      , 100*SUM(management_tapped_logins) as management_tapped_sum_logins
      , 100*COUNT(DISTINCT CASE WHEN management_tapped_logins > 0 THEN client_id END) AS management_tapped_users_logins

      /*Credit Cards*/
      --form detected
      , 100*SUM(form_detected_cc) as form_detected_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN form_detected_cc > 0 THEN client_id END) AS form_detected_users_cc
      --autofill_prompt_shown
      , 100*SUM(autofill_prompt_shown_cc) as autofill_prompt_shown_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN autofill_prompt_shown_cc > 0 THEN client_id END) AS autofill_prompt_shown_users_cc
      --autofill_prompt_expanded
      , 100*SUM(autofill_prompt_expanded_cc) as autofill_prompt_expanded_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN autofill_prompt_expanded_cc > 0 THEN client_id END) AS autofill_prompt_expanded_users_cc
      --autofill_prompt_dismissed
      , 100*SUM(autofill_prompt_dismissed_cc) as autofill_prompt_dismissed_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN autofill_prompt_dismissed_cc > 0 THEN client_id END) AS autofill_prompt_dismissed_users_cc
      --autofilled
      , 100*SUM(autofilled_cc) as autofilled_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN autofilled_cc > 0 THEN client_id END) AS autofilled_users_cc
      --save_prompt_shown
      , 100*SUM(save_prompt_shown_cc) as save_prompt_shown_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN save_prompt_shown_cc > 0 THEN client_id END) AS save_prompt_shown_users_cc
      --save_prompt_create
      , 100*SUM(save_prompt_create_cc) as save_prompt_create_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN save_prompt_create_cc > 0 THEN client_id END) AS save_prompt_create_users_cc
      --save_prompt_update
      , 100*SUM(save_prompt_update_cc) as save_prompt_update_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN save_prompt_update_cc > 0 THEN client_id END) AS save_prompt_update_users_cc
      --management_add_tapped
      , 100*SUM(management_add_tapped_cc) as management_add_tapped_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN management_add_tapped_cc > 0 THEN client_id END) AS management_add_tapped_users_cc
      --management_card_tapped
      , 100*SUM(management_tapped_cc) as management_tapped_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN management_tapped_cc > 0 THEN client_id END) AS management_tapped_users_cc
      --modified
      , 100*SUM(modified_cc) as modified_sum_cc
      , 100*COUNT(DISTINCT CASE WHEN modified_cc > 0 THEN client_id END) AS modified_users_cc

      /*Addresses*/
      --form detected
      , 100*SUM(form_detected_address) as form_detected_sum_address
      , 100*COUNT(DISTINCT CASE WHEN form_detected_address > 0 THEN client_id END) AS form_detected_users_address
      --autofill_prompt_shown
      , 100*SUM(autofill_prompt_shown_address) as autofill_prompt_shown_sum_address
      , 100*COUNT(DISTINCT CASE WHEN autofill_prompt_shown_address > 0 THEN client_id END) AS autofill_prompt_shown_users_address
      --autofill_prompt_expanded
      , 100*SUM(autofill_prompt_expanded_address) as autofill_prompt_expanded_sum_address
      , 100*COUNT(DISTINCT CASE WHEN autofill_prompt_expanded_address > 0 THEN client_id END) AS autofill_prompt_expanded_users_address
      --autofill_prompt_dismissed
      , 100*SUM(autofill_prompt_dismissed_address) as autofill_prompt_dismissed_sum_address
      , 100*COUNT(DISTINCT CASE WHEN autofill_prompt_dismissed_address > 0 THEN client_id END) AS autofill_prompt_dismissed_users_address
      --autofilled
      , 100*SUM(autofilled_address) as autofilled_sum_address
      , 100*COUNT(DISTINCT CASE WHEN autofilled_address > 0 THEN client_id END) AS autofilled_users_address
      --management_add_tapped
      , 100*SUM(management_add_tapped_address) as management_add_tapped_sum_address
      , 100*COUNT(DISTINCT CASE WHEN management_add_tapped_address > 0 THEN client_id END) AS management_add_tapped_users_address
      --management_card_tapped
      , 100*SUM(management_tapped_address) as management_tapped_sum_address
      , 100*COUNT(DISTINCT CASE WHEN management_tapped_address > 0 THEN client_id END) AS management_tapped_users_address

      FROM product_features
      where submission_date >= '2021-01-01'
      group by 1
      )

      select d.submission_date
      , dau
      /*logins*/
      , autofill_prompt_shown_sum_logins
      , autofill_prompt_shown_users_logins
      , autofill_prompt_dismissed_sum_logins
      , autofill_prompt_dismissed_users_logins
      , autofilled_sum_logins
      , autofilled_users_logins
      , management_add_tapped_sum_logins
      , management_add_tapped_users_logins
      , management_tapped_sum_logins
      , management_tapped_users_logins

      /*credit card*/
      , form_detected_sum_cc
      , form_detected_users_cc
      , autofill_prompt_shown_sum_cc
      , autofill_prompt_shown_users_cc
      , autofill_prompt_expanded_sum_cc
      , autofill_prompt_expanded_users_cc
      , autofill_prompt_dismissed_sum_cc
      , autofill_prompt_dismissed_users_cc
      , autofilled_sum_cc
      , autofilled_users_cc
      , save_prompt_shown_sum_cc
      , save_prompt_shown_users_cc
      , save_prompt_create_sum_cc
      , save_prompt_create_users_cc
      , save_prompt_update_sum_cc
      , save_prompt_update_users_cc
      , management_add_tapped_sum_cc
      , management_add_tapped_users_cc
      , management_tapped_sum_cc
      , management_tapped_users_cc

      /*addresses*/
      , form_detected_sum_address
      , form_detected_users_address
      , autofill_prompt_shown_sum_address
      , autofill_prompt_shown_users_address
      , autofill_prompt_expanded_sum_address
      , autofill_prompt_expanded_users_address
      , autofill_prompt_dismissed_sum_address
      , autofill_prompt_dismissed_users_address
      , autofilled_sum_address
      , autofilled_users_address
      , management_add_tapped_sum_address
      , management_add_tapped_users_address
      , management_tapped_sum_address
      , management_tapped_users_address
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

  measure: autofill_prompt_shown_sum_logins {
    type: sum
    sql: ${TABLE}.autofill_prompt_shown_sum_logins ;;
  }

  measure: autofill_prompt_shown_users_logins {
    type: sum
    sql: ${TABLE}.autofill_prompt_shown_users_logins ;;
  }

  measure: autofill_prompt_dismissed_sum_logins {
    type: sum
    sql: ${TABLE}.autofill_prompt_dismissed_sum_logins ;;
  }

  measure: autofill_prompt_dismissed_users_logins {
    type: sum
    sql: ${TABLE}.autofill_prompt_dismissed_users_logins ;;
  }

  measure: autofilled_sum_logins {
    type: sum
    sql: ${TABLE}.autofilled_sum_logins ;;
  }

  measure: autofilled_users_logins {
    type: sum
    sql: ${TABLE}.autofilled_users_logins ;;
  }

  measure: management_add_tapped_sum_logins {
    type: sum
    sql: ${TABLE}.management_add_tapped_sum_logins ;;
  }

  measure: management_add_tapped_users_logins {
    type: sum
    sql: ${TABLE}.management_add_tapped_users_logins ;;
  }

  measure: management_tapped_sum_logins {
    type: sum
    sql: ${TABLE}.management_tapped_sum_logins ;;
  }

  measure: management_tapped_users_logins {
    type: sum
    sql: ${TABLE}.management_tapped_users_logins ;;
  }

  measure: form_detected_sum_cc {
    type: sum
    sql: ${TABLE}.form_detected_sum_cc ;;
  }

  measure: form_detected_users_cc {
    type: sum
    sql: ${TABLE}.form_detected_users_cc ;;
  }

  measure: autofill_prompt_shown_sum_cc {
    type: sum
    sql: ${TABLE}.autofill_prompt_shown_sum_cc ;;
  }

  measure: autofill_prompt_shown_users_cc {
    type: sum
    sql: ${TABLE}.autofill_prompt_shown_users_cc ;;
  }

  measure: autofill_prompt_expanded_sum_cc {
    type: sum
    sql: ${TABLE}.autofill_prompt_expanded_sum_cc ;;
  }

  measure: autofill_prompt_expanded_users_cc {
    type: sum
    sql: ${TABLE}.autofill_prompt_expanded_users_cc ;;
  }

  measure: autofill_prompt_dismissed_sum_cc {
    type: sum
    sql: ${TABLE}.autofill_prompt_dismissed_sum_cc ;;
  }

  measure: autofill_prompt_dismissed_users_cc {
    type: sum
    sql: ${TABLE}.autofill_prompt_dismissed_users_cc ;;
  }

  measure: autofilled_sum_cc {
    type: sum
    sql: ${TABLE}.autofilled_sum_cc ;;
  }

  measure: autofilled_users_cc {
    type: sum
    sql: ${TABLE}.autofilled_users_cc ;;
  }

  measure: save_prompt_shown_sum_cc {
    type: sum
    sql: ${TABLE}.save_prompt_shown_sum_cc ;;
  }

  measure: save_prompt_shown_users_cc {
    type: sum
    sql: ${TABLE}.save_prompt_shown_users_cc ;;
  }

  measure: save_prompt_create_sum_cc {
    type: sum
    sql: ${TABLE}.save_prompt_create_sum_cc ;;
  }

  measure: save_prompt_create_users_cc {
    type: sum
    sql: ${TABLE}.save_prompt_create_users_cc ;;
  }

  measure: save_prompt_update_sum_cc {
    type: sum
    sql: ${TABLE}.save_prompt_update_sum_cc ;;
  }

  measure: save_prompt_update_users_cc {
    type: sum
    sql: ${TABLE}.save_prompt_update_users_cc ;;
  }

  measure: management_add_tapped_sum_cc {
    type: sum
    sql: ${TABLE}.management_add_tapped_sum_cc ;;
  }

  measure: management_add_tapped_users_cc {
    type: sum
    sql: ${TABLE}.management_add_tapped_users_cc ;;
  }

  measure: management_tapped_sum_cc {
    type: sum
    sql: ${TABLE}.management_tapped_sum_cc ;;
  }

  measure: management_tapped_users_cc {
    type: sum
    sql: ${TABLE}.management_tapped_users_cc ;;
  }

  measure: form_detected_sum_address {
    type: sum
    sql: ${TABLE}.form_detected_sum_address ;;
  }

  measure: form_detected_users_address {
    type: sum
    sql: ${TABLE}.form_detected_users_address ;;
  }

  measure: autofill_prompt_shown_sum_address {
    type: sum
    sql: ${TABLE}.autofill_prompt_shown_sum_address ;;
  }

  measure: autofill_prompt_shown_users_address {
    type: sum
    sql: ${TABLE}.autofill_prompt_shown_users_address ;;
  }

  measure: autofill_prompt_expanded_sum_address {
    type: sum
    sql: ${TABLE}.autofill_prompt_expanded_sum_address ;;
  }

  measure: autofill_prompt_expanded_users_address {
    type: sum
    sql: ${TABLE}.autofill_prompt_expanded_users_address ;;
  }

  measure: autofill_prompt_dismissed_sum_address {
    type: sum
    sql: ${TABLE}.autofill_prompt_dismissed_sum_address ;;
  }

  measure: autofill_prompt_dismissed_users_address {
    type: sum
    sql: ${TABLE}.autofill_prompt_dismissed_users_address ;;
  }

  measure: autofilled_sum_address {
    type: sum
    sql: ${TABLE}.autofilled_sum_address ;;
  }

  measure: autofilled_users_address {
    type: sum
    sql: ${TABLE}.autofilled_users_address ;;
  }

  measure: management_add_tapped_sum_address {
    type: sum
    sql: ${TABLE}.management_add_tapped_sum_address ;;
  }

  measure: management_add_tapped_users_address {
    type: sum
    sql: ${TABLE}.management_add_tapped_users_address ;;
  }

  measure: management_tapped_sum_address {
    type: sum
    sql: ${TABLE}.management_tapped_sum_address ;;
  }

  measure: management_tapped_users_address {
    type: sum
    sql: ${TABLE}.management_tapped_users_address ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      autofill_prompt_shown_sum_logins,
      autofill_prompt_shown_users_logins,
      autofill_prompt_dismissed_sum_logins,
      autofill_prompt_dismissed_users_logins,
      autofilled_sum_logins,
      autofilled_users_logins,
      management_add_tapped_sum_logins,
      management_add_tapped_users_logins,
      management_tapped_sum_logins,
      management_tapped_users_logins,
      form_detected_sum_cc,
      form_detected_users_cc,
      autofill_prompt_shown_sum_cc,
      autofill_prompt_shown_users_cc,
      autofill_prompt_expanded_sum_cc,
      autofill_prompt_expanded_users_cc,
      autofill_prompt_dismissed_sum_cc,
      autofill_prompt_dismissed_users_cc,
      autofilled_sum_cc,
      autofilled_users_cc,
      save_prompt_shown_sum_cc,
      save_prompt_shown_users_cc,
      save_prompt_create_sum_cc,
      save_prompt_create_users_cc,
      save_prompt_update_sum_cc,
      save_prompt_update_users_cc,
      management_add_tapped_sum_cc,
      management_add_tapped_users_cc,
      management_tapped_sum_cc,
      management_tapped_users_cc,
      form_detected_sum_address,
      form_detected_users_address,
      autofill_prompt_shown_sum_address,
      autofill_prompt_shown_users_address,
      autofill_prompt_expanded_sum_address,
      autofill_prompt_expanded_users_address,
      autofill_prompt_dismissed_sum_address,
      autofill_prompt_dismissed_users_address,
      autofilled_sum_address,
      autofilled_users_address,
      management_add_tapped_sum_address,
      management_add_tapped_users_address,
      management_tapped_sum_address,
      management_tapped_users_address
    ]
  }
}
