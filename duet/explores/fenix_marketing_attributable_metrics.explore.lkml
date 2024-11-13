include: "../views/fenix_marketing_attributable_metrics.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: fenix_marketing_metrics {
  label: "Marketing Metrics for Android"
  description: "Android metrics segmented by Marketing campaign attribution."
  view_name: fenix_marketing_metrics

  always_filter: {
    filters: [fenix_marketing_metrics.submission_date: "2 months",
      fenix_marketing_metrics.cohort_date: "2 months",]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${fenix_marketing_metrics.country} = ${countries.code} ;;
  }
}
