include: "//looker-hub/firefox_desktop/views/*.view.lkml"

view: event_types_legacy {
  extends: [event_types]

  dimension: name {
    type: string
    sql: CONCAT(${TABLE}.category, " - ", ${TABLE}.event) ;;
  }
}
