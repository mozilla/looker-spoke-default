include: "//looker-hub/debug_ping_view/views/events_stream_table.view.lkml"
view: +events_stream_table {

  dimension: session_id {
    sql: ${TABLE}.client_info.session_id ;;
    type: string
  }

  measure: client_count {
    type: count_distinct
    sql: ${client_id} ;;
  }

  measure: session_count {
    type: count_distinct
    sql: ${session_id} ;;
  }
}
  
