connection: "telemetry"
label: "Firefox for iOS"

include: "//looker-hub/firefox_ios/*.view.lkml"
include: "views/*.view.lkml"
include: "dashboards/*.dashboard"

explore: usage {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
    ]
  }
}
explore: growth {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
    ]
  }
}

# Counters
explore: metrics_sample {
  from: metrics
  sql_always_where: DATE(submission_timestamp) = DATE_SUB(CURRENT_DATE, INTERVAL 2 DAYS)
    AND sample_id = 0;;
  hidden: yes
}

explore: column_field_paths {
  hidden: yes
}

explore: metrics_counters {
  hidden: no
}

explore: counters {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
      metric: "",
    ]
  }
}
