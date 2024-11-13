include: "../views/country_level_yoy_metrics.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: country_level_yoy_metrics {
  label: "Country-Level Year-over-Year Browser Metrics"
  description: "Country-Level Year-over-Year Browser Metrics"
  view_name: country_level_yoy_metrics

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${country_level_yoy_metrics.country} = ${countries.code} ;;
  }
}
