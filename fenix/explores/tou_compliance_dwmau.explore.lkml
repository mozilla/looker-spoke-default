include: "/combined_browser_metrics/views/active_users_aggregates_tou.view.lkml"

explore: tou_complaince_dmwau {
  label: "ToU Compliance DMWAU for Firefox Android"
  view_name: active_users_aggregates_tou


  sql_always_where: ${active_users_aggregates_tou.app_name} = "Fenix";;

}
