  view: oldfunnel_before08252021 {
    sql_table_name: mozdata.tmp.yeonjoo_old_funnel  ;;#temp table created to speed up loading

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
      sql: timestamp(${TABLE}.partition_date) ;;
    }
    measure: VPN_site_hits{
      type: sum
      sql: ${TABLE}.VPN_site_hits ;;
    }
    measure: New_FxA_reg_start  {
      type: sum
      sql: ${TABLE}.New_FxA_reg_view ;;
    }
    measure: New_FxA_account_create {
      type: sum
      sql: ${TABLE}.New_FxA_account_created ;;
    }
    measure: New_FxA_reg_complete {
      type: sum
      sql: ${TABLE}.New_FxA_reg_complete ;;
    }
    measure: New_FxA_login_complete {
      type: sum
      sql: ${TABLE}.New_FxA_login_complete ;;
    }
    measure: New_FxA_payment_setup_start {
      type: sum
      sql: ${TABLE}.New_FxA_payment_setup_start ;;
    }
    measure: New_FxA_payment_setup_engage {
      type: sum
      sql: ${TABLE}.New_FxA_payment_setup_engage ;;
    }
    measure: New_FxA_payment_complete {
      type: sum
      sql: ${TABLE}.New_FxA_payment_complete;;
    }

    measure: total_login_complete {
      type: sum
      sql: ${TABLE}.total_login_complete ;;
    }
    measure: total_payment_setup_start {
      type: sum
      sql: ${TABLE}.total_payment_setup_start ;;
    }
    measure: total_payment_complete {
      type: sum
      sql: ${TABLE}.total_payment_complete ;;
    }
    measure:  Existing_FxA_SignedIN_login_view{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedIN_login_view ;;
    }
    measure:  Existing_FxA_SignedIN_login_complete{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedIN_login_complete ;;
    }
    measure:  Existing_FxA_SignedOFF_login_view{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_login_view ;;
    }
    measure:  Existing_FxA_SignedOFF_login_complete{
      type: sum
      sql: ${TABLE}.Existing_FxA_SignedOff_login_complete ;;
    }
    measure:  Existing_FxA_login_view{
      type: sum
      sql: ${TABLE}.Existing_FxA_login_view ;;
    }
    measure:  Existing_FxA_login_complete{
      type: sum
      sql: ${TABLE}.Existing_FxA_login_complete ;;
    }
    measure:  Existing_FxA_paymet_setup_start{
      type: sum
      sql: ${TABLE}.Existing_FxA_payment_setup_start ;;
    }
    measure:  Existing_FxA_paymet_setup_engage{
      type: sum
      sql: ${TABLE}.Existing_FxA_payment_setup_engage ;;
    }
    measure:  Existing_FxA_payment_complete{
      type: sum
      sql: ${TABLE}.Existing_FxA_payment_complete ;;
    }
    measure: Unknown_payment_setup_start{
      type: sum
      sql:  ${TABLE}.Unknown_payment_setup_start ;;
    }
    measure: Unknown_payment_complete{
      type: sum
      sql:  ${TABLE}.Unknown_payment_complete ;;
    }

  }
