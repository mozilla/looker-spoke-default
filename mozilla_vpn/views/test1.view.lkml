view: test1 {
  derived_table: {
    sql:
WITH
  # fxa_stdout_events AS (
  # SELECT
  #   PARSE_DATE('%y%m%d',
  #     _TABLE_SUFFIX) AS partition_date,
  #   `timestamp`,
  #   --jsonPayload.fields.event_properties,
  #   json_value(jsonPayload.fields.user_properties,
  #     '$.flow_id') AS flow_id,
  #   TO_HEX(SHA256(jsonPayload.fields.user_id)) AS user_id,
  #   --jsonPayload.fields.user_properties,
  #   jsonPayload.fields.event_type AS event_type,
  #   json_value(jsonPayload.fields.user_properties,
  #     '$.entrypoint') AS entrypoint,
  #   json_value(jsonPayload.fields.user_properties,
  #     '$.utm_campaign') AS utm_campaign,
  #   json_value(jsonPayload.fields.user_properties,
  #     '$.utm_medium') AS utm_medium,
  #   json_value(jsonPayload.fields.user_properties,
  #     '$.utm_source') AS utm_source,
  #   json_value(jsonPayload.fields.event_properties,
  #     '$.checkout_type') AS checkout_type,
  #   json_value(jsonPayload.fields.event_properties,
  #     '$.plan_id') AS plan_id,
  #   json_value(jsonPayload.fields.event_properties,
  #     '$.product_id') AS product_id,
  #   json_value(jsonPayload.fields.event_properties,
  #     '$.service') AS service,
  #   --creating null column to union all with fxa_content_auth_events
  #   JSON_VALUE(jsonPayload.fields.user_properties,
  #     '$.entrypoint_experiment') AS entrypoint_experiment,
  #   -- null column
  #   JSON_VALUE(jsonPayload.fields.user_properties,
  #     '$.entrypoint_variation') AS entrypoint_variation,
  #   -- null column
  #   JSON_VALUE(jsonPayload.fields.user_properties,
  #     '$.utm_content') AS utm_content,
  #   -- null column
  #   JSON_VALUE(jsonPayload.fields.user_properties,
  #     '$.utm_term') AS utm_term -- null column
  # FROM
  #   `moz-fx-fxa-prod-0712.fxa_prod_logs.stdout_20*`
  # WHERE
  #   jsonPayload.type = 'amplitudeEvent'
  #   AND DATE(timestamp) >= DATE(2021,7,1)
  #   AND DATE(timestamp) < DATE(2021,8,25) ),
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
    (SELECT c1.*
     FROM mozdata.firefox_accounts.fxa_content_auth_events as c1
     JOIN (SELECT *
            FROM mozdata.firefox_accounts.fxa_content_auth_events
            WHERE
              DATE(timestamp) >= DATE(2021,7,1)
              AND DATE(timestamp) < DATE(2021,8,25)
              --AND DATE(timestamp) < DATE(2021,10,18)
              --DATE(timestamp) >= DATE(2021,8,1)
              --AND DATE(timestamp) < DATE(2021,8,25)
              AND (service = 'guardian-vpn'
                OR (event_type = 'fxa_rp_button - view'
                  AND entrypoint = 'www.mozilla.org-vpn-product-page'))
            ) as c2
          ON c1.flow_id = c2.flow_id--this inner join is due to the bug that not passins the service parameter under DNT
    ) c3
    WHERE
    DATE(c3.timestamp) < DATE(2021,8,25)
              AND DATE(c3.timestamp) >= DATE(2021,7,1)
  # UNION ALL
  # SELECT
  #   partition_date,
  #   `timestamp`,
  #   service,
  #   event_type,
  #   flow_id,
  #   user_id,
  #   entrypoint_experiment,
  #   entrypoint_variation,
  #   utm_campaign,
  #   utm_content,
  #   utm_medium,
  #   utm_source,
  #   utm_term,
  # FROM
  #   fxa_stdout_events
  ),
  condition_flow_id AS(
  SELECT
    partition_date,
    flow_id,
    --DATE(timestamp) AS `date`, flow_id,
    LOGICAL_OR( event_type ='fxa_rp_button - view' ) AS rp_button_view,-- impression for the CTA button
    LOGICAL_OR( event_type ='fxa_login - view' ) AS login_view,
    LOGICAL_OR( event_type ='fxa_reg - view' ) AS reg_view,
    --LOGICAL_OR( event_type ='fxa_login - complete' AND user_id IS NULL) AS new_login_complete,
    LOGICAL_OR( event_type = 'fxa_email_first - view') AS email_first_view,-- top of the funnel for total users before devided into new/existing
    --LOGICAL_OR( event_type = 'fxa_pay_setup - view') AS pay_setup_view,
    LOGICAL_OR( event_type ='fxa_login - complete' ) AS login_complete
  FROM
    combined
  GROUP BY
    1,
    2 ),
  counting_flow_id AS (
  SELECT
    partition_date,
    COUNTIF(rp_button_view) AS rp_button_view,
    --COUNTIF(email_first_view) AS just_email_first_view, -- existing FxA already logged users do not get this event,i.e. NOT total traffic on the top
    COUNTIF(reg_view) AS reg_view,-- New FxA users top event
    COUNTIF(login_view AND NOT reg_view) AS login_view_not_reg_view,-- Exsiting FxA users top events

  FROM
    condition_flow_id
  GROUP BY
    1
  ORDER BY
    partition_date
),
  condition_user_id AS(
  SELECT
    partition_date,
    user_id,
    --DATE(timestamp) AS `date`, flow_id,
    --LOGICAL_OR( event_type ='fxa_rp_button - view' ) AS rp_button_view,
    --LOGICAL_OR( event_type ='fxa_login - view' ) AS login_view,
    --LOGICAL_OR( event_type = 'fxa_email_first - view') AS email_first_view,
    LOGICAL_OR( event_type = 'fxa_reg - created') AS reg_created,
    LOGICAL_OR( event_type = 'fxa_reg - complete') AS reg_complete,
    # LOGICAL_OR( event_type = 'fxa_pay_setup - view') AS pay_setup_view,
    # LOGICAL_OR( event_type = 'fxa_pay_setup - 3ds_complete') AS pay_setup_complete,-- bottom of the funnel for both new/existing FxA users
    LOGICAL_OR( event_type ='fxa_login - complete' ) AS login_complete
  FROM
    combined
  GROUP BY
    1,
    2 ),
    counting_user_id AS (
      SELECT
        partition_date,
        --COUNTIF(reg_created) as just_reg_created,
        --COUNTIF(reg_created AND reg_complete) as reg_created_complete,--check point1 for new FxA users
        COUNTIF(reg_complete) as reg_complete,
        COUNTIF(reg_complete AND login_complete) as reg_log_complete,
        COUNTIF(login_complete AND NOT reg_complete) as login_complete_not_reg_complete,-- check point1 for existing FxA users
        # COUNTIF(pay_setup_view) AS just_pay_setup_view,
        # COUNTIF(reg_complete AND pay_setup_view) AS reg_complete_pay_setup_view,
        # COUNTIF(NOT reg_complete AND NOT login_complete AND pay_setup_view) AS not_reg_login_complete_paysetup_view,
        # COUNTIF(reg_complete AND login_complete AND pay_setup_view) AS reg_login_complete_pay_setup_view,
        # COUNTIF(login_complete AND pay_setup_view AND NOT reg_complete) AS login_complete_pay_setup_view_not_reg_complete,
        # COUNTIF(reg_complete AND pay_setup_complete) AS reg_complete_pay_setup_complete,
        # COUNTIF(login_complete AND pay_setup_complete AND NOT reg_complete) AS login_complete_pay_setup_complete_not_reg_complete,
        # COUNTIF(not login_complete AND pay_setup_complete AND NOT reg_complete) AS not_reg_login_complete_pay_setup_complete,
        # COUNTIF(pay_setup_complete) AS just_pay_setup_complete
      FROM
        condition_user_id
      GROUP BY
        1
      ORDER BY
        partition_date
    )
  SELECT f.partition_date,
          f.rp_button_view as Get_Mozilla_VPN_CTA_impression,
          f.reg_view as Registration_start_NewFxA,
          f.login_view_not_reg_view as Login_start_ExistingFxA,
          u.reg_complete as Regstration_complete_NewFxA,
          u.login_complete_not_reg_complete as Login_complete_ExsistingFxA--,
          # u.reg_complete_pay_setup_view as Payment_start_NewFxA,
          # u.login_complete_pay_setup_complete_not_reg_complete as Payment_start_ExistingFxA,
          # u.not_reg_login_complete_paysetup_view as Payment_start_Unknown,
          # u.reg_complete_pay_setup_complete as Payment_complete_NewFxA,
          # u.login_complete_pay_setup_complete_not_reg_complete as Payment_complete_ExistingFxA,
          # u.not_reg_login_complete_pay_setup_complete as Payment_complete_Unknown
  FROM counting_flow_id AS f
  LEFT JOIN counting_user_id AS u
  ON f.partition_date = u.partition_date
  ORDER BY f.partition_date ;;
  }
  dimension_group: start{
    description: "date of event"
    type: time
    sql: ${TABLE}.partition_date;;
    # timeframes: [date,week,month]
    datatype: date
  }
  dimension: VPN_site_hits{
    primary_key: no
    sql: ${TABLE}.Get_Mozilla_VPN_CTA_impression ;;
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
