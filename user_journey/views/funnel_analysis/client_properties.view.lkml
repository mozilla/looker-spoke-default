include: "//looker-hub/firefox_desktop/views/clients_last_seen.view.lkml"

view: client_properties {
  extends: [clients_last_seen]

  parameter: diff_days {
    label: "Days from Event"
    description: "Number of days between an event date and observed client properties date. Allows to join client properties that were recorded N days from an event."
    type: number
    default_value: "0"
  }

  measure: count_is_default_browser {
    type: count
    description: "Number of clients that have is_default_browser set to true."
    filters: [is_default_browser: "yes"]
  }

  measure: count_clients {
    type: count
  }

  measure: fraction_is_default_browser {
    sql: SAFE_DIVIDE(${count_is_default_browser}, ${count_clients}) ;;
    type: number
    description: "Fraction of clients that have is_default_browser set to true."
  }
}
