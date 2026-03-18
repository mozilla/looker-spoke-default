include: "//looker-hub/mozilla_vpn/views/funnel_product_page_to_subscribed_table.view"
view: +funnel_product_page_to_subscribed_table {
  #For all users
  measure: product_page_visit {
    sql: ${TABLE}.vpn_site_hits ;;
    type: sum
  }
  dimension: vpn_site_hits {
    hidden:  yes
  }
  measure: all_users_step1_acquisition_process_start {
    sql: ${TABLE}.total_acquisition_process_start ;;
    type: sum
  }
  dimension: total_acquisition_process_start{
    hidden:  yes
  }
  measure: all_users_step2_payment_setup_engage{
    sql: ${TABLE}.total_payment_setup_engage ;;
    type: sum
  }
  dimension: total_payment_setup_engage{
    hidden: yes
  }
  measure: all_users_step3_payment_setup_complete {
    sql: ${TABLE}.total_payment_setup_complete ;;
    type: sum
  }
  dimension: total_payment_setup_complete  {
    hidden: yes
  }

  #Conversion rate for all users
  measure: CTR_from_product_page_visit_to_entering_subscription_flow {
    type: number
    sql: CASE WHEN SUM(${TABLE}.vpn_site_hits)= 0 then 0
            ELSE round(cast(SUM(${TABLE}.total_acquisition_process_start)/SUM(${TABLE}.vpn_site_hits) *100 AS Float64),1)
            END;;
  }
  measure:CVR_from_product_page_visit_to_payment_complete {
    type: number
    sql:CASE WHEN SUM(${TABLE}.vpn_site_hits) = 0 then 0
            ELSE round(cast(SUM(${TABLE}.total_payment_setup_complete)/SUM(${TABLE}.vpn_site_hits) *100 AS Float64),1)
            END;;
  }
  measure: CVR_from_payment_page_visit_to_payment_complete {
    type: number
    sql:CASE WHEN SUM(${TABLE}.total_acquisition_process_start)= 0 then 0
      ELSE round(cast(SUM(${TABLE}.total_payment_setup_complete)/SUM(${TABLE}.total_acquisition_process_start) *100 AS Float64),1)
      END;;
  }
  #FxA signed in
  measure: signed_in_fxa_users_step1_payment_setup_view {
    sql: ${TABLE}.existing_fxa_signedin_payment_setup_view ;;
    type: sum
  }
  dimension: existing_fxa_signedin_payment_setup_view{
    hidden: yes
  }
  measure: signed_in_fxa_users_step2_payment_setup_engage {
    sql: ${TABLE}.existing_fxa_signedin_payment_setup_engage ;;
    type: sum
  }
  dimension: existing_fxa_signedin_payment_setup_engage{
    hidden: yes
  }
  measure: signed_in_fxa_users_step3_payment_setup_complete {
    sql: ${TABLE}.existing_fxa_signedin_payment_setup_complete ;;
    type: sum
  }
  dimension: existing_fxa_signedin_payment_setup_complete {
    hidden: yes
  }

  measure: signed_in_fxa_CVR {
    type: number
    sql:CASE WHEN SUM(${TABLE}.existing_fxa_signedin_payment_setup_view) = 0 then 0
      ELSE round(cast(SUM(${TABLE}.existing_fxa_signedin_payment_setup_complete)/SUM(${TABLE}.existing_fxa_signedin_payment_setup_view) *100 AS Float64),1)
      END;;
  }

  # FxA signed off
  measure: signed_out_fxa_users_step1_sign_in_CTA_click {
    sql: ${TABLE}.existing_fxa_signedoff_signin_cta_click ;;
    type: sum
  }
  dimension: existing_fxa_signedoff_signin_cta_click {
    hidden: yes
  }
  measure: signed_out_fxa_users_step2_payment_setup_view {
    sql: ${TABLE}.existing_signedoff_fxa_payment_setup_view ;;
    type: sum
  }
  dimension: existing_signedoff_fxa_payment_setup_view {
    hidden: yes
  }
  measure: signed_out_fxa_users_step3_payment_setup_engage {
    sql: ${TABLE}.existing_fxa_signedoff_payment_setup_engage ;;
    type: sum
  }
  dimension: existing_fxa_signedoff_payment_setup_engage {
    hidden: yes
  }
  measure: signed_out_fxa_users_step4_payment_setup_complete {
    sql: ${TABLE}.existing_fxa_signedoff_payment_setup_complete ;;
    type: sum
  }
  dimension: existing_fxa_signedoff_payment_setup_complete {
   hidden: yes
  }
  measure: signed_out_fxa_CVR {
    type: number
    sql:CASE WHEN SUM(${TABLE}.existing_fxa_signedoff_signin_cta_click) = 0 then 0
        ELSE round(cast(SUM(${TABLE}.existing_fxa_signedoff_payment_setup_complete)/SUM(${TABLE}.existing_fxa_signedoff_signin_cta_click) *100 AS Float64),1)
        END;;
  }
#new fxa users
  measure: new_fxa_users_step1_input_emails {
    sql: ${TABLE}.new_fxa_user_input_emails ;;
    type: sum
  }
  dimension: new_fxa_user_input_emails {
    hidden: yes
  }
  measure: new_fxa_users_step2_payment_setup_engage {
    sql: ${TABLE}.new_fxa_payment_setup_engage ;;
    type: sum
  }
  dimension: new_fxa_payment_setup_engage {
    hidden: yes
  }
  measure: new_fxa_users_step3_payment_setup_complete {
    sql: ${TABLE}.new_fxa_payment_setup_complete ;;
    type: sum
  }
  dimension: new_fxa_payment_setup_complete {
    hidden: yes
  }
  measure: new_fxa_CVR {
    type: number
    sql: CASE WHEN SUM(${TABLE}.new_fxa_user_input_emails) = 0 then 0
            ELSE round(cast(SUM(${TABLE}.new_fxa_payment_setup_complete)/SUM(${TABLE}.new_fxa_user_input_emails) *100 AS Float64),1)
            END;;
  }
  #Coupon activities
  dimension: coupon_code {
    sql: ${TABLE}.promotion_code ;;
    type: string
  }

  measure: discount_coupon_submit {

    sql: ${TABLE}.subscribe_coupon_submit ;;
    type: sum
  }

  measure: discount_coupon_fail {

    sql: ${TABLE}.subscribe_coupon_fail ;;
    type: sum
  }

  measure: discount_coupon_success {

    sql: ${TABLE}.subscribe_coupon_success ;;
    type: sum
  }
  dimension: subscribe_coupon_fail {
    hidden: yes
  }

  dimension: subscribe_coupon_submit {
     hidden: yes
  }

  dimension: subscribe_coupon_success {
     hidden: yes
  }

  # overall_... are total counts of the cateogry per day
  dimension: overall_existing_fxa_signedin_payment_setup_complete {
    hidden: yes
  }

  dimension: overall_existing_fxa_signedin_payment_setup_view {
    hidden: yes
  }

  dimension: overall_existing_fxa_signedoff_payment_setup_complete {
    hidden: yes
  }

  dimension: overall_existing_fxa_signedoff_signin_cta_click {
    hidden:  yes
  }

  dimension: overall_existing_signedoff_fxa_payment_setup_view {
    hidden: yes
  }

  dimension: overall_new_fxa_payment_setup_complete {
    hidden: yes
  }

  dimension: overall_new_fxa_user_input_emails {
    hidden: yes
  }

  dimension: overall_total_acquisition_process_start {
    hidden: yes
  }

  dimension: overall_total_payment_setup_complete {
    hidden: yes
  }

  dimension: overall_total_vpn_site_hits {
    hidden:  yes
  }
#For all existing FxA users; both signed in/ signed off before entering the funnel
  # measure: all_existing_fxa_users_step1_payment_setup_view {
  #   sql: ${TABLE}.existing_fxa_payment_setup_view ;;
  #   type: sum
  # }
  dimension: existing_fxa_step2_payment_setup_view {
    hidden: yes
  }
  # measure: all_existing_fxa_users_step2_payment_setup_engage {
  #   sql: ${TABLE}.existing_fxa_payment_setup_engage ;;
  #   type:sum
  # }
  dimension: existing_fxa_payment_setup_engage{
    hidden: yes
  }
  # measure: all_existing_fxa_users_step3_payment_setup_complete {
  #   sql: ${TABLE}.existing_fxa_payment_setup_complete ;;
  #   type: sum
  # }
  dimension: existing_fxa_payment_setup_complete {
    hidden: yes
  }


}
