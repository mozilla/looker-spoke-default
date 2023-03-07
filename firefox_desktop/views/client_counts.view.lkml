include: "//looker-hub/firefox_desktop/views/client_counts.view"

view: +client_counts {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${TABLE}.client_id, ${TABLE}.submission_date) ;;
    }
}
