include: "//looker-hub/mozilla_vpn/views/events.view.lkml"
view: +events {
  # Some events have more than one extra keys and these multiple values are essential to be combined together to monitor the events correctly.

  dimension: message_state {
    sql: mozfun.map.get_key(${event_extra},'message_state') ;;
    description: "message_state value in event_extra key = 'message_state' for event_name = 'addon_message_state_changed' "
    group_label: "Granular Event Category"
  }
  dimension: message_id {
    sql: mozfun.map.get_key(${event_extra},'message_id') ;;
    description: "message_state value (Addon identifier) in event_extra key = 'message_id' for event_name = 'addon_message_state_changed' "
    group_label: "Granular Event Category"
  }
  dimension: guide_and_tutorial_id {
    sql:  mozfun.map.get_key(${event_extra},'id');;
    description: "id describing tutorial/guide in the value of event_extra key = 'id' for guide and tutorial related event e.g. 'tutorial_opened/closed'"
    group_label: "Granular Event Category"
  }
}
