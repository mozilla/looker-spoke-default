include: "//looker-hub/monitoring/views/dag.view.lkml"

view: +dag {
  measure: count {
    type: count_distinct
    sql: ${root_dag_id} ;;
  }
}

view: dag_owner {
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
  dimension: owner {

  }
  measure: count {
    type: count_distinct
    sql: ${root_dag_id} ;;
  }
}
