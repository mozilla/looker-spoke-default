include: "//looker-hub/mozilla_vpn/views/subscription_events_table.view"

view: +subscription_events_table {

  dimension: country_name {
    description: "Add placeholder string for null values.  This is to allow selection of Null values in country name checkbox filters in dashboards"
    sql: COALESCE(${TABLE}.country_name, 'Null') ;;
    type: string
  }

  dimension: count {
    hidden: yes
  }

  measure: delta {
    type: sum
    sql: IF(${event_type} = "New", ${count}, -${count});;
  }
}
