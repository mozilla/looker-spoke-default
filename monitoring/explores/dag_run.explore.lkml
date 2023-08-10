include: "//looker-hub/monitoring/views/dag_tag.view.lkml"
include: "../views/airflow_dag_run.view.lkml"
include: "../views/airflow_task_fail.view.lkml"
include: "../views/airflow_dag_tag.view.lkml"
include: "../views/airflow_dag.view.lkml"

explore: dag_run{
  hidden: yes
}

explore: task_fail {
  hidden: yes
}
explore: dag_tag {
  hidden: yes
}
explore: dag_tag_2 {
  hidden: yes
}

explore: airflow_dag_tag {
  hidden: yes
}

explore: dag {
  hidden: yes
}

explore: dag_owner {}
