include: "../views/mozilla_accounts_multi_service_dau.view.lkml"

explore: mozilla_accounts_multi_service_dau {
  label: "Multi-Service Active Mozilla Accounts"

  conditionally_filter: {
    filters: [date_date: "30 days ago for 30 days"]
    unless: [date_week, date_month, date_quarter, date_year]
  }

  join: service_names {
    from: mozilla_accounts_multi_service_dau__service_names
    sql_table_name: UNNEST(mozilla_accounts_multi_service_dau.service_names) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }
}
