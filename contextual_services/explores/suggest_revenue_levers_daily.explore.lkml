include: "/contextual_services/views/suggest_revenue_levers_daily.view.lkml"

explore: suggest_revenue_levers_daily {

  view_name: suggest_revenue_levers_daily
  view_label: "Suggest Revenue Levers Daily"
  description: "Firefox Suggest metrics used in MBR reporting and revenue forecasting."

  # always_filter: {
  #   filters: [
  #     revenue_data_admarketplace.date_date: "3 months"
  #   ]
  # }

}
