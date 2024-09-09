include: "//looker-hub/fxci/views/tasks.view.lkml"
include: "//looker-hub/fxci/views/task_runs.view.lkml"
include: "//looker-hub/fxci/views/task_run_costs.view.lkml"

explore:  task_joins {
  label: "Firefox-CI Tasks"
  description: "Task metadata for the Firefox-CI Taskcluster instance."
  view_name: task_runs
  join: tasks {
    type: inner
    relationship: many_to_one
    sql_on: ${tasks.task_id} = ${task_runs.task_id};;
  }
  join: task_run_costs {
    type: inner
    relationship: one_to_one
    sql_on: ${task_runs.task_id} = ${task_run_costs.task_id} AND ${task_runs.run_id} = ${task_run_costs.run_id} ;;
  }
}
