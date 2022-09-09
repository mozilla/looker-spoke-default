include: "//looker-hub/firefox_desktop/views/client_counts.view"
view: +client_counts {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${TABLE}.client_id, ${TABLE}.submission_date) ;;
    }

}

view: +clients_daily_table__scalar_parent_urlbar_picked_autofill_adaptive_sum {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${client_counts.client_id}, ${client_counts.submission_date}) ;;
  }

}
