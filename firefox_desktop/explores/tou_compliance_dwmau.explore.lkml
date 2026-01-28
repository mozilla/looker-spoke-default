include: "../views/baseline_active_users_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/terms_of_use_status_table.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/baseline_active_users_table_last_updated.datagroup.lkml"

explore: tou_complaince_dmwau {
  label: "ToU Compliance DMWAU for Firefox Desktop"
  view_name: baseline_active_users_table
  join: terms_of_use_status_table {
    type: left_outer
    sql_on: ${baseline_active_users_table.client_id} = ${terms_of_use_status_table.client_id}
      AND ${baseline_active_users_table.submission_date} >= ${terms_of_use_status_table.submission_date};;
    relationship: many_to_one
  }

  sql_always_where: ${baseline_active_users_table.is_desktop} AND ${baseline_active_users_table.sample_id} <= 19;;

  persist_with: baseline_active_users_table_last_updated
}
