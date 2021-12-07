view: newfunnel_from08252021 {

    sql_table_name: mozdata.tmp.yeonjoo_new_funnel  ;;#temp table created to speed up loading

    filter: country {
      type: string
      sql: ${TABLE}.country ;;
    }
    filter: UTM_medium {
      type: string
      sql: {% condition %} ${TABLE}.utm_medium {% endcondition %};;
    }
    filter: UTM_source {
      type: string
      sql: {% condition %} ${TABLE}.utm_source {% endcondition %} ;;
    }
    filter: UTM_campaign {
      type: string
      sql: {% condition %} ${TABLE}.utm_campaign {% endcondition %} ;;
    }
    filter: UTM_content {
      type: string
      sql: {% condition %} ${TABLE}.utm_content {% endcondition %} ;;
    }
    filter: UTM_term {
      type: string
      sql: {% condition %} ${TABLE}.utm_term {% endcondition %} ;;
    }
    filter: entrypoint_experiment {
      type: string
      sql: {% condition %} ${TABLE}.entrypoint_experiment {% endcondition %} ;;
    }
    filter: entrypoint_variation {
      type: string
      sql: {% condition %} ${TABLE}.entrypoint_variation {% endcondition %};;
    }
    filter: ua_browser {
      type: string
      sql: {% condition %} ${TABLE}.ua_browser {% endcondition %} ;;
    }
    filter: ua_version {
      type: string
      sql: {% condition %} ${TABLE}.ua_version {% endcondition %} ;;
    }
    filter: OS_name {
      type: string
      sql: {% condition %} ${TABLE}.os_name {% endcondition %} ;;
    }
    filter: OS_version {
      type: string
      sql: {% condition %} ${TABLE}.os_version {% endcondition %} ;;
    }
    filter: pricing_plan {
      type: string
      sql: {% condition %} ${TABLE}.pricing_plan {% endcondition %} ;;
    }
    filter: plan_name {
      type: string
      sql: {% condition %} ${TABLE}.plan_name {% endcondition %} ;;
    }
    # plan_id,
    # product_id,
    dimension_group: start{
      description: "date of event"
      type: time
      sql: ${TABLE}.partition_date ;;
    }

    measure: VPN_site_hits{
      type: sum
      sql: ${TABLE}.VPN_site_hits ;;
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


    measure: total_payment_setup_engage {
      type: sum
      #need to fix this to total_payment_setup_engage when the table is renewed
      sql: ${TABLE}.total_payment_setup_engage ;;
    }
    measure: total_payment_setup_complete {
      type: sum
      #need to fix this to total_payment_setup_complete when the table is renewed
      sql: ${TABLE}.total_payment_setup_complete ;;
    }


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

    measure:  Existing_FxA_SignedOff_signin_CTA_click{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_signin_CTA_click_top ;;
    }
    measure:  Existing_SignedOff_FxA_payment_setup_view{
      type: sum
      sql: ${TABLE}.Existing_SignedOff_FxA_payment_setup_view ;;
    }
    measure:  Existing_FxA_SignedOff_payment_setup_engage{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_payment_setup_engage ;;
    }
    measure:  Existing_FxA_SignedOff_payment_setup_complete{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_payment_setup_complete ;;
    }
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
      sql: ${TABLE}.Existing_FxA_pay_setup_complete ;;
    }

}
