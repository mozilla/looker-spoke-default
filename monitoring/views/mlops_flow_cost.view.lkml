view: mlops_flow_cost {
  derived_table: {
    sql: SELECT
        *
      FROM `moz-fx-data-shared-prod.monitoring_derived.outerbounds_cost_per_flow_v1`
      ;;
  }

  dimension: flow_name {
    description: "The flow being run"
    type: string
    sql: ${TABLE}.flow_name ;;
  }

  dimension: num_runs {
    description: "The number of times this flow has run"
    type: number
    sql: ${TABLE}.num_runs ;;
  }

  dimension: total_cost_usd {
    description: "How much this flow has cost in USD over its runs"
    type: number
    sql: ${TABLE}.total_cost_usd ;;
  }

  dimension: flow_description {
    description: "The high-level summary of the Flow"
    type: string
    sql: ${TABLE}.flow_description ;;
  }

}
