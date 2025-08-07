include: "//looker-hub/monitoring/views/bigquery_shared_prod_table_storage_trends.view.lkml"

view: +bigquery_shared_prod_table_storage_trends {

    measure: sum_total_rows{
        type: sum
        sql: ${total_rows} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_partitions{
        type: sum
        sql: ${total_partitions} ;;
    }

    measure: sum_total_logical_GB{
        type: sum
        sql: ${total_logical_bytes}/POW(1024, 3) ;;
    }

    measure: sum_active_logical_GB{
        type: sum
        sql: ${active_logical_bytes}/POW(1024, 3) ;;
    }

    measure: sum_long_term_logical_GB{
        type: sum
        sql: ${long_term_logical_bytes}/POW(1024, 3) ;;
    }

    measure: sum_total_physical_GB{
        type: sum
        sql: ${total_physical_bytes}/POW(1024, 3) ;;
    }

    measure: sum_time_travel_physical_GB{
        type: sum
        sql: ${time_travel_physical_bytes}/POW(1024, 3) ;;
    }

    measure: sum_active_physical_GB{
        type: sum
        sql: ${active_physical_bytes}/POW(1024, 3) ;;
    }

    measure: sum_long_term_physical_GB{
        type: sum
        sql: ${long_term_physical_bytes}/POW(1024, 3) ;;
    }

    measure: sum_current_physical_GB{
        type: sum
        sql: ${current_physical_bytes}/POW(1024, 3) ;;
    }

    measure: sum_total_rows_3_days_ago{
        type: sum
        sql: ${total_rows_3_days_ago} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_partitions_3_days_ago{
        type: sum
        sql: ${total_partitions_3_days_ago} ;;
    }

    measure: sum_total_logical_GB_3_days_ago{
        type: sum
        sql: ${total_logical_bytes_3_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_active_logical_GB_3_days_ago{
        type: sum
        sql: ${active_logical_bytes_3_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_long_term_logical_GB_3_days_ago{
        type: sum
        sql: ${long_term_logical_bytes_3_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_total_physical_GB_3_days_ago{
        type: sum
        sql: ${total_physical_bytes_3_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_time_travel_physical_GB_3_days_ago{
        type: sum
        sql: ${time_travel_physical_bytes_3_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_active_physical_GB_3_days_ago{
        type: sum
        sql: ${active_physical_bytes_3_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_long_term_physical_GB_3_days_ago{
        type: sum
        sql: ${long_term_physical_bytes_3_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_current_physical_GB_3_days_ago{
        type: sum
        sql: ${current_physical_bytes_3_days_ago}/POW(1024, 3)  ;;
    }

    measure: sum_total_rows_7_days_ago{
        type: sum
        sql: ${total_rows_7_days_ago} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_partitions_7_days_ago{
        type: sum
        sql: ${total_partitions_7_days_ago} ;;
    }

    measure: sum_total_logical_GB_7_days_ago{
        type: sum
        sql: ${total_logical_bytes_7_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_active_logical_GB_7_days_ago{
        type: sum
        sql: ${active_logical_bytes_7_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_long_term_logical_GB_7_days_ago{
        type: sum
        sql: ${long_term_logical_bytes_7_days_ago}/POW(1024, 3)  ;;
    }

    measure: sum_total_physical_GB_7_days_ago{
        type: sum
        sql: ${total_physical_bytes_7_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_time_travel_physical_GB_7_days_ago{
        type: sum
        sql: ${time_travel_physical_bytes_7_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_active_physical_GB_7_days_ago{
        type: sum
        sql: ${active_physical_bytes_7_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_long_term_physical_GB_7_days_ago{
        type: sum
        sql: ${long_term_physical_bytes_7_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_current_physical_GB_7_days_ago{
        type: sum
        sql: ${current_physical_bytes_7_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_total_rows_14_days_ago{
        type: sum
        sql: ${total_rows_14_days_ago} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_total_partitions_14_days_ago{
        type: sum
        sql: ${total_partitions_14_days_ago} ;;
    }

    measure: sum_total_logical_GB_14_days_ago{
        type: sum
        sql: ${total_logical_bytes_14_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_active_logical_GB_14_days_ago{
        type: sum
        sql: ${active_logical_bytes_14_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_long_term_logical_GB_14_days_ago{
        type: sum
        sql: ${long_term_logical_bytes_14_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_total_physical_GB_14_days_ago{
        type: sum
        sql: ${total_physical_bytes_14_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_time_travel_physical_GB_14_days_ago{
        type: sum
        sql: ${time_travel_physical_bytes_14_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_active_physical_GB_14_days_ago{
        type: sum
        sql: ${active_physical_bytes_14_days_ago}/POW(1024, 3) ;;
    }

    #long_term_physical_bytes_14_days_ago
    measure: sum_long_term_physical_GB_14_days_ago{
        type: sum
        sql: ${long_term_physical_bytes_14_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_current_physical_GB_14_days_ago{
        type: sum
        sql: ${current_physical_bytes_14_days_ago}/POW(1024, 3) ;;
    }

    measure: sum_partition_change_last_3_days{
        type: sum
        sql: ${partition_change_last_3_days} ;;
    }

    measure: sum_partition_change_last_7_days{
        type: sum
        sql: ${partition_change_last_7_days} ;;
    }

    measure: sum_partition_change_last_14_days{
        type: sum
        sql: ${partition_change_last_14_days} ;;
    }

    measure: sum_rows_change_last_3_days{
        type: sum
        sql: ${rows_change_last_3_days} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_rows_change_last_7_days{
        type: sum
        sql: ${rows_change_last_7_days} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_rows_change_last_14_days{
        type: sum
        sql: ${rows_change_last_14_days} ;;
        value_format: "#,##0,,\" M\""
    }

    measure: sum_current_physical_GB_change_last_3_days{
        type: sum
        sql: ${current_physical_bytes_change_last_3_days}/POW(1024, 3) ;;
    }

    measure: sum_current_physical_GB_change_last_7_days{
        type: sum
        sql: ${current_physical_bytes_change_last_7_days}/POW(1024, 3) ;;
    }

    measure: sum_current_physical_GB_change_last_14_days{
        type: sum
        sql: ${current_physical_bytes_change_last_14_days}/POW(1024, 3) ;;
    }

    measure: sum_total_logical_GB_change_last_3_days{
        type: sum
        sql: ${total_logical_bytes_change_last_3_days}/POW(1024, 3) ;;
    }

    measure: sum_total_logical_GB_change_last_7_days{
        type: sum
        sql: ${total_logical_bytes_change_last_7_days}/POW(1024, 3) ;;
    }

    measure: sum_total_logical_GB_change_last_14_days{
        type: sum
        sql: ${total_logical_bytes_change_last_14_days}/POW(1024, 3) ;;
    }

    measure: sum_active_logical_GB_change_last_3_days{
        type: sum
        sql: ${active_logical_bytes_change_last_3_days}/POW(1024, 3) ;;
    }

    measure: sum_active_logical_GB_change_last_7_days{
        type: sum
        sql: ${active_logical_bytes_change_last_7_days}/POW(1024, 3) ;;
    }

    measure: sum_active_logical_GB_change_last_14_days{
        type: sum
        sql: ${active_logical_bytes_change_last_14_days}/POW(1024, 3) ;;
    }

    measure: sum_long_term_logical_GB_change_last_3_days{
        type: sum
        sql: ${long_term_logical_bytes_change_last_3_days}/POW(1024, 3) ;;
    }

    measure: sum_long_term_logical_GB_change_last_7_days{
        type: sum
        sql: ${long_term_logical_bytes_change_last_7_days}/POW(1024, 3) ;;
    }

    measure: sum_long_term_logical_GB_change_last_14_days{
        type: sum
        sql: ${long_term_logical_bytes_change_last_14_days}/POW(1024, 3) ;;
    }

    measure: sum_total_physical_GB_change_last_3_days{
        type: sum
        sql: ${total_physical_bytes_change_last_3_days}/POW(1024, 3) ;;
    }

    measure: sum_total_physical_GB_change_last_7_days{
        type: sum
        sql: ${total_physical_bytes_change_last_7_days}/POW(1024, 3) ;;
    }

    measure: sum_total_physical_GB_change_last_14_days{
        type: sum
        sql: ${total_physical_bytes_change_last_14_days}/POW(1024, 3) ;;
    }

    measure: sum_time_travel_physical_GB_change_last_3_days{
        type: sum
        sql: ${time_travel_physical_bytes_change_last_3_days}/POW(1024, 3) ;;
    }

    measure: sum_time_travel_physical_GB_change_last_7_days{
        type: sum
        sql: ${time_travel_physical_bytes_change_last_7_days}/POW(1024, 3) ;;
    }

    measure: sum_time_travel_physical_GB_change_last_14_days{
        type: sum
        sql: ${time_travel_physical_bytes_change_last_14_days}/POW(1024, 3) ;;
    }

}
