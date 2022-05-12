include: "//looker-hub/operational_monitoring/views/tcp_rollout_scalar.view.lkml"


view: +tcp_rollout_scalar {
  measure: Total {
    type: number
    sql: SUM(${TABLE}.value) ;;
  }

  measure: Average {
    type: number
    sql: AVG(${TABLE}.value) ;;
  }

  dimension: submission_date {
    datatype: date
  }
}
