include: "//looker-hub/firefox_desktop/explores/messaging_system.explore"
include: "../views/messaging_system.view"

explore: +messaging_system {
  join: messaging_system__ping_info__experiments {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${messaging_system.ping_info__experiments}) AS messaging_system__ping_info__experiments;;
  }
}
