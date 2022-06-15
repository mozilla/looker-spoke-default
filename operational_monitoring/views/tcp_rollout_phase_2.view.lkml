include: "//looker-hub/operational_monitoring/views/tcp_rollout_phase_2_scalar.view.lkml"
include: "//looker-hub/operational_monitoring/views/tcp_rollout_phase_2_histogram.view.lkml"


view: +tcp_rollout_phase_2_scalar {
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

view: +tcp_rollout_phase_2_histogram {
  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
    map_layer_name: countries
  }

  dimension: os {
    sql: ${TABLE}.os ;;
    type: string
  }
}
