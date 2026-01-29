include: "../views/active_users_table.view.lkml"
include: "//looker-hub/firefox_ios/views/terms_of_use_status_table.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/active_users_table_last_updated.datagroup.lkml"

explore: tou_complaince_dmwau {
  label: "ToU Compliance DMWAU for Firefox iOS"
  view_name: active_users_table
  join: terms_of_use_status_table {
    type: left_outer
    sql_on: ${active_users_table.client_id} = ${terms_of_use_status_table.client_id}
      AND ${active_users_table.submission_date} >= ${terms_of_use_status_table.submission_date};;
    relationship: many_to_one
  }

  sql_always_where: ${active_users_table.is_mobile};;

  persist_with: active_users_table_last_updated
}
