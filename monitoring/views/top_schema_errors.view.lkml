view: top_schema_errors {
  derived_table: {
    sql: WITH top_errors AS
        (SELECT document_namespace,
                document_type,
                PATH,
                sum(error_count) AS error_count
         FROM `moz-fx-data-shared-prod`.monitoring.schema_error_counts
         GROUP BY document_namespace,
                  document_type,
                  PATH
         ORDER BY error_count DESC
         LIMIT 10),
           filtered AS
        (SELECT date_trunc(cast(HOUR AS date), DAY) AS submission_date,
                document_namespace,
                document_type,
                PATH,
                sum(error_count) AS error_count
         FROM `moz-fx-data-shared-prod`.monitoring.schema_error_counts
         RIGHT JOIN
           (SELECT * except(error_count)
            FROM top_errors) USING (document_namespace,
                                    document_type,
                                    PATH)
         GROUP BY submission_date,
                  document_namespace,
                  document_type,
                  PATH)
      SELECT submission_date,
             concat(PATH, " [", document_namespace, ".", document_type, "]") AS grouped,
             error_count
      FROM filtered
      WHERE submission_date between date_sub(current_date, interval 28 day) and current_date


       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: grouped {
    type: string
    sql: ${TABLE}.grouped ;;
  }

  dimension: error_count {
    type: number
    sql: ${TABLE}.error_count ;;
  }

  set: detail {
    fields: [submission_date, grouped, error_count]
  }
}
