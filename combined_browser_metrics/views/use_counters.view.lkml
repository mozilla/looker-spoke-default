include: "//looker-hub/combined_browser_metrics/views/fenix_and_firefox_use_counters.view.lkml"

view: ff_use_counters {

  dimension: submission_date {
    description: "The date when the ingestion edge server accepted this message"
    label: "Submission Date"
    type: date
    sql: submission_date ;;
  }

  dimension: major_version {
    description: "The user visible main portion of version string (e.g., 1, 2, etc)."
    label: "Major Version"
    type: string
    sql: version_major ;;
  }

  dimension: country {
    description: "Result of a geographic lookup based on the client's IP address; An ISO 3166-1 alpha-2 country code"
    label: "Country"
    type: string
    sql: country ;;
  }

  dimension: platform {
    description: "Indicates if the data is from Firefox Desktop or Mobile (Fenix) "
    label: "Platform"
    type: string
    sql: platform ;;
  }

  dimension: use_counter {
    description: "The name of the metric; naming matches that found in the Glean dictionary"
    label: "Metric"
    type: string
    sql: metric ;;
  }

  measure: usage_rate {
    description: "Usage rate; denominator depends on if metric is a doc, page, worker shared, worker service, or worker dedicated type of metric"
    label: "Usage Rate"
    type: number
    sql: rate ;;
  }
}
