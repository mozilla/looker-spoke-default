include: "//looker-hub/combined_browser_metrics/views/fenix_and_firefox_use_counters.view.lkml"

view: +fenix_and_firefox_use_counters {

  dimension: submission_date {
    description: "The date when the ingestion edge server accepted this message"
    type: date
    sql: submission_date ;;
  }

  dimension: version_major {
    description: "The user visible main portion of version string (e.g., 1, 2, etc)."
    type: string
    sql: version_major ;;
  }

  dimension: country {
    description: "Result of a geographic lookup based on the client's IP address; An ISO 3166-1 alpha-2 country code"
    type: string
    sql: country ;;
  }

  dimension: platform {
    description: "Indicates if the data is from Firefox Desktop or Mobile (Fenix) "
    type: string
    sql: platform ;;
  }

  dimension: metric {
    description: "The name of the metric; naming matches that found in the Glean dictionary"
    type: string
    sql: metric ;;
  }

  measure: rate {
    description: "Usage rate; denominator depends on if metric is a doc, page, worker shared, worker service, or worker dedicated type of metric"
    type: number
    sql: rate ;;
  }
}
