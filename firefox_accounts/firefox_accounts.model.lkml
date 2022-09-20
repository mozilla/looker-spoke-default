connection: "telemetry"
label: "Firefox Accounts"
include: "//looker-hub/firefox_accounts/views/fxa_first_seen_table.view.lkml"
include: "//looker-hub/firefox_accounts/explores/*"
include: "views/*.view.lkml"
include: "explores/*.explore.lkml"

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
