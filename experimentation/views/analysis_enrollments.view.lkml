view: analysis_enrollments {
  parameter: slug {
    type: string
    suggest_dimension: slug_name
  }

  parameter: segment {
    type: unquoted
  }

  derived_table: {
    sql:
      WITH enrollments AS (
        SELECT
          client_id,
          branch,
          enrollment_date,
          exposure_date,
          num_enrollment_events,
          num_exposure_events,
          {% parameter slug %} AS slug_name
        FROM
          `moz-fx-data-experiments.mozanalysis.enrollments_*`
        WHERE _TABLE_SUFFIX = REPLACE({% parameter slug %}, "-", "_")
        {% if segment._parameter_value != "" %}
        AND {% parameter segment %} = TRUE
        {% endif %}
      ),

      slugs AS (
        SELECT
          DISTINCT normandy_slug AS slug_name
        FROM moz-fx-data-experiments.monitoring.experimenter_experiments_v1
      )

      SELECT
        *
      FROM slugs
      FULL OUTER JOIN enrollments
      USING(slug_name)
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
    sql: TIMESTAMP(${TABLE}.enrollment_date) ;;
    type: date_time
  }

  dimension: exposure_date {
    sql: TIMESTAMP(${TABLE}.exposure_date) ;;
    type: date_time
  }

  dimension: num_enrollment_events {
    sql: ${TABLE}.num_enrollment_events ;;
    type: number
  }

  dimension: num_exposure_events {
    sql: ${TABLE}.num_exposure_events ;;
    type: number
  }

  dimension: slug_name {
    sql: ${TABLE}.slug_name ;;
    type: string
    hidden: yes
  }

  measure: total_clients {
    type: number
    sql: COUNT(${client_id}) ;;
  }
}
