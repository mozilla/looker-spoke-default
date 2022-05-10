view: new_funnel_from_08252021 {

    sql_table_name: mozdata.tmp.yeonjoo_new_funnel  ;;#temp table created to speed up loading

    dimension: country {
      type: string
      sql: ${TABLE}.country ;;
    }
    dimension: UTM_medium {
      type: string
      sql:  ${TABLE}.utm_medium ;;
    }
    dimension: UTM_source {
      type: string
      sql:  ${TABLE}.utm_source  ;;
    }
    dimension: UTM_campaign {
      type: string
      sql:  ${TABLE}.utm_campaign  ;;
    }
    dimension: UTM_content {
      type: string
      sql:  ${TABLE}.utm_content  ;;
    }
    dimension: UTM_term {
      type: string
      sql:  ${TABLE}.utm_term  ;;
    }
    dimension: entrypoint_experiment {
      type: string
      sql:  ${TABLE}.entrypoint_experiment  ;;
    }
    dimension: entrypoint_variation {
      type: string
      sql:  ${TABLE}.entrypoint_variation ;;
    }
    dimension: ua_browser {
      type: string
      sql:  ${TABLE}.ua_browser  ;;
    }
    dimension: ua_version {
      type: string
      sql:  ${TABLE}.ua_version  ;;
    }
    dimension: OS_name {
      type: string
      sql:  ${TABLE}.os_name  ;;
    }
    dimension: OS_version {
      type: string
      sql:  ${TABLE}.os_version  ;;
    }
    dimension: pricing_plan {
      type: string
      sql:  ${TABLE}.pricing_plan  ;;
    }
    dimension: plan_name {
      type: string
      sql:  ${TABLE}.plan_name  ;;
    }
    dimension: Channel_group {
      type: string
      sql: ${TABLE}.channel_group ;;
    }
    # plan_id,
    # product_id,
  dimension_group: start{
    description: "date of event"
    type: time
    datatype: date
    convert_tz: no
    timeframes: [raw,date,week, month, quarter, year]
    sql:${TABLE}.partition_date ;;
  }

    measure: New_FxA_user_input_emails  {
      type: sum
      sql: ${TABLE}.New_FxA_user_input_emails ;;
    }
    measure: New_FxA_payment_setup_engage {
      type: sum
      sql: ${TABLE}.New_FxA_payment_setup_engage ;;
    }
    measure: New_FxA_payment_setup_complete {
      type: sum
      #need to fix the typo later when the table is renewed
      sql: ${TABLE}.New_FxA_payment_setup_complete ;;
    }
    # measure: overall_New_FxA_user_input_emails  {
    #   type: average
    #   sql: ${TABLE}.overall_New_FxA_user_input_emails ;;
    # }
    # measure: overall_New_FxA_payment_setup_complete {
    #   type: average
    #   #need to fix the typo later when the table is renewed
    #   sql: ${TABLE}.overall_New_FxA_payment_setup_complete ;;
    # }

    measure: New_FxA_CVR {
      type: number
      sql: CASE WHEN SUM(${TABLE}.New_FxA_user_input_emails) = 0 then 0
            ELSE round(cast(SUM(${TABLE}.New_FxA_payment_setup_complete)/SUM(${TABLE}.New_FxA_user_input_emails) *100 AS Float64))
            END;;
    }
    # measure: overall_New_FxA_CVR {
    #   type: average
    #   sql: CASE WHEN ${TABLE}.overall_New_FxA_user_input_emails = 0 then 0
    #   ELSE ROUND(CAST(${TABLE}.overall_New_FxA_payment_setup_complete/${TABLE}.overall_New_FxA_user_input_emails *100 AS Float64))
    #   END;;
    # }
  measure: VPN_site_hits{
    type: sum
    sql: ${TABLE}.VPN_site_hits ;;
  }
    measure: total_acquisition_process_start {
      type:  sum
      #pay_account_setup_view +Existing_FxA_SignedIn_pay_setup_view
      sql: ${TABLE}.total_acquisition_process_start ;;
    }
    measure: total_payment_setup_engage {
      type: sum
      sql: ${TABLE}.total_payment_setup_engage ;;
    }
    measure: total_payment_setup_complete {
      type: sum
      #need to fix this to total_payment_setup_complete when the table is renewed
      sql: ${TABLE}.total_payment_setup_complete ;;
    }
  # measure: overall_VPN_site_hits{
  #   type: average
  #   sql: ${TABLE}.overall_total_VPN_site_hits ;;
  # }
  # measure: overall_total_acquisition_process_start {
  #   type:  average
  #   #type needs to be fixed
  #   sql: ${TABLE}.overall_total_acquisition_process_start ;;
  # }
  # measure: overall_total_payment_setup_complete {
  #   type: average
  #   sql: ${TABLE}.overall_total_payment_setup_complete ;;
  # }
    measure: CTR_from_VPN_site_hits_to_enter_the_funnel {
      type: number
      sql: CASE WHEN SUM(${TABLE}.VPN_site_hits)= 0 then 0
            ELSE round(cast(SUM(${TABLE}.total_acquisition_process_start)/SUM(${TABLE}.VPN_site_hits) *100 AS Float64))
            END;;
    }
    measure:CVR_from_VPN_site_hits_to_payment_complete {
      type: average
      sql:CASE WHEN ${TABLE}.VPN_site_hits = 0 then 0
            ELSE round(cast(${TABLE}.total_payment_setup_complete/${TABLE}.VPN_site_hits *100 AS Float64))
            END;;
    }
    measure: CVR_from_payment_site_hits_to_payment_complete {
      type: number
      sql:CASE WHEN SUM(${TABLE}.total_acquisition_process_start)= 0 then 0
      ELSE round(cast(SUM(${TABLE}.total_payment_setup_complete)/SUM(${TABLE}.total_acquisition_process_start) *100 AS Float64))
      END;;
    }
    # measure: overall_CTR_from_VPN_site_hits_to_enter_the_funnel {
    #   type: average
    #   sql: CASE WHEN ${TABLE}.overall_total_VPN_site_hits = 0 then 0
    #         ELSE round(cast(${TABLE}.overall_total_acquisition_process_start/${TABLE}.overall_total_VPN_site_hits *100 AS Float64))
    #         END;;
    # }
    # measure:overall_CVR_from_VPN_site_hits_to_payment_complete {
    #   type: average
    #   sql:CASE WHEN ${TABLE}.overall_VPN_site_hits = 0 then 0
    #           ELSE round(cast(${TABLE}.overall_total_payment_setup_complete/${TABLE}.overall_VPN_site_hits *100 AS Float64))
    #           END;;
    # }
    # measure: overall_CVR_from_payment_site_hits_to_payment_complete {
    #   type: average
    #   sql:CASE WHEN ${TABLE}.overall_total_acquisition_process_start = 0 then 0
    #     ELSE round(cast(${TABLE}.overall_total_payment_setup_complete/${TABLE}.overall_total_acquisition_process_start*100 AS Float64))
    #     END;;
    # }

    measure:  Existing_FxA_SignedIn_payment_setup_view{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedIn_payment_setup_view ;;
    }
    measure:  Existing_FxA_SignedIn_payment_setup_engage{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedIn_payment_setup_engage ;;
    }
    measure:  Existing_FxA_SignedIn_payment_setup_complete{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedIn_payment_setup_complete ;;
    }
    # measure:  overall_Existing_FxA_SignedIn_payment_setup_view{
    #   type: average
    #   sql: ${TABLE}.overall_Existing_FxA_SignedIn_payment_setup_view ;;
    # }
    # measure:  overall_Existing_FxA_SignedIn_payment_setup_complete{
    #   type: average
    #   sql: ${TABLE}.overall_Existing_FxA_SignedIn_payment_setup_complete ;;
    # }
    measure: Existing_Fxa_SignedIn_CVR {
      type: number
      sql:CASE WHEN SUM(${TABLE}.Existing_FxA_SignedIn_payment_setup_view) = 0 then 0
      ELSE round(cast(SUM(${TABLE}.Existing_FxA_SignedIn_payment_setup_complete)/SUM(${TABLE}.Existing_FxA_SignedIn_payment_setup_view) *100 AS Float64))
      END;;
    }
    # measure: overall_Existing_Fxa_SignedIn_CVR {
    #   type: average
    #   sql: CASE WHEN ${TABLE}.overall_Existing_FxA_SignedIn_payment_setup_view = 0 THEN 0
    #             ELSE ROUND(CAST(${TABLE}.overall_Existing_FxA_SignedIn_payment_setup_complete/${TABLE}.overall_Existing_FxA_SignedIn_payment_setup_view*100 AS Float64))
    #             END;;
    # }
    measure:  Existing_FxA_SignedOff_signin_CTA_click{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_signin_CTA_click ;;
    }
    measure:  Existing_FxA_SignedOff_payment_setup_view{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_payment_setup_view ;;
    }
    measure:  Existing_FxA_SignedOff_payment_setup_engage{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_payment_setup_engage ;;
    }
    measure:  Existing_FxA_SignedOff_payment_setup_complete{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_payment_setup_complete ;;
    }
    # measure:  overall_Existing_SignedOff_FxA_payment_setup_view{
    #   type: average
    #   sql: ${TABLE}.overall_Existing_SignedOff_FxA_payment_setup_view ;;
    # }
    # measure:  overall_Existing_FxA_SignedOff_payment_setup_complete{
    #   type: average
    #   sql: ${TABLE}.overall_Existing_FxA_SignedOff_payment_setup_complete ;;
    # }
    measure: Existing_FxA_SignedOff_CVR {
      type: number
      sql:CASE WHEN SUM(${TABLE}.Existing_FxA_SignedOff_signin_CTA_click) = 0 then 0
        ELSE round(cast(SUM(${TABLE}.Existing_FxA_SignedOff_payment_setup_complete)/SUM(${TABLE}.Existing_FxA_SignedOff_signin_CTA_click) *100 AS Float64))
        END;;
  }
  # measure: overall_Existing_Fxa_SignedOff_CVR {
  #   type: average
  #   sql:CASE WHEN ${TABLE}.overall_Existing_FxA_SignedOff_signin_CTA_click = 0 then 0
  #     ELSE round(cast(${TABLE}.overall_Existing_FxA_SignedOff_payment_setup_complete/${TABLE}.overall_Existing_FxA_SignedOff_signin_CTA_click *100 AS Float64))
  #     END;;
  # }
    measure:  Existing_FxA_payment_setup_view{
      type: sum
      sql: ${TABLE}.Existing_FxA_payment_setup_view ;;
    }
    measure:  Existing_FxA_payment_setup_engage{
      type: sum
      sql: ${TABLE}.Existing_FxA_payment_setup_engage ;;
    }
    measure: Existing_FxA_pay_setup_complete{
      type: sum
      sql: ${TABLE}.Existing_FxA_payment_setup_complete ;;
    }

}
