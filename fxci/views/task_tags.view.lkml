view: task_tags {
  parameter: submission_date {
    default_value: "DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY)"
  }

  derived_table: {
    sql: SELECT
            task.task_id,
            tags.key AS name,
            tags.value AS value
          FROM
            moz-fx-data-shared-prod.fxci.tasks_v1 AS task,
            UNNEST(task.tags) AS tags
          WHERE
            task.submission_date >= {% parameter submission_date %};;
  }

  dimension: task_id {
    sql: ${TABLE}.task_id ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: value {
    sql: ${TABLE}.value ;;
  }
}
