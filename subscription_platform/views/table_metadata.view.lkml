view: table_metadata {
  derived_table: {
    sql:
      SELECT
        table_name,
        MAX(last_modified_time) AS last_modified_time
      FROM
        `moz-fx-data-shared-prod.subscription_platform_derived.INFORMATION_SCHEMA.PARTITIONS`
      GROUP BY
        table_name
      ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
    hidden: yes
  }

  dimension_group: last_modified {
    type: time
    sql: ${TABLE}.last_modified_time ;;
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
