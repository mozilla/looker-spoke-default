include: "../views/tasks.view.lkml"
include: "../views/task_runs.view.lkml"
include: "../views/task_run_costs.view.lkml"

explore:  fxci_tasks {
  label: "Firefox-CI Tasks"
  description: "Task metadata for the Firefox-CI Taskcluster instance."
  view_name: task_runs
  join: tasks {
    type: inner
    relationship: many_to_one
    sql_on: ${task_runs.task_id} = ${tasks.task_id};;
  }
  join: tasks__tags {
    relationship: many_to_many
    sql: LEFT JOIN UNNEST(${tasks.tags}) AS tasks__tags ;;
  }
  join: task_run_costs {
    type: inner
    relationship: one_to_one
    sql_on: ${task_runs.key} = ${task_run_costs.key};;
  }
}
