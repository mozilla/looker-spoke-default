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


}

view: non_matching {
  derived_table: {
    sql: SELECT
    submission_date,
    COUNTIF(
      decoded != live OR decoded != stable
    ) AS non_matching_count,
    FROM distinct_docids
    GROUP BY
    submission_date;;
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

  dimension: non_matching_count {
    sql: ${TABLE}.non_matching_count ;;
    type: number
  }
}
