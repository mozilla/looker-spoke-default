view: mlops_flow_run_cost {
  derived_table: {
    sql: SELECT
        *
      FROM `moz-fx-data-shared-prod.monitoring_derived.outerbounds_cost_per_flow_run_v1`
      ORDER BY invoice_day DESC
      ;;
  }

  dimension: run_id {
    description: "The ID for the run"
    type: string
    sql: ${TABLE}.run_id ;;
  }

  dimension: flow_name {
    description: "Which flow was run in this job"
    type: string
    sql: ${TABLE}.flow_name ;;
  }

  dimension: invoice_day {
    description: "Day this job was invoiced"
    type: date_time
    sql: ${TABLE}.invoice_day ;;
  }

  dimension: cost_usd {
    description: "How much the job cost in USD"
    type: number
    sql: ${TABLE}.cost_usd ;;
  }

}
