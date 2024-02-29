view: analysis_enrollments {
  parameter: slug {
    type: unquoted
  }

  parameter: segment {
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
      FROM
        `moz-fx-data-experiments.mozanalysis.enrollments_{% parameter slug %}`
      {% if segment._parameter_value != "" %}
      WHERE {% parameter segment %} = TRUE
      {% endif %}
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

  measure: total_clients {
    type: number
    sql: COUNT(${client_id}) ;;
  }
}
