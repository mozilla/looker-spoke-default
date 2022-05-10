include: "//looker-hub/firefox_accounts/views/fxa_users_services_daily_table.view.lkml"
# Used to identify the number of serviced disting users use on a specific day
# Helps with segmenting single service users vs multiple service users

view: +fxa_users_services_daily_table{
  measure: services_per_user {
    description: "Distinct count of service per user"
    type: count_distinct
    sql: ${service} ;;
    }
}
