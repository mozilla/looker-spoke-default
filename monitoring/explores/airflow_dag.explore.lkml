include: "../views/airflow_dag.view.lkml"
include: "../views/airflow_dag_run.view.lkml"
include: "../views/airflow_dag_tag.view.lkml"
include: "../views/airflow_task_fail.view.lkml"

explore: airflow_dag {

  join: airflow_dag_owner {
    type: inner
    sql_on: ${airflow_dag.root_dag_id} = ${airflow_dag_owner.root_dag_id} ;;
    relationship: one_to_many
  }

  join: airflow_dag_tag {
    type: inner
    sql_on: ${airflow_dag.dag_id} = ${airflow_dag_tag.dag_id} ;;
    relationship: one_to_many
  }

  join: airflow_dag_run {
    type: left_outer
    sql_on: ${airflow_dag.dag_id} = ${airflow_dag_run.dag_id} ;;
    relationship: one_to_many
  }

  join: airflow_task_fail {
    type: left_outer
    sql_on:
      ${airflow_dag.dag_id} = ${airflow_task_fail.dag_id}
      {% if airflow_dag_run._in_query -%}
      AND ${airflow_dag_run.start_date} = ${airflow_task_fail.start_date}
      {%- endif -%}
    ;;
    relationship: one_to_many
  }

}
