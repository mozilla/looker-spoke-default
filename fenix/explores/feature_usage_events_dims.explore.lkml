include: "../views/feature_usage_events.view.lkml"

explore: feature_usage_events_dims {
  label: "Feature Usage Events by Dimensions"
  sql_always_where: ${feature_usage_events.submission_date} >= '2021-01-01' ;;
  view_name: feature_usage_events

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }
}
