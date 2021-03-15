view: mozregression_aggregates {
  sql_table_name: `mozdata.org_mozilla_mozregression.mozregression_aggregates` ;;

  dimension: app_used {
    sql: ${TABLE}.app_used ;;
    type: string
  }

  dimension: distinct_clients {
    sql: ${TABLE}.distinct_clients ;;
    type: number
  }

  dimension: mozregression_variant {
    sql: ${TABLE}.mozregression_variant ;;
    type: string
  }

  dimension: mozregression_version {
    sql: ${TABLE}.mozregression_version ;;
    type: string
  }

  dimension: os {
    sql: ${TABLE}.os ;;
    type: string
  }

  dimension: os_version {
    sql: ${TABLE}.os_version ;;
    type: number
  }

  dimension: total_uses {
    sql: ${TABLE}.total_uses ;;
    type: number
  }

  dimension_group: date {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
    timeframes: [
      raw,
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