include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates_device.view.lkml"

view: +active_users_aggregates_device {

  dimension: app_name {
    label: "Browser Name"
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: app_version{
    label: "Browser Version"
    type: string
    sql: ${TABLE}.app_version ;;
  }}
