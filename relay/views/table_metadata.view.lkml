  view: table_metadata {
    derived_table: {
      sql: SELECT
              table_name,
              MAX(last_modified_time) AS last_modified_time,
            FROM
              `moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS`
            GROUP BY
              table_name
            ;;
    }

    dimension: table_name {
      hidden: yes
      sql: ${TABLE}.table_name;;
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
