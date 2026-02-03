include: "../views/baseline_active_users_agg_with_tou.view.lkml"
include: "//looker-hub/firefox_desktop/views/terms_of_use_status_table.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/baseline_active_users_table_last_updated.datagroup.lkml"

explore: tou_complaince_dmwau_v2 {
  label: "ToU Compliance DMWAU for Firefox Desktop V2"
  view_name: baseline_active_users_agg_with_tou

}
