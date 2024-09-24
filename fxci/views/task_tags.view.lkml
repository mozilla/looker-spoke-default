view: task_tags {
  derived_table: {
    sql: SELECT
            task.task_id,
            task.submission_date,
            tags.key AS name,
            tags.value AS value
          FROM
            moz-fx-data-shared-prod.fxci.tasks_v1 AS task,
            UNNEST(task.tags) AS tags
          WHERE
            task.submission_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY);;
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
