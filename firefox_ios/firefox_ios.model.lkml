connection: "telemetry"
label: "Firefox for iOS"

include: "//looker-hub/firefox_ios/views/*.view.lkml"
include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

explore: usage {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
    ]
  }
  sql_always_where: submission_date >= "2020-01-01" ;;
}
explore: growth {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
    ]
  }
  sql_always_where: submission_date >= "2020-01-01" ;;
}

# Counters
explore: metrics_sample {
  from: metrics
  sql_always_where: DATE(submission_timestamp) = DATE_SUB(CURRENT_DATE, INTERVAL 2 DAY)
    AND sample_id = 0;;
  hidden: yes
}

explore: column_field_paths {
  hidden: yes
}

explore: metrics_counters {
  hidden: yes
}

explore: counters {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
      metric: "",
    ]
  }
}

explore: client_counts {
  description: "Client counts across dimensions and cohorts."
  always_filter: {
    filters: [
      client_counts.submission_date: "4 weeks",
      client_counts.channel: "mozdata.org^_mozilla^_ios^_firefox.baseline^_clients^_daily",
    ]
  }
  query: cohort_analysis {
    description: "Client Counts of weekly cohorts over the past N days."
    dimensions: [
      client_counts.days_since_first_seen,
      client_counts.first_seen_week
    ]
    measures: [client_counts.client_count]
    pivots: [client_counts.first_seen_week]
    filters: [
      submission_date: "8 weeks",
      first_seen_date: "8 weeks",
      client_counts.have_completed_period: "yes",
    ]
    sorts: [
      client_counts.days_since_first_seen: asc
    ]
  }
  query: build_breakdown {
    description: "Number of clients per build."
    dimensions: [
      client_counts.submission_date,
      client_counts.app_build
    ]
    measures: [client_count]
    pivots: [app_build]
    filters: [
      submission_date: "28 days"
    ]
    sorts: [
      submission_date: asc
    ]
  }
}
