include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates.view.lkml"

view: fenix_dau {
  derived_table: {
    sql:
      SELECT
        submission_date,
        SUM(dau) AS dau
      FROM `moz-fx-data-shared-prod.telemetry.active_users_aggregates`
      WHERE app_name = 'Fenix'
      GROUP BY 1 ;;
  }

  dimension_group: submission {
    type: time
    timeframes: [date]
    sql: ${TABLE}.submission_date ;;
    datatype: date
  }

  measure: sum_dau {
    label: "Fenix DAU"
    type: sum
    sql: ${TABLE}.dau ;;
  }
}
