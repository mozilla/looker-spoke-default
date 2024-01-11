include: "../views/event_flow_monitoring_aggregates.view.lkml"

explore: event_flow_monitoring_aggregates {
  join: event_flow_monitoring_aggregates__events {
    view_label: "Event Flow Monitoring: Events"
    sql: LEFT JOIN UNNEST(${event_flow_monitoring_aggregates.events}) as event_flow_monitoring_aggregates__events ;;
    relationship: one_to_many
  }

  always_filter: {
    filters: [event_flow_matching_filter: "yes"]
  }
}
