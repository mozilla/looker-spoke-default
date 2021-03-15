view: geckoview_version {
  sql_table_name: `mozdata.org_mozilla_fenix.geckoview_version` ;;

  dimension: geckoview_major_version {
    sql: ${TABLE}.geckoview_major_version ;;
    type: number
  }

  dimension: n_pings {
    sql: ${TABLE}.n_pings ;;
    type: number
  }

  dimension_group: build_hour {
    sql: ${TABLE}.build_hour ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  measure: ping_count {
    type: count
  }
}