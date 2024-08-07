include: "../views/mozilla_accounts_users_services_daily.view.lkml"

explore: mozilla_accounts_users_services_daily {
  label: "Mozilla Accounts Users/Services Daily"

  conditionally_filter: {
    filters: [date_date: "30 days ago for 30 days"]
    unless: [date_week, date_month, date_quarter, date_year]
  }

}
