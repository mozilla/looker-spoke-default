include: "../views/active_users_aggs_with_tou.view.lkml"
include: "//looker-hub/fenix/views/terms_of_use_status_table.view.lkml"

explore: tou_complaince_dmwau {
  label: "ToU Compliance DMWAU for Firefox Android"
  view_name: active_users_agg_with_tou

}
