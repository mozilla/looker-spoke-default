include: "//looker-hub/monitoring/views/airflow_dag.view.lkml"

view: +airflow_dag {

  dimension: dag_id {
    type: string
    link: {
      label: "go to (sub-)DAG"
      url: "https://workflow.telemetry.mozilla.org/dags/{{ dag_id }}/grid"
    }
    primary_key: yes
  }

  dimension: description {
    hidden: yes # as long as this field is always empty there is no reason to show it
  }

}

view: airflow_dag_owner {

  derived_table: {
    sql:
      select
        root_dag_id,
        owner
      from `mozdata.monitoring.airflow_dag`, unnest(split(owners, ", ")) as owner
    ;;
  }

  dimension: root_dag_id {
    hidden: yes
  }

  dimension: owner {}

  measure: count {
    type: count_distinct
    sql: ${root_dag_id} ;;
  }
}
