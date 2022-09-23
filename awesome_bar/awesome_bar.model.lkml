connection: "telemetry"
label: "Awesome Bar"
include: "views/*"
include: "//looker-hub/awesome_bar/explores/*"

view: +urlbar_clients_daily {
  dimension: count_picked_total {
    hidden: yes
  }

  measure: total_count_picked {
    sql: ${TABLE}.count_picked_total ;;
    type: sum
  }
}

view: +urlbar_clients_daily__count_picked_by_position {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql: ${TABLE}.value ;;
    type: sum
  }
}

view: +urlbar_clients_daily__count_picked_by_type {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql: ${TABLE}.value ;;
    type: sum
  }
}

view: +urlbar_clients_daily__urlbar_picked_by_type_by_position__position {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql: ${TABLE}.value ;;
    type: sum
  }
}
