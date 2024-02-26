include: "../views/mozilla_accounts_multi_device_dau.view.lkml"

explore: mozilla_accounts_multi_device_dau {
  label: "Multi-Device Mozilla Accounts DAU"

  conditionally_filter: {
    filters: [date_date: "30 days ago for 30 days"]
    unless: [date_week, date_month, date_quarter, date_year]
  }

}
