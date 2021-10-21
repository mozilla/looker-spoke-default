view: old_funnel {
  derived_table: {
    sql: WITH
  fxa_stdout_events AS (
  SELECT
    PARSE_DATE('%y%m%d',
      _TABLE_SUFFIX) AS partition_date,
    `timestamp`,
    --jsonPayload.fields.event_properties,
    json_value(jsonPayload.fields.user_properties,
      '$.flow_id') AS flow_id,
    TO_HEX(SHA256(jsonPayload.fields.user_id)) AS user_id,
    --jsonPayload.fields.user_properties,
    jsonPayload.fields.event_type AS event_type,
    json_value(jsonPayload.fields.user_properties,
      '$.entrypoint') AS entrypoint,
    json_value(jsonPayload.fields.user_properties,
      '$.utm_campaign') AS utm_campaign,
    json_value(jsonPayload.fields.user_properties,
      '$.utm_medium') AS utm_medium,
    json_value(jsonPayload.fields.user_properties,
      '$.utm_source') AS utm_source,
    json_value(jsonPayload.fields.event_properties,
      '$.checkout_type') AS checkout_type,
    json_value(jsonPayload.fields.event_properties,
      '$.plan_id') AS plan_id,
    json_value(jsonPayload.fields.event_properties,
      '$.product_id') AS product_id,
    json_value(jsonPayload.fields.event_properties,
      '$.service') AS service,
    --creating null column to union all with fxa_content_auth_events
    JSON_VALUE(jsonPayload.fields.user_properties,
      '$.entrypoint_experiment') AS entrypoint_experiment,
    -- null column
    JSON_VALUE(jsonPayload.fields.user_properties,
      '$.entrypoint_variation') AS entrypoint_variation,
    -- null column
    JSON_VALUE(jsonPayload.fields.user_properties,
      '$.utm_content') AS utm_content,
    -- null column
    JSON_VALUE(jsonPayload.fields.user_properties,
      '$.utm_term') AS utm_term -- null column
  FROM
    `moz-fx-fxa-prod-0712.fxa_prod_logs.stdout_20*`
  WHERE
    jsonPayload.type = 'amplitudeEvent'
    -- AND DATE(timestamp) >= DATE(2021,7,1)
    -- AND DATE(timestamp) < DATE(2021,8,25)
    ),
  combined AS(
  SELECT
    DATE(`timestamp`) AS partition_date,
    `timestamp`,
    service,
    event_type,
    flow_id,
    user_id,
    entrypoint_experiment,
    entrypoint_variation,
    utm_campaign,
    utm_content,
    utm_medium,
    utm_source,
    utm_term,
  FROM
    mozdata.firefox_accounts.fxa_content_auth_events
  WHERE
    --DATE(timestamp) >= DATE(2021,7,1)
    --AND DATE(timestamp) < DATE(2021,8,25)
    AND
    (service = 'guardian-vpn'
      OR (event_type = 'fxa_rp_button - view'
        AND entrypoint = 'www.mozilla.org-vpn-product-page'))
  UNION ALL
  SELECT
    partition_date,
    `timestamp`,
    service,
    event_type,
    flow_id,
    user_id,
    entrypoint_experiment,
    entrypoint_variation,
    utm_campaign,
    utm_content,
    utm_medium,
    utm_source,
    utm_term,
  FROM
    fxa_stdout_events ),
  condition_flow_id AS(
  SELECT
    partition_date,
    flow_id,
    --DATE(timestamp) AS `date`, flow_id,
    LOGICAL_OR( event_type ='fxa_rp_button - view' ) AS rp_button_view,
    LOGICAL_OR( event_type ='fxa_login - view' ) AS login_view,
    LOGICAL_OR( event_type ='fxa_reg - view' ) AS reg_view,
    LOGICAL_OR( event_type ='fxa_login - complete' AND user_id IS NULL) AS new_login_complete,
    LOGICAL_OR( event_type = 'fxa_email_first - view') AS email_first_view,
    LOGICAL_OR( event_type = 'fxa_pay_setup - view') AS pay_setup_view,
    LOGICAL_OR( event_type ='fxa_login - complete' ) AS login_complete
  FROM
    combined
  GROUP BY
    1,
    2 ),
  condition_user_id AS(
  SELECT
    partition_date,
    user_id,
    --DATE(timestamp) AS `date`, flow_id,
    --LOGICAL_OR( event_type ='fxa_rp_button - view' ) AS rp_button_view,
    --LOGICAL_OR( event_type ='fxa_login - view' ) AS login_view,
    LOGICAL_OR( event_type = 'fxa_email_first - view') AS email_first_view,
    LOGICAL_OR( event_type = 'fxa_reg - created') AS reg_created,
    LOGICAL_OR( event_type = 'fxa_reg - complete') AS reg_complete,
    LOGICAL_OR( event_type = 'fxa_pay_setup - view') AS pay_setup_view,
    LOGICAL_OR( event_type = 'fxa_pay_setup - 3ds_complete') AS pay_setup_complete,
    LOGICAL_OR( event_type ='fxa_login - complete' ) AS login_complete
  FROM
    combined
  GROUP BY
    1,
    2 ),
    counting_user_id AS (
      SELECT
        partition_date,
        COUNTIF(pay_setup_view) AS pay_setup_view,
        COUNTIF(reg_complete AND pay_setup_view) AS new_pay_setup_view,
        COUNTIF(reg_complete AND pay_setup_complete) AS new_pay_setup_complete,
        COUNTIF(login_complete AND pay_setup_view AND NOT reg_complete) AS existing_pay_setup_view,
        COUNTIF(login_complete AND pay_setup_complete AND NOT reg_complete) AS existing_pay_setup_complete,
        COUNTIF(pay_setup_complete) AS pay_setup_complete
      FROM
        condition_user_id
      GROUP BY
        1
      ORDER BY
        partition_date
    ),
      counting_flow_id AS (
      SELECT
        partition_date,
        COUNTIF(rp_button_view) AS rp_button_view,
        COUNTIF(rp_button_view AND email_first_view) AS rp_button_email_first_view,# new FxA + existing FxA not looged in
        COUNTIF(rp_button_view AND reg_view) AS sign_up_view,
        COUNTIF(rp_button_view AND login_view AND NOT reg_view) AS login_view,#existing FxA both not logged in and already logged in before entering to the funnel
        # COUNTIF(login_view AND  reg_view ) AS wierd,
        COUNTIF(rp_button_view AND login_view AND NOT email_first_view) AS rp_button_login_view_loggedinFxA
      FROM
        condition_flow_id
      GROUP BY
        1
      ORDER BY
        partition_date
    )
  SELECT f.partition_date as `date`,
          rp_button_view as CTA_impression,
          rp_button_email_first_view + rp_button_login_view_loggedinFxA as total_top_funnel,
          sign_up_view as new_sign_up_view,
          login_view as existing_login_view,
          # email_first_view,
          # rp_button_email_first_view,
          # existing_FxA_start,
          pay_setup_view,
          new_pay_setup_view AS new_pay_setup_view,
          existing_pay_setup_view AS existing_pay_setup_view,
          pay_setup_complete as total_bottom_funnel,
          new_pay_setup_complete AS new_pay_setup_complete,
          existing_pay_setup_complete AS existing_pay_setup_complete
  FROM counting_flow_id AS f
  LEFT JOIN counting_user_id AS u
  ON f.partition_date = u.partition_date
  ORDER BY f.partition_date ;;
  }
  dimension_group: date{
    description: "date of event"
    type: time
    sql: ${TABLE}.date ;;
  }


#view: reg_log {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: test1 {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
