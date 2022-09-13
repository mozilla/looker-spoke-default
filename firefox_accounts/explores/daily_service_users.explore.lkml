include: "//looker-hub/firefox_accounts/views/fxa_users_services_first_seen_table.view.lkml"
include: "../views/daily_service_users.view.lkml"

explore: daily_service_users {
  label: "Daily Services Users"
  description: "Number of Firefox Accounts authenticating with FxA services according to the FxA server table:`moz-fx-data-shared-prod.firefox_accounts.fxa_users_services_daily`."
  fields: [ALL_FIELDS*, -fxa_users_services_first_seen_table.user_id, -fxa_users_services_first_seen_table.service]

  join: fxa_users_services_first_seen_table {
    relationship: many_to_one
    sql_on: ${daily_service_users.user_id} = ${fxa_users_services_first_seen_table.user_id} AND ${daily_service_users.service} = ${fxa_users_services_first_seen_table.service};;
  }

  always_filter: {
    filters: [daily_service_users.submission_date: "14 days"]
  }
}
