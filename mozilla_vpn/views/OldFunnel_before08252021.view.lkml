  view: oldfunnel_before08252021 {
    derived_table: {
      sql:
WITH filter_service AS
  (SELECT flow_id -- due to a bug, the auth server does not pass the service param for the DNT setting

   FROM mozdata.firefox_accounts.fxa_content_auth_stdout_events
   WHERE DATE(TIMESTAMP) <= DATE(2021, 8, 25)
     AND DATE(TIMESTAMP) > DATE(2021, 8, 1)
     AND (service = 'guardian-vpn'
          OR (event_type = 'fxa_rp_button - view'
              AND entrypoint = 'www.mozilla.org-vpn-product-page')) ),-- this will be updated once the service parameter get passed for 'fxa_rp_button - view'
 pp AS
  (SELECT *
   FROM moz-fx-data-shared-prod.mozilla_vpn_derived.marketing_plan_names_v1--from metadata for product_id and plan_id
),
 TEMP AS
  (SELECT product_id,
          product_name,
          plan_id,
          pricing_plan,
          count(*) AS cnt
   FROM `moz-fx-data-shared-prod`.mozilla_vpn_derived.all_subscriptions_v1
   WHERE provider LIKE 'FxA%'--this table includes mobile purchases
GROUP BY 1,
         2,
         3,
         4), pricing_plan AS
  (SELECT p.*,
          t.pricing_plan
   FROM pp AS p
   LEFT JOIN TEMP AS t ON t.plan_id =p.plan_id
   AND t.product_id = p.product_id),
             big_table AS
  (SELECT date(`timestamp`) partition_date,
          service,
          country,
          event_type,
          c1.flow_id,
          user_id,
          entrypoint_experiment,
          entrypoint_variation,
          utm_campaign,
          utm_content,
          utm_medium,
          utm_source,
          utm_term,
          ua_browser,
          ua_version,
          os_name,
          os_version,
          p.plan_id,
          p.product_id,
          p.pricing_plan,
          p.plan_name
   FROM mozdata.firefox_accounts.fxa_content_auth_stdout_events AS c1
   JOIN filter_service AS c2 ON c1.flow_id = c2.flow_id
   LEFT JOIN pricing_plan AS p ON c1.plan_id = p.plan_id
   WHERE date(TIMESTAMP)<date(2021, 8, 25)
     AND date(TIMESTAMP)>=date(2021, 8, 1) ),
             condition_flow_id AS
  (SELECT partition_date,
          flow_id,
          max(service) AS service,
          max(country) AS country,
          max(utm_medium) AS utm_medium,
          max(utm_source) AS utm_source,
          max(utm_campaign) AS utm_campaign,
          max(utm_content) AS utm_content,
          max(utm_term) AS utm_term,
          MAX(entrypoint_experiment) AS entrypoint_experiment,
          max(entrypoint_variation) AS entrypoint_variation,
          max(ua_browser) AS ua_browser,
          max(ua_version) AS ua_version,
          max(os_name) AS os_name,
          max(os_version) AS os_version,
          max(plan_id) AS plan_id,
          max(product_id) AS product_id,
          max(pricing_plan) AS pricing_plan,
          max(plan_name) AS plan_name,
          LOGICAL_OR(event_type ='fxa_rp_button - view') AS rp_button_view,-- impression for the CTA button
 LOGICAL_OR(event_type ='fxa_login - view') AS login_view,
 LOGICAL_OR(event_type ='fxa_reg - view') AS reg_view,
 LOGICAL_OR(event_type ='fxa_login - complete'
            AND user_id IS NULL) AS login_complete_user_id_X,
 LOGICAL_OR(event_type = 'fxa_email_first - view') AS email_first_view,-- top of the funnel for total users before devided into new/existing
 LOGICAL_OR(event_type ='fxa_login - complete') AS login_complete,
 LOGICAL_OR(event_type = 'fxa_reg - created') AS reg_created,
 LOGICAL_OR(event_type = 'fxa_reg - complete') AS reg_complete,
 LOGICAL_OR(event_type = 'fxa_pay_setup - view') AS pay_setup_view,
 LOGICAL_OR(event_type = 'fxa_pay_setup - 3ds_complete') AS pay_setup_complete-- bottom of the funnel for both new/existing FxA users

   FROM big_table
   GROUP BY 1,
            2),
             counting_flow_id AS
  (SELECT partition_date,
          service,
          country,
          utm_medium,
          utm_source,
          utm_campaign,
          utm_content,
          utm_term,
          entrypoint_experiment,
          entrypoint_variation,
          ua_browser,
          ua_version,
          os_name,
          os_version,
          plan_id,
          product_id,
          pricing_plan,
          plan_name,
          COUNTIF(rp_button_view) AS rp_button_view,
          COUNTIF(email_first_view) AS email_first_view, -- existing FxA already logged users do not get this event,i.e. NOT total traffic on the top
 COUNTIF(reg_view) AS reg_view,-- New FxA users top event
 -- countif(login_view) as login_view,
 COUNTIF(login_view
         AND NOT reg_view) AS login_view_not_reg_view,-- Exsiting FxA users top events
 COUNTIF(login_view
         AND NOT reg_view
         AND NOT email_first_view) AS Existing_FxA_SignedIN_login_view,
 countif(login_complete) AS login_complete,
 COUNTIF(reg_complete
         AND login_complete) AS reg_log_complete,-- login complete for new fxa does not have user id
 COUNTIF(login_complete
         AND NOT reg_complete) AS login_complete_not_reg_complete,-- check point1 for existing FxA users
 COUNTIF(login_complete
         AND NOT reg_complete
         AND NOT email_first_view) AS Exisinting_FxA_SignedIN_login_complete --

   FROM condition_flow_id
   GROUP BY 1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16,
            17,
            18
   ORDER BY partition_date), -- # select * from condition_flow_id where NOT reg_complete AND NOT login_complete AND pay_setup_view
 condition_user_id AS
  (SELECT partition_date,
          user_id,
          max(service) AS service,
          max(country) AS country,
          max(utm_medium) AS utm_medium,
          max(utm_source) AS utm_source,
          max(utm_campaign) AS utm_campaign,
          max(utm_content) AS utm_content,
          max(utm_term) AS utm_term,
          MAX(entrypoint_experiment) AS entrypoint_experiment,
          max(entrypoint_variation) AS entrypoint_variation,
          max(ua_browser) AS ua_browser,
          max(ua_version) AS ua_version,
          max(os_name) AS os_name,
          max(os_version) AS os_version,
          max(plan_id) AS plan_id,
          max(product_id) AS product_id,
          max(pricing_plan) AS pricing_plan,
          max(plan_name) AS plan_name,
          LOGICAL_OR(event_type = 'fxa_reg - created') AS reg_created,
          LOGICAL_OR(event_type = 'fxa_reg - complete') AS reg_complete,
          LOGICAL_OR(event_type = 'fxa_pay_setup - view') AS pay_setup_view,
          LOGICAL_OR(event_type = 'fxa_pay_setup - 3ds_complete') AS pay_setup_complete,-- bottom of the funnel for both new/existing FxA users
 LOGICAL_OR(event_type ='fxa_login - complete') AS login_complete
   FROM big_table
   GROUP BY 1,
            2),
 counting_user_id AS
  (SELECT partition_date,
          service,
          country,
          utm_medium,
          utm_source,
          utm_campaign,
          utm_content,
          utm_term,
          entrypoint_experiment,
          entrypoint_variation,
          ua_browser,
          ua_version,
          os_name,
          os_version,
          plan_id,
          product_id,
          pricing_plan,
          plan_name,
          COUNTIF(reg_created) AS reg_created,--check point1 for new FxA users
--   COUNTIF(reg_created AND reg_complete) as reg_created_complete,--check point1 for new FxA users
 COUNTIF(reg_complete) AS reg_complete,
 COUNTIF(pay_setup_view) AS pay_setup_view,
 COUNTIF(reg_complete
         AND pay_setup_view) AS reg_complete_pay_setup_view,
 COUNTIF(pay_setup_view
         AND login_complete
         AND NOT reg_complete) AS login_complete_pay_setup_view_not_reg_complete,
 COUNTIF(pay_setup_view
         AND NOT login_complete
         AND NOT reg_complete) AS pay_setup_view_UNKNOWN,
 COUNTIF(pay_setup_complete) AS pay_setup_complete,
 COUNTIF(reg_complete
         AND pay_setup_complete) AS reg_complete_pay_setup_complete,
 COUNTIF(pay_setup_complete
         AND NOT reg_complete
         AND NOT login_complete) AS pay_setup_complete_UNKNOWN,
 COUNTIF(login_complete
         AND pay_setup_complete
         AND NOT reg_complete) AS login_complete_pay_setup_complete_not_reg_complete -- # COUNTIF(not login_complete AND pay_setup_complete AND NOT reg_complete) AS not_reg_login_complete_pay_setup_complete,

   FROM condition_user_id
   GROUP BY 1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16,
            17,
            18
   ORDER BY partition_date),
 combined2 AS
  (SELECT partition_date,
          service,
          country,
          utm_medium,
          utm_source,
          utm_campaign,
          utm_content,
          utm_term,
          entrypoint_experiment,
          entrypoint_variation,
          ua_browser,
          ua_version,
          os_name,
          os_version,
          plan_id,
          product_id,
          pricing_plan,
          plan_name,
          rp_button_view AS VPN_site_hits,
          reg_view AS New_FxA_reg_view,-- New FxA users top event
 login_view_not_reg_view AS Existing_FxA_login_view,-- Exsiting FxA users top events
 Existing_FxA_SignedIN_login_view,
 login_view_not_reg_view - Existing_FxA_SignedIN_login_view AS Existing_FxA_SignedOff_login_view,
 login_complete AS total_login_complete,
 reg_log_complete AS New_FxA_login_complete,
 login_complete_not_reg_complete AS Existing_FxA_login_complete,-- check point1 for existing FxA users
 login_complete_not_reg_complete -Exisinting_FxA_SignedIN_login_complete AS Existing_FxA_SignedOff_login_complete,
 Exisinting_FxA_SignedIN_login_complete,
 NULL AS New_FxA_account_created,
 NULL AS New_FxA_reg_complete,
 NULL AS total_payment_setup_start,
 NULL AS New_FxA_payment_setup_start,
 NULL AS Existing_FxA_payment_setup_start,
 NULL AS Unknonw_payment_setup_start,
 NULL AS total_payment_complete,
 NULL AS New_FxA_payment_complete,
 NULL AS Unknown_payment_complete,
 NULL AS Existing_FxA_payment_complete
   FROM counting_flow_id
   UNION ALL SELECT partition_date,
                    service,
                    country,
                    utm_medium,
                    utm_source,
                    utm_campaign,
                    utm_content,
                    utm_term,
                    entrypoint_experiment,
                    entrypoint_variation,
                    ua_browser,
                    ua_version,
                    os_name,
                    os_version,
                    plan_id,
                    product_id,
                    pricing_plan,
                    plan_name,
                    NULL AS VPN_site_hits,
                    NULL AS New_FxA_reg_view,-- New FxA users top event
 NULL AS Existing_FxA_login_view,-- Exsiting FxA users top events
 NULL AS Existing_FxA_SignedIN_login_view,
 NULL AS Existing_FxA_SignedOff_login_view,
 NULL AS total_login_complete,
 NULL AS New_FxA_login_complete,-- check point1 for existing FxA users
 NULL AS Existing_FxA_login_complete,
 NULL AS Existing_FxA_SignedOff_login_complete,
 NULL AS Exisinting_FxA_SignedIN_login_complete,
 reg_created AS New_FxA_account_created,
 reg_complete AS New_FxA_reg_complete,
 pay_setup_view AS total_payment_setup_start,
 reg_complete_pay_setup_view AS New_FxA_payment_setup_start,
 login_complete_pay_setup_view_not_reg_complete AS Existing_FxA_payment_setup_start,
 pay_setup_view_UNKNOWN AS Unknonw_payment_setup_start,
 pay_setup_complete AS total_payment_complete,
 reg_complete_pay_setup_complete AS New_FxA_payment_complete,
 pay_setup_complete_UNKNOWN AS Unknown_payment_complete,
 login_complete_pay_setup_complete_not_reg_complete AS Existing_FxA_payment_complete
   FROM counting_user_id)
SELECT partition_date,
       service,
       country,
       utm_medium,
       utm_source,
       utm_campaign,
       utm_content,
       utm_term,
       entrypoint_experiment,
       entrypoint_variation,
       ua_browser,
       ua_version,
       os_name,
       os_version,
       plan_id,
       product_id,
       pricing_plan,
       plan_name,
       MAX(VPN_site_hits) AS VPN_site_hits,
       MAX(New_FxA_reg_view) AS New_FxA_reg_view,-- New FxA users top event
 MAX(Existing_FxA_login_view) AS Existing_FxA_login_view,-- Exsiting FxA users top events
 MAX(Existing_FxA_SignedIN_login_view) AS Existing_FxA_SignedIN_login_view,
 MAX(Existing_FxA_SignedOff_login_view)AS Existing_FxA_SignedOff_login_view,
 MAX(New_FxA_login_complete) AS New_FxA_login_complete,
 MAX(Existing_FxA_login_complete) AS Existing_FxA_login_complete,
 MAX(Existing_FxA_SignedOff_login_complete) AS Existing_FxA_SignedOff_login_complete,
 MAX(Exisinting_FxA_SignedIN_login_complete) AS Exisinting_FxA_SignedIN_login_complete,
 MAX(total_login_complete) AS total_login_complete,
 MAX(New_FxA_account_created) AS New_FxA_account_created,
 MAX(New_FxA_reg_complete) AS New_FxA_reg_complete,
 MAX(total_payment_setup_start) AS total_payment_setup_start,
 MAX(New_FxA_payment_setup_start) AS New_FxA_payment_setup_start,
 MAX(Existing_FxA_payment_setup_start) AS Existing_FxA_payment_setup_start,
 MAX(Unknonw_payment_setup_start) AS Unknonw_payment_setup_start,
 MAX(total_payment_complete) AS total_payment_complete,
 MAX(New_FxA_payment_complete) AS New_FxA_payment_complete,
 MAX(Unknown_payment_complete) AS Unknown_payment_complete,
 MAX(Existing_FxA_payment_complete) AS Existing_FxA_payment_complete
FROM combined2
GROUP BY 1,
         2,
         3,
         4,
         5,
         6,
         7,
         8,
         9,
         10,
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18
ORDER BY partition_date;;
    }
    filter: utm_medium {
      type: string
      sql: ${TABLE}.utm_medium ;;
    }
    dimension_group: start{
      description: "date of event"
      type: time
      sql: ${TABLE}.partition_date ;;
    }
    dimension: VPN_site_hits{
      primary_key: no
      sql: ${TABLE}.VPN_site_hits ;;
    }
    dimension: New_FxA_reg_start  {
      primary_key:  no
      sql: ${TABLE}.New_FxA_reg_view ;;
    }
    dimension: New_FxA_account_creat {
      primary_key: no
      sql: ${TABLE}.New_FxA_account_created ;;
    }
    dimension: New_FxA_reg_complete {
      primary_key: no
      sql: ${TABLE}.New_FxA_reg_complete ;;
    }
    dimension: New_FxA_login_complete {
      primary_key: no
      sql: ${TABLE}.New_FxA_login_complete ;;
    }
    dimension: New_FxA_payment_setup_start {
      primary_key: no
      sql: ${TABLE}.New_FxA_payment_setup_start ;;
    }
    dimension: New_FxA_payment_complete {
      primary_key: no
      sql: ${TABLE}.New_FxA_payment_complete;;
    }

    # dimension: total_payment_setup_start {
    #   primary_key: no
    #   sql: ${TABLE}.total_payment_setup_start ;;
    # }
    # dimension: total_payment_setup_start {
    #   primary_key: no
    #   sql: ${TABLE}.total_payment_setup_start ;;
    # }
# MAX(Existing_FxA_login_view) AS Existing_FxA_login_view,-- Exsiting FxA users top events
# MAX(Existing_FxA_SignedIN_login_view) AS Existing_FxA_SignedIN_login_view,
# MAX(Existing_FxA_SignedOff_login_view)AS Existing_FxA_SignedOff_login_view,

# MAX(Existing_FxA_login_complete) AS Existing_FxA_login_complete,
# MAX(Existing_FxA_SignedOff_login_complete) AS Existing_FxA_SignedOff_login_complete,
# MAX(Exisinting_FxA_SignedIN_login_complete) AS Exisinting_FxA_SignedIN_login_complete,
# MAX(total_login_complete) AS total_login_complete,



# MAX(New_FxA_payment_setup_start) AS New_FxA_payment_setup_start,
# MAX(Existing_FxA_payment_setup_start) AS Existing_FxA_payment_setup_start,
# MAX(Unknonw_payment_setup_start) AS Unknonw_payment_setup_start,
# MAX(total_payment_complete) AS total_payment_complete,

# MAX(Unknown_payment_complete) AS Unknown_payment_complete,
# MAX(Existing_FxA_payment_complete) AS Existing_FxA_payment_complete
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
