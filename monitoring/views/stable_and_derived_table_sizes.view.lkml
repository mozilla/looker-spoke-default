include: "//looker-hub/monitoring/views/stable_and_derived_table_sizes.view.lkml"

view: +stable_and_derived_table_sizes {
  # for deduping aggregations when joined
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${submission_date}, "__", ${dataset_id}, "__", ${table_id}) ;;
  }
}
