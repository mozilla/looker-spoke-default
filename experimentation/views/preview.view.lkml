view: preview {
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

  sql_table_name: {% parameter project %}.{% parameter dataset %}.statistics_{% parameter slug %}_{% parameter analysis_period %} ;;

  parameter: analysis_period {
    type: unquoted
    allowed_value: {
      label: "Daily"
      value: "daily"
    }
    allowed_value: {
      label: "Weekly"
      value: "weekly"
    }
    allowed_value: {
      label: "28 days"
      value: "28day"
    }
    allowed_value: {
      label: "Overall"
      value: "overall"
    }
    default_value: "daily"
  }

  dimension: normalized_slug {
    sql: "{% parameter slug %}" ;;
    type: string
  }

  dimension: window_index {
    sql:  ${TABLE}.window_index ;;
    type: number
  }

  dimension: branch {
    sql: ${TABLE}.branch ;;
    type: string
    suggestable: yes
  }

  dimension: metric {
    sql: ${TABLE}.metric ;;
    type: string
  }

  dimension: parameter {
    sql: ${TABLE}.parameter ;;
    type: number
  }

  dimension: statistic {
    sql: ${TABLE}.statistic ;;
    type: string
  }

  dimension: comparison {
    sql: ${TABLE}.comparison ;;
    type: string
  }

  dimension: ci_width {
    type: number
    sql: ${TABLE}.point ;;
  }

  dimension: segment {
    sql: ${TABLE}.segment ;;
    type: string
  }

  dimension: analysis_basis {
    sql: ${TABLE}.analysis_basis ;;
    type: string
  }

  measure: point {
    type: sum
    sql: ${TABLE}.point ;;
  }

  measure: upper {
    type: sum
    sql: ${TABLE}.upper ;;
  }

  measure: lower {
    type: sum
    sql: ${TABLE}.lower ;;
  }
}
