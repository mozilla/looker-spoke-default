include: "../views/firefox_ios_feature_usage_events.view.lkml"
include: "../views/firefox_ios_dau.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/feature_usage_events_last_updated.datagroup.lkml"

explore: firefox_ios_feature_usage_events {

  sql_always_where: ${firefox_ios_dau.submission_date} >= '2022-01-01'
    AND ${firefox_ios_feature_usage_events.ping_date} >= '2022-01-01'
    ;;



  join: firefox_ios_dau {
    type: inner
    relationship: one_to_one
    sql_on: ${firefox_ios_feature_usage_events.ping_date} = ${firefox_ios_dau.submission_date};;
  }

  persist_with: feature_usage_events_last_updated
}
