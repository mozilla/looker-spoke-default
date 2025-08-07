include: "//looker-hub/relay_backend/views/events_stream_table.view.lkml"

  view: events_stream_with_extras {
    extends: [events_stream_table]

    dimension: event_id {
      sql: CONCAT(${TABLE}.document_id, '-',"somestring";;
      type:  string
    }

    dimension: extra_is_reply {
      sql: LAX_STRING(${TABLE}.event_extra.is_reply) ;;
      type:  string
      group_label: "Event extra"
    }

    dimension: extra_premium_status{
        sql: LAX_STRING(${TABLE}.event_extra.premium_status) ;;
        type:  string
        group_label: "Event extra"
      }

    measure: event_count {
      type: count
      description: "The number of times the event(s) occurred."
    }

}
