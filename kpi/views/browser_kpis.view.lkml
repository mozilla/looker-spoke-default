include: "./unified_metrics.view.lkml"

view: browser_kpis {
  extends: [unified_metrics]

  dimension: days_since_first_seen {
    hidden: yes
  }

  dimension: first_seen {
    hidden: yes
  }

  dimension: uri_count {
    hidden: yes
  }

  measure: total_search_count {
    hidden: yes
  }

  measure: total_ad_click {
    hidden: yes
  }

  measure: total_organic_search_count {
    hidden: yes
  }

  measure: total_durations {
    hidden: yes
  }

  measure: total_active_hours_sum {
    hidden: yes
  }

  measure: user_count_qualified {
    type: sum
    sql: ${TABLE}.user_count ;;
    filters: [client_qualifies: "yes"]
    label: "User Count"
  }
}
