include: "../views/firefox_ios_feature_usage_metrics_not_added.view.lkml"
include: "../views/firefox_ios_dau.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/metrics_last_updated.datagroup.lkml"

explore: firefox_ios_feature_usage_metrics_not_added {
  sql_always_where: ${firefox_ios_dau.submission_date} >= '2023-06-01'
    AND ${firefox_ios_feature_usage_metrics_not_added.submission_date} >= '2023-06-01'
    ;;

  always_filter: {
    filters: [
      firefox_ios_dau.submission_date: "28 days ago for 27 days",
      firefox_ios_feature_usage_metrics_not_added.submission_date: "28 days ago for 27 days",
    ]
  }

  join: firefox_ios_dau {
    type: left_outer
    relationship: one_to_one
    sql_on: ${firefox_ios_feature_usage_metrics_not_added.submission_date} = ${firefox_ios_dau.submission_date} ;;
  }

  persist_with: metrics_last_updated
}
