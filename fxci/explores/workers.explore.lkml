include: "//looker-hub/fxci/views/worker_costs.view.lkml"
include: "//looker-hub/fxci/views/worker_metrics.view.lkml"

explore:  workers {
  label: "Firefox-CI Workers"
  description: "Worker metadata for the Firefox-CI Taskcluster instance."
  view_name: worker_costs
  join: worker_metrics {
    type: inner
    relationship: many_to_many
    sql_on: ${worker_costs.project} = ${worker_metrics.project} AND ${worker_costs.zone} = ${worker_metrics.zone} AND ${worker_costs.instance_id} = ${worker_metrics.instance_id};;
  }
}
