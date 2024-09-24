include: "//looker-hub/fxci/views/tasks.view.lkml"
include: "//looker-hub/fxci/views/task_runs.view.lkml"
include: "../views/task_run_costs.view.lkml"
include: "../views/task_tags.view.lkml"

explore:  tasks {
  label: "Firefox-CI Tasks"
  description: "Task metadata for the Firefox-CI Taskcluster instance."
  view_name: task_runs
  join: tasks {
    type: inner
    relationship: many_to_one
    sql_on: ${task_runs.task_id} = ${tasks.task_id};;
  }
  join: task_tags {
    relationship: many_to_many
    sql_on: ${task_runs.task_id} = ${task_tags.task_id} ;;
  }
  join: task_run_costs {
    type: inner
    relationship: one_to_one
    sql_on: ${task_runs.task_id} = ${task_run_costs.task_id} AND ${task_runs.run_id} = ${task_run_costs.run_id} ;;
  }
  always_filter: {
    filters: [
      task_runs.submission_date: "28 days",
      task_run_costs.submission_date: "28 days",
      tasks.submission_date: "28 days"    ]
  }
}
