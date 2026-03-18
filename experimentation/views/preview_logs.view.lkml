view: preview_logs {
  parameter: project {
    type: unquoted
    default_value: "mozdata"
  }

  parameter: dataset {
    type: unquoted
    default_value: "tmp"
  }

  parameter: slug {
    type: unquoted
  }

  sql_table_name: {% parameter project %}.{% parameter dataset %}.logs_{% parameter slug %} ;;

  dimension: normalized_slug {
    sql: "{% parameter slug %}" ;;
    type: string
  }

  dimension: exception_type {
    sql:  ${TABLE}.exception_type ;;
    type: string
  }

  dimension: filename {
    sql: ${TABLE}.filename ;;
    type: string
  }

  dimension: analysis_basis {
    sql: ${TABLE}.analysis_basis ;;
    type: string
  }

  dimension: exception {
    sql: ${TABLE}.exception ;;
    type: string
  }

  dimension: segment {
    sql: ${TABLE}.segment ;;
    type: string
  }

  dimension: func_name {
    sql: ${TABLE}.func_name ;;
    type: string
  }

  dimension: experiment {
    sql: ${TABLE}.experiment ;;
    type: string
  }

  dimension: statistic {
    sql: ${TABLE}.statistic ;;
    type: string
  }

  dimension: log_level {
    type: string
    sql: ${TABLE}.log_level ;;
  }

  dimension: message {
    sql: ${TABLE}.message ;;
    type: string
  }

  dimension: metric {
    sql: ${TABLE}.metric ;;
    type: string
  }

  dimension: timestamp {
    sql: ${TABLE}.timestamp ;;
    type: date_time
  }

  dimension: cost {
    type: number
    sql: IF(CONTAINS_SUBSTR(${TABLE}.message, "query cost"), CAST(SPLIT(${TABLE}.message, ': ')[OFFSET(1)] AS FLOAT64), NULL) ;;
  }
}
