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

  # Dimensions
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

  dimension: new_bug {
    type: string
    sql: "create Bug" ;;
    link: {
      label: "create new Bug"
      url: "{{
        'https://bugzilla.mozilla.org/enter_bug.cgi?'
      }}{{
        'product=Data+Platform+and+Tools'
      }}{{
        '&component=General'
      }}{{
        '&bug_type=defect'
      }}{{
        '&status_whiteboard=%5Bdata-quality%5D'
      }}{{
        '&short_desc=distinct+docId+mismatch+on+'
      }}{{
        submission_date
      }}{{
        '+in+%60'
      }}{{
        namespace }}.{{ doc_type }}%60"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }

  # Measures
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
