include: "//looker-hub/firefox_desktop/views/clients_last_seen_table.view.lkml"

view: browser_properties {
  extends: [clients_last_seen_table]

  parameter: diff_days {
    label: "Days from Event"
    description: "Number of days between an event date and observed client properties date. Allows to join client properties that were recorded N days from an event."
    type: number
    default_value: "0"
  }

  dimension: is_default_browser {
    hidden: yes
  }

  dimension: scalar_parent_os_environment_is_taskbar_pinned {
    type: yesno
    hidden: yes
  }

  measure: count_is_default_browser {
    type: count
    description: "Number of clients that have is_default_browser set to true."
    filters: [is_default_browser: "yes"]
  }

  measure: count_is_taskbar_pinned {
    type: count
    description: "Number of clients that have is_taskbar_pinned set to true"
    filters: [scalar_parent_os_environment_is_taskbar_pinned: "yes"]
  }

  measure: count_clients {
    type: count
  }

  measure: fraction_is_default_browser {
    sql: SAFE_DIVIDE(${count_is_default_browser}, ${count_clients}) ;;
    type: number
    description: "Fraction of clients that have is_default_browser set to true."
  }

  measure: fraction_is_taskbar_pinned {
    sql: SAFE_DIVIDE(${count_is_taskbar_pinned}, ${count_clients}) ;;
    type: number
    description: "Fraction of clients that have is_taskbar_pinned set to true"
  }
}
