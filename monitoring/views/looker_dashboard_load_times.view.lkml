include: "//looker-hub/monitoring/views/looker_dashboard_load_times.view.lkml"

view: +looker_dashboard_load_times {
  measure: seconds_until_metadata_loaded_p95 {
    label: "P95 Seconds until metadata loaded"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_metadata_loaded}) AS STRING))), 0.95) ;;
  }

  measure: seconds_until_metadata_loaded_p75 {
    label: "P75 Seconds until metadata loaded"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_metadata_loaded}) AS STRING))), 0.75) ;;
  }

  measure: seconds_until_metadata_loaded_p50 {
    label: "P50 Seconds until metadata loaded"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_metadata_loaded}) AS STRING))), 0.50) ;;
  }

  measure: seconds_until_metadata_loaded_p25 {
    label: "P25 Seconds until metadata loaded"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_metadata_loaded}) AS STRING))), 0.25) ;;
  }


  measure: seconds_until_first_data_received_p95 {
    label: "P95 Seconds until first data received"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_first_data_received}) AS STRING))), 0.95) ;;
  }

  measure: seconds_until_first_data_received_p75 {
    label: "P75 Seconds until first data received"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_first_data_received}) AS STRING))), 0.75) ;;
  }

  measure: seconds_until_first_data_received_p50 {
    label: "P50 Seconds until first data received"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_first_data_received}) AS STRING))), 0.50) ;;
  }

  measure: seconds_until_first_data_received_p25 {
    label: "P25 Seconds until first data received"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_first_data_received}) AS STRING))), 0.25) ;;
  }


  measure: seconds_until_first_tile_finished_rendering_p95 {
    label: "P95 Seconds until first tile finished rendering"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_first_tile_finished_rendering}) AS STRING))), 0.95) ;;
  }

  measure: seconds_until_first_tile_finished_rendering_p75 {
    label: "P75 Seconds until first tile finished rendering"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_first_tile_finished_rendering}) AS STRING))), 0.75) ;;
  }

  measure: seconds_until_first_tile_finished_rendering_p50 {
    label: "P50 Seconds until first tile finished rendering"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_first_tile_finished_rendering}) AS STRING))), 0.50) ;;
  }

  measure: seconds_until_first_tile_finished_rendering_p25 {
    label: "P25 Seconds until first tile finished rendering"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_first_tile_finished_rendering}) AS STRING))), 0.25) ;;
  }


  measure: seconds_until_last_data_received_p95 {
    label: "P95 Seconds until last data received"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_last_data_received}) AS STRING))), 0.95) ;;
  }

  measure: seconds_until_last_data_received_p75 {
    label: "P75 Seconds until last data received"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_last_data_received}) AS STRING))), 0.75) ;;
  }

  measure: seconds_until_last_data_received_p50 {
    label: "P50 Seconds until last data received"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_last_data_received}) AS STRING))), 0.50) ;;
  }

  measure: seconds_until_last_data_received_p25 {
    label: "P25 Seconds until last data received"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_last_data_received}) AS STRING))), 0.25) ;;
  }


  measure: seconds_until_last_tile_finished_rendering_p95 {
    label: "P95 Seconds until last tile finished rendering"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_last_tile_finished_rendering}) AS STRING))), 0.95) ;;
  }

  measure: seconds_until_last_tile_finished_rendering_p75 {
    label: "P75 Seconds until last tile finished rendering"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_last_tile_finished_rendering}) AS STRING))), 0.75) ;;
  }

  measure: seconds_until_last_tile_finished_rendering_p50 {
    label: "P50 Seconds until last tile finished rendering"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_last_tile_finished_rendering}) AS STRING))), 0.50) ;;
  }

  measure: seconds_until_last_tile_finished_rendering_p25 {
    label: "P25 Seconds until last tile finished rendering"
    type: number
    sql: `moz-fx-data-shared-prod.udf.looker_approx_percentile_distinct_disc`(ARRAY_AGG(DISTINCT CONCAT(CONCAT(CAST(${dashboard_page_session} AS STRING), '||'), CAST((${seconds_until_last_tile_finished_rendering}) AS STRING))), 0.25) ;;
  }
}
