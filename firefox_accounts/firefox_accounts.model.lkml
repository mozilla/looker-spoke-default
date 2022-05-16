connection: "telemetry"
label: "Firefox Accounts"
include: "//looker-hub/firefox_accounts/views/fxa_first_seen_table.view.lkml"
include: "//looker-hub/firefox_accounts/views/fxa_users_services_daily_table.view.lkml"
include: "//looker-hub/firefox_accounts/explores/*"
include: "./views/*.view.lkml"
include: "views/*"

explore: +growth_accounting {
  description: "Weekly growth numbers for Firefox Accounts."
  join: fxa_first_seen_table {
    fields: []
    relationship: many_to_one
    sql_on: ${growth_accounting.user_id} = ${fxa_first_seen_table.user_id} ;;
  }
  always_filter: {
    filters: [growth_accounting.submission_date: "14 days"]
  }
}

explore: +event_counts {
  always_filter: {
    filters: [events.submission_date: "14 days"]
  }
  sql_always_where: timestamp > "2010-01-01" ;;
}

explore: daily_service_users {
  label: "Daily Services Users"
  description: "Number of Firefox Accounts authenticating with FxA services according to the FxA server table:`moz-fx-data-shared-prod.firefox_accounts.fxa_users_services_daily`."
  always_filter: {
    filters: [daily_service_users.submission_date: "14 days"]
    }
  fields: [ALL_FIELDS*, -daily_service_users.user_id]
}
