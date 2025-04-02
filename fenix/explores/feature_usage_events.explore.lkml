include: "//looker-hub/fenix/explores/feature_usage_events.explore.lkml"
include: "../views/feature_usage_events.view.lkml"
include: "//looker-hub/fenix/datagroups/feature_usage_events_last_updated.datagroup.lkml"

explore: +feature_usage_events {
  from: feature_usage_events
  final: yes

  sql_always_where: ${submission_date} >= '2022-01-01' ;;

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  persist_with: feature_usage_events_last_updated
}
