include: "../views/fenix_feature_usage_events_dims.view.lkml"

explore: fenix_feature_usage_events_dims {
  sql_always_where: ${fenix_feature_usage_events_dims.submission_date} >= '2021-01-01' ;;
  view_name: fenix_feature_usage_events_dims

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }
}
