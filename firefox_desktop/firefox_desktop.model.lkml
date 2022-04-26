connection: "telemetry"

include: "//looker-hub/firefox_desktop/views/*.view.lkml"
include: "//looker-hub/firefox_desktop/explores/*.explore.lkml"
include: "explores/*.explore.lkml"
# include: "dashboards/*.dashboard"

explore: firefox_desktop_last_seen {
  label: "Firefox Dekstop Clients Last Seen"
  from: clients_last_seen_table
  hidden: yes
}

explore: +client_counts {
  label: "Client Counts (Legacy Telemetry)"
  always_filter: {
    filters: [
      client_counts.submission_date: "7 days",
      client_counts.sample_id: "0"
    ]
  }
}

explore: +event_counts {
  label: "Event Counts (Legacy Telemetry)"
  always_filter: {
    filters: [
      events.submission_date: "7 days",
      events.sample_id: "0"
    ]
  }
}

explore: +funnel_analysis {
  label: "Funnel Analysis (Legacy Telemetry)"
  always_filter: {
    filters: [
      funnel_analysis.submission_date: "7 days",
      funnel_analysis.sample_id: "0"
    ]
  }
}

explore: +growth_accounting {
  label: "Growth Accounting (Legacy Telemetry)"
  always_filter: {
    filters: [
      growth_accounting.submission_date: "7 days",
      growth_accounting.sample_id: "0"
    ]
  }
}

explore: +baseline {
  label: "Baseline (Glean)"
  always_filter: {
    filters: [
      baseline.submission_date: "7 days",
      baseline.sample_id: "0"
    ]
  }
}

explore: feature_usage {
  view_name: feature_usage_table
  label: "Feature Usage (Legacy Telemetry)"
  description: "A daily aggregation of specific browser feature usages by 1% of Firefox desktop client."

  always_filter: {
    filters: [
      feature_usage_table.submission_date: "7 days"
    ]
  }
}

explore: +metrics {
  label: "Metrics (Glean)"
  always_filter: {
    filters: [
      metrics.submission_date: "7 days",
      metrics.sample_id: "0"
    ]
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_block_nonsponsored_bestmatch_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
   sql: SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_block_nonsponsored_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_block_sponsored_bestmatch_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_block_sponsored_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_click_nonsponsored_bestmatch_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_click_sponsored_bestmatch_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_click_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_help_nonsponsored_bestmatch_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql: SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_help_sponsored_bestmatch_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_help_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_impression_nonsponsored_bestmatch_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_impression_sponsored_bestmatch_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_impression_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}
