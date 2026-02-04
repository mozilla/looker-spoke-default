include: "../views/active_users_aggs_with_tou.view.lkml"
include: "//looker-hub/firefox_ios/views/terms_of_use_status_table.view.lkml"

explore: tou_complaince_dmwau_v2 {
  label: "ToU Compliance DMWAU for Firefox iOS V2"
  view_name: active_users_agg_with_tou

}
