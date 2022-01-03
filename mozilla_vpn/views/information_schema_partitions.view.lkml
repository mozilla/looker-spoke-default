view: information_schema_partitions {
  sql_table_name: moz-fx-data-shared-prod.mozilla_vpn_derived.INFORMATION_SCHEMA.PARTITIONS;;
  dimension: table_name {
    hidden: yes
    sql: ${TABLE}.table_name;;
    type: string
  }

  dimension: partition_id {
    hidden: yes
    sql: ${TABLE}.partition_id;;
    type: string
  }

  dimension_group: last_modified {
    sql: ${TABLE}.last_modified_time;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }
}
