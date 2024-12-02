view: mlops_gpu_hours {
  derived_table: {
    sql: SELECT
        *
      FROM `moz-fx-data-shared-prod.monitoring_derived.outerbounds_gpu_hours_v1`
      ;;
  }

  dimension: event_date {
    description: "Date of GPU usage"
    type: string
    sql: ${TABLE}.event_date ;;
  }

  dimension: gpu_type {
    description: "Type of GPU like A100 or H100"
    type: string
    sql: ${TABLE}.gpu_type ;;
  }

  dimension: backend {
    description: "What cloud the GPU ran on"
    type: string
    sql: ${TABLE}.backend ;;
  }

  dimension: gpus {
    description: "Number of GPUs employed"
    type: string
    sql: ${TABLE}.gpus;;
  }

  dimension: gpu_hours {
    description: "Number of hours of GPU time used"
    type: number
    sql: ${TABLE}.gpu_hours ;;
  }

}
