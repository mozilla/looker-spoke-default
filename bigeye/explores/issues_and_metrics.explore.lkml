include: "../views/issues.view.lkml"
include: "../views/metrics.view.lkml"

explore: issues_and_metrics {
  view_name: issues

  join: metrics {
    type: left_outer
    relationship: one_to_one
    sql_on: ${issues.metric_configuration_id} = ${metrics.metric_configuration_id} ;;
  }

}
