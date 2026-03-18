view: analysis_aggregates {
  parameter: slug {
    type: unquoted
    suggest_explore: experimenter_experiments
    suggest_dimension: slug
    suggestable: yes
    full_suggestions: yes
  }

  parameter: analysis_period {
    type: unquoted
    allowed_value: {
      label: "Daily"
      value: "day"
    }
    allowed_value: {
      label: "Weekly"
      value: "week"
    }
    allowed_value: {
      label: "28 days"
      value: "28day"
    }
    allowed_value: {
      label: "Overall"
      value: "overall"
    }
    default_value: "day"
  }

  parameter: window_index {
    type: unquoted
  }

  parameter: analysis_basis {
    type: unquoted
    allowed_value: {
      label: "Enrollments"
      value: "enrollments"
    }
    allowed_value: {
      label: "Exposures"
      value: "exposures"
    }
  }

  parameter: metric {
    type: unquoted
  }

  derived_table: {
    sql:
      SELECT
        client_id,
        branch,
        enrollment_date,
        exposure_date,
        num_enrollment_events,
        num_exposure_events,
        analysis_window_start,
        analysis_window_end,
        {% parameter metric %} AS metric
      FROM
        `moz-fx-data-experiments.mozanalysis.{% parameter slug %}_{% parameter analysis_basis %}_{% parameter analysis_period %}_{% parameter window_index %}`
    ;;
  }

  dimension: client_id {
    sql:  ${TABLE}.client_id ;;
    type: string
  }

  dimension: branch {
    sql: ${TABLE}.branch ;;
    type: string
    suggestable: yes
  }

  dimension: enrollment_date {
    sql: ${TABLE}.enrollment_date ;;
    type: date
  }

  dimension: exposure_date {
    sql: ${TABLE}.exposure_date ;;
    type: date
  }

  dimension: num_enrollment_events {
    sql: ${TABLE}.num_enrollment_events ;;
    type: number
  }

  dimension: num_exposure_events {
    sql: ${TABLE}.num_exposure_events ;;
    type: number
  }

  dimension: analysis_window_start {
    sql: ${TABLE}.analysis_window_start ;;
    type: number
  }

  dimension: analysis_window_end {
    type: number
    sql: ${TABLE}.analysis_window_end ;;
  }

  dimension: metric_results {
    sql: ${TABLE}.metric ;;
  }

  measure: total_clients {
    type: number
    sql: COUNT(${client_id}) ;;
  }
}
