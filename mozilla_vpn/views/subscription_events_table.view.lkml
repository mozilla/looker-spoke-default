include: "//looker-hub/mozilla_vpn/views/subscription_events_table.view"

view: +subscription_events_table {
  dimension: count {
    hidden: yes
  }
  measure: delta {
    type: sum
    sql: IF(${event_type} = "New", ${count}, -${count});;
  }
}
