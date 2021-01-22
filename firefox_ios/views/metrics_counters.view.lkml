include: "//looker-hub/firefox_ios/*.view.lkml"
include: "../firefox_ios.model"

view: metrics_counters {
  derived_table: {
    explore_source: column_field_paths {
      derived_column: metric_name {
        sql: SUBSTRING(field_path, STRPOS(field_path, '.') + 1) ;;
      }

      column: field_path {}


      filters: [
        column_field_paths.table_schema: "org_mozilla_ios_firefox",
        column_field_paths.table_name: "metrics",
        column_field_paths.column_name: "metrics",
        column_field_paths.field_path: "metrics.counter.%,metrics.labeled_counter.%,-%.key,-%.value",
        #column_field_paths.data_type: "INT64,ARRAY<STRUCT<key STRING, value INT64>>",
      ]
    }
  }

  dimension: metric_name {
    type: string
  }

}
