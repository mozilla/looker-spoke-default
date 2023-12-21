include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates.view.lkml"

view: firefox_ios_dau {
  dimension: submission_date {
    sql: ${TABLE}.submission_date ;;
    type: date
  }

  measure: sum_dau {
    label: "Firefox iOS DAU"
    type: sum
    sql: CASE WHEN ${TABLE}.app_name = 'Firefox iOS' THEN ${TABLE}.dau ELSE 0 END ;;
  }
}
