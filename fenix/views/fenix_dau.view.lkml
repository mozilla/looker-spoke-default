view: fenix_dau {
  derived_table: {
    sql:
      SELECT
        submission_date,
        SUM(dau) as dau,
      FROM `moz-fx-data-shared-prod.fenix.active_users_aggregates`
      WHERE submission_date >= "2022-01-01"
      AND app_name = 'Fenix'
      GROUP BY submission_date ;;
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
