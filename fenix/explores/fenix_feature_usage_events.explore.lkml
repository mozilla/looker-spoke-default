include: "../views/fenix_feature_usage_events.view.lkml"
include: "../views/fenix_dau.view.lkml"
include: "//looker-hub/fenix/datagroups/feature_usage_events_last_updated.datagroup.lkml"

explore: fenix_feature_usage_events {

  sql_always_where: ${fenix_dau.submission_date} >= '2022-01-01'
      AND ${fenix_feature_usage_events.submission_date} >= '2022-01-01'
      ;;

  join: fenix_dau {
    type: inner
    relationship: one_to_one
    sql_on: ${fenix_feature_usage_events.ping_date} = ${fenix_dau.submission_date} ;;
  }

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  persist_with: feature_usage_events_last_updated
}
