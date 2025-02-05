include: "//looker-hub/monitoring/views/bigquery_shared_prod_table_storage_trends.view.lkml"

view: +bigquery_shared_prod_table_storage_trends {

    measure: sum_total_rows{
        type: sum
        sql: ${total_rows} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_rows_3_days_ago{
        type: sum
        sql: ${total_rows_3_days_ago} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_rows_7_days_ago{
        type: sum
        sql: ${total_rows_7_days_ago} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_partitions{
        type: sum
        sql: ${total_partitions} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_partitions_3_days_ago{
        type: sum
        sql: ${total_partitions_3_days_ago} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_partitions_7_days_ago{
        type: sum
        sql: ${total_partitions_7_days_ago} ;;
        value_format: "#,##0,,\" M\""
    }
}
