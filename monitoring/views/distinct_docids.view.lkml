view: distinct_docids {
  derived_table: {
    sql:
      SELECT
        submission_date,
        namespace,
        doc_type,
        decoded,
        live,
        stable,
      FROM `moz-fx-data-shared-prod.monitoring.structured_distinct_docids`
      UNION ALL
      SELECT
        submission_date,
        'telemetry',
        doc_type,
        decoded,
        live,
        stable,
      FROM `moz-fx-data-shared-prod.monitoring.telemetry_distinct_docids`
    ;;
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: namespace {
    sql: ${TABLE}.namespace ;;
    type: string
  }

  dimension: doc_type {
    sql: ${TABLE}.doc_type ;;
    type: string
  }

  dimension: decoded {
    sql: ${TABLE}.decoded ;;
    type: number
  }

  dimension: live {
    sql: ${TABLE}.live ;;
    type: number
  }

  dimension: stable {
    sql: ${TABLE}.stable ;;
    type: number
  }

  measure: non_matching_count {
    type: number
    sql: COUNTIF(
      IF(${TABLE}.decoded IS NULL, FALSE, ${TABLE}.decoded != ${TABLE}.live)
      OR ${TABLE}.live != ${TABLE}.stable
    );;
  }

  measure: n_documents {
    type:  sum
    sql: (${TABLE}.stable) ;;
  }
}
