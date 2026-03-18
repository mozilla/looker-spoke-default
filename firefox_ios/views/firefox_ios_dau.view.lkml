include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates.view.lkml"

view: firefox_ios_dau {
  derived_table: {
    sql:
      SELECT
        submission_date,
        SUM(dau) AS dau
      FROM `moz-fx-data-shared-prod.firefox_ios.active_users_aggregates`
      WHERE app_name = 'Firefox iOS'
      GROUP BY submission_date ;;}

  dimension_group: submission {
    type: time
    timeframes: [date]
    sql: ${TABLE}.submission_date ;;
    datatype: date
  }

  measure: sum_dau {
    label: "Firefox iOS DAU"
    type: sum
    sql: ${TABLE}.dau ;;
  }
}
