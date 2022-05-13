include: "../views/unified_metrics_pop_method1.view.lkml"

explore: unified_metrics_pop_method1 {
  sql_always_where: ${unified_metrics.first_seen_date} >= '2020-01-01' ;;
  view_name: unified_metrics
  description: "Daily search aggregates for desktop clients."

  always_filter: {
    filters: [
      first_seen_date: "2 years",
    ]
  }
}
