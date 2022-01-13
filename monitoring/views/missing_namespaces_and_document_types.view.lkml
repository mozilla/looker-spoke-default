view: missing_namespaces_and_document_types {
  derived_table: {
    sql: WITH ping_counts AS (
        SELECT
          TIMESTAMP_TRUNC(submission_timestamp, HOUR) AS hour,
          metadata.document_namespace,
          metadata.document_type,
          metadata.document_version,
          COUNT(*) AS ping_count
        FROM
          mozdata.monitoring.payload_bytes_decoded_structured
        WHERE
          submission_timestamp >= TIMESTAMP_SUB(current_timestamp, INTERVAL 28 * 24 HOUR)
          AND metadata.header.x_debug_id IS NULL
        GROUP BY
          hour,
          document_namespace,
          document_type,
          document_version
      ),
      error_counts AS (
        SELECT
          TIMESTAMP_TRUNC(submission_timestamp, HOUR) AS hour,
          document_namespace,
          document_type,
          document_version,
          error_type,
          COUNT(*) AS error_count
        FROM
          mozdata.monitoring.payload_bytes_error_structured
        WHERE
          submission_timestamp >= TIMESTAMP_SUB(current_timestamp, INTERVAL 28 * 24 HOUR)
          AND error_message NOT LIKE 'com.mozilla.telemetry.decoder.MessageScrubber$UnwantedDataException%'
        GROUP BY
          hour,
          document_namespace,
          document_type,
          document_version,
          error_type
      ),
      structured_hourly_errors AS (
        SELECT
          hour,
          document_namespace,
          document_type,
          document_version,
          error_type,
          COALESCE(ping_count, 0) + COALESCE(error_counts.error_count, 0) AS ping_count,
          COALESCE(error_counts.error_count, 0) AS error_count
        FROM
          ping_counts
        FULL OUTER JOIN
          error_counts
        USING
          (hour, document_namespace, document_type, document_version)
      ),
      with_ratio AS (
        SELECT
          *,
          SAFE_DIVIDE(1.0 * error_count, ping_count) AS error_ratio
        FROM
          structured_hourly_errors
      ),
      final AS (
      SELECT
        document_namespace,
        SUM(ping_count) AS total_pings,
        document_type,
        document_version
      FROM
        with_ratio
      WHERE
        hour > TIMESTAMP_SUB(current_timestamp, INTERVAL 7 DAY)
      GROUP BY
        document_namespace,
        document_type,
        document_version
      HAVING
        SUM(ping_count) > 20
        AND SAFE_DIVIDE(1.0 * SUM(error_count), SUM(ping_count)) > 0.99
        AND NOT REGEXP_CONTAINS(document_namespace, '^org-mozilla-firefo.$')
      ORDER BY
        total_pings DESC
      )
      SELECT
        document_namespace,
        total_pings,
        document_type,
        document_version
      FROM
        final;;
  }

  dimension: document_namespace {
    type: string
    sql: ${TABLE}.document_namespace ;;
  }

  dimension: document_type  {
    type: string
    sql:  ${TABLE}.document_type ;;
  }

  dimension: document_version  {
    type: string
    sql:  ${TABLE}.document_version ;;
  }

  measure: total_pings {
    type: sum
    sql: ${TABLE}.total_pings ;;
  }
}
