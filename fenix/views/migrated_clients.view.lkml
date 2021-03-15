view: migrated_clients {
  sql_table_name: `mozdata.org_mozilla_firefox.migrated_clients` ;;

  dimension: country {
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    type: string
  }

  dimension: fenix_client_id {
    sql: ${TABLE}.fenix_client_id ;;
    type: string
  }

  dimension: fennec_client_id {
    sql: ${TABLE}.fennec_client_id ;;
    type: string
  }

  dimension: manufacturer {
    sql: ${TABLE}.manufacturer ;;
    type: string
  }

  dimension: migration_ping_count {
    sql: ${TABLE}.migration_ping_count ;;
    type: number
  }

  dimension: normalized_channel {
    sql: ${TABLE}.normalized_channel ;;
    type: string
  }

  dimension_group: submission {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
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