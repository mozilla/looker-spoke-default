connection: "telemetry"
label: "Firefox Klar for iOS"
include: "//looker-hub/klar_ios/explores/*"
include: "//looker-hub/klar_ios/views/*"
# include: "views/*"
# include: "explores/*"
# include: "dashboards/*"

view: +metrics {
  dimension: metrics__labeled_counter__browser_search_in_content {
    label: "Browser Search In Content"
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.browser_search_in_content ;;
    group_label: "Browser Search"
    group_item_label: "In Content"
  }
}
