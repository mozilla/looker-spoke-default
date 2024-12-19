include: "//looker-hub/monitoring/views/bigeye_usage.view.lkml"

view: +bigeye_usage {
  final: yes

  dimension: full_table_id {
    label: "Full Table ID"
    description: "Fully qualified table id."
    sql: CONCAT(
      ${TABLE}.reference_project_id, ".",
      ${TABLE}.reference_dataset_id, ".",
      ${TABLE}.reference_table_id
    ) ;;

  }

  measure: distinct_job_count {
    label: "Distinct job count"
    description: "Distinct count of job ids."
    type: count_distinct
    sql: ${TABLE}.job_id ;;
  }

  dimension: service_account {
    hidden: yes
  }

  dimension: cost {
    hidden: yes
  }

  dimension: task_duration {
    hidden: yes
  }

  dimension: total_slot_ms {
    hidden: yes
  }

  dimension: total_terabytes_billed {
    hidden: yes
  }

  dimension: total_terabytes_processed {
    hidden: yes
  }
}
