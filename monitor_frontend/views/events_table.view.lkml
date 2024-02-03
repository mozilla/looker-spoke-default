include: "//looker-hub/monitor_frontend/views/events.view.lkml"

view: +events {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: user_id {
    description: "Unique ID for each user that has ordered"
    hidden: yes
    type: number
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'user_id') ;;
  }

  dimension: path {
    description: "The URL or path of the page"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'path') ;;
    label: "Page Path"
  }

  dimension: utm_campaign {
    description: "Marketing and attribution UTM campaign"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'utm_campaign') ;;
    label: "UTM Campaign"
  }

  dimension: utm_medium {
    description: "Marketing and attribution UTM medium"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'utm_medium') ;;
    label: " UTM Medium"
  }

  dimension: utm_source {
    description: "Marketing and attribution UTM source"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'utm_source') ;;
    label: "UTM Source"
  }

  dimension: utm_term {
    description: "Marketing and attribution UTM term"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'utm_term') ;;
    label: "UTM Term"
  }

  dimension: field_id {
    description: "The location of an input field that determines where on the web page the interaction is occurring"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'field_id') ;;
    label: "Field ID"
  }

  dimension: button_id {
    description: "The text of the button that was clicked on, used as a way to identify where on the page the interaction is located"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'button_id') ;;
    label: "Button ID"
  }

  dimension: popup_id {
    description: ""
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'popup_id') ;;
    label: "Popup ID"
  }

  dimension: link_id {
    description: ""
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'link_id') ;;
    label: "Link ID"
  }

  dimension: dashboard_tab {
    description: "Either action_needed or fixed, depending on where in the dashboard the event is recorded."
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'dashboard_tab') ;;
    label: "Dashboard Tab"
  }

  dimension: legacy_user {
    description: "A flag indicating whether the user logged into their dashboard previous to the Monitor premium launch."
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'legacy_user') ;;
    label: "Legacy User"
  }

  dimension: breach_count {
    description: "A count of breaches displayed on the user’s dashboard"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'breach_count') ;;
    label: "Breach Count"
  }

  dimension: broker_count {
    description: "A count of data brokers displayed on the user's dashboard"
    type: string
    sql: `mozfun.map.get_key`(${TABLE}.event_extra, 'broker_count') ;;
    label: "Broker Count"
  }

  measure: user_count {
    description: "Use this for counting lifetime orders across many users"
    type: count_distinct
    sql: ${user_id} ;;
  }
}
