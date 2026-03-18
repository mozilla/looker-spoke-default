include: "../views/tasks.view.lkml"
include: "../views/task_runs.view.lkml"
include: "../views/task_run_costs.view.lkml"
include: "../views/workers.view.lkml"

explore:  tasks {
  label: "Firefox-CI Tasks"
  description: "Task metadata for the Firefox-CI Taskcluster instance."
  view_name: task_runs

  join: tasks {
    type: inner
    relationship: many_to_one
    sql_on: ${task_runs.task_id} = ${tasks.task_id};;
  }

  join: task_run_costs {
    type: left_outer
    relationship: one_to_one
    sql_on: ${task_runs.key} = ${task_run_costs.key};;
  }

  join: workers {
    type: left_outer
    relationship: many_to_one
    sql_on:  ${task_runs.worker_group} = ${workers.zone} AND ${task_runs.worker_id} = ${workers.instance_id};;
  }
}
