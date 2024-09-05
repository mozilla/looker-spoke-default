view: mlops_rayserve_fakespot_cost {
  derived_table: {
    sql: SELECT
        *
      FROM `moz-fx-data-shared-prod.monitoring_derived.rayserve_cost_fakespot_tenant_v1`
      ;;
  }

  dimension: invoice_day {
    description: "The day when this workload ran"
    type: date_time
    sql: ${TABLE}.invoice_day ;;
  }

  dimension: daily_cost_per_kuberay_workload {
    description: "How much this kuberay workload cost in USD"
    type: number
    sql: ${TABLE}.daily_cost_per_kuberay_workload ;;
  }

}
