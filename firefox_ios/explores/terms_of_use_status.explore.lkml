include: "//looker-hub/firefox_ios/views/terms_of_use_status_table.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/terms_of_use_status_table_last_updated.datagroup.lkml"

explore: terms_of_use_status {
  view_name: terms_of_use_status_table

  persist_with: terms_of_use_status_table_last_updated
}
