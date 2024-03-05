include: "../views/fxa_multi_service_dau.view.lkml"

explore: fxa_multi_service_dau {
  label: "Multi-Service Active FxA"

  conditionally_filter: {
    filters: [date_date: "30 days ago for 30 days"]
    unless: [date_week, date_month, date_quarter, date_year]
  }

}
