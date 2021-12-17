  view: old_funnel_before_08252021 {

    sql_table_name: mozdata.tmp.yeonjoo_old_funnel ;;
    #temp table created to speed up loading

    dimension: country {
      type: string
      sql:  ${TABLE}.country  ;;
    }
    dimension: UTM_medium {
      type: string
      sql: ${TABLE}.utm_medium ;;
    }
    dimension: UTM_source {
      type: string
      sql:  ${TABLE}.utm_source ;;
    }
    dimension: UTM_campaign {
      type: string
      sql:  ${TABLE}.utm_campaign  ;;
    }
    dimension: UTM_content {
      type: string
      sql: ${TABLE}.utm_content  ;;
    }
    dimension: UTM_term {
      type: string
      sql:  ${TABLE}.utm_term ;;
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
    measure: VPN_site_hits{
      type: sum
      sql: ${TABLE}.VPN_site_hits ;;
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
    measure:  Existing_FxA_payment_setup_start{
      type: sum
      sql: ${TABLE}.Existing_FxA_payment_setup_start ;;
    }
    measure:  Existing_FxA_payment_setup_engage{
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
