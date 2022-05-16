include: "//looker-hub/firefox_accounts/views/fxa_users_services_daily_table.view.lkml"

view: daily_service_users {
  extends: [fxa_users_services_daily_table]
  measure: total_user_count {
    sql: ${user_id} ;;
    type: count_distinct
}

  measure: desktop_only_users {
    sql: ${user_id} ;;
    type: count_distinct
    filters: [daily_service_users.service: "firefox-desktop"]
  }

  measure: fenix_only_users {
    sql: ${user_id} ;;
    type: count_distinct
    filters: [daily_service_users.service: "fenix"]
  }

  measure: fx_ios_only_users {
    sql: ${user_id} ;;
    type: count_distinct
    filters: [daily_service_users.service: "firefox-ios"]
  }

  measure: desktop_and_mobile_users {
    sql: ${user_id} ;;
    type: count_distinct
    filters: [daily_service_users.service: "firefox-desktop, fenix, firefox-ios"]
  }

  measure: sync_users {
    sql: ${user_id} ;;
    type: count_distinct
    filters: [daily_service_users.service: "sync"]
  }
}
