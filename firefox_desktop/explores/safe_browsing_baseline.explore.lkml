include: "/firefox_desktop/views/safe_browsing_baseline.view.lkml"

# Safe Browsing baseline — MNTOR-5334.
#
# The generated `metrics` explore already joins the URL-classifier labeled
# counters, but it does not join any custom-distribution bucket view, so
# `urlclassifier.ui_events` buckets are unreachable there. This explore adds that
# join and puts the Safe Browsing joins together in one place.
explore: safe_browsing_baseline {
  view_name: metrics
  label: "Safe Browsing Baseline"
  view_label: " Metrics"

  description: "Tier 0 baseline for MNTOR-5334: how often Firefox warns about phishing and malware, and how often users click through anyway. IMPORTANT: pick ONE nested group per query. Selecting fields from two different UNNEST joins (e.g. UI Events and Lookup Hit together) fans out rows and multiplies every measure."

  sql_always_where: ${metrics.submission_date} >= '2010-01-01' ;;

  # The bypass rate. Not reachable in the generated metrics explore.
  join: metrics__metrics__custom_distribution__urlclassifier_ui_events__values {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__custom_distribution__urlclassifier_ui_events__values}) AS metrics__metrics__custom_distribution__urlclassifier_ui_events__values ;;
  }

  # Prefix matches per list. NOT confirmed-bad counts, and keyed per table
  # rather than per navigation. See notes in the view file.
  join: metrics__metrics__labeled_counter__urlclassifier_lookup_hit {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__labeled_counter__urlclassifier_lookup_hit}) AS metrics__metrics__labeled_counter__urlclassifier_lookup_hit ON ${metrics.document_id} = ${metrics__metrics__labeled_counter__urlclassifier_lookup_hit.document_id} ;;
  }

  join: metrics__metrics__labeled_counter__urlclassifier_lookup_miss {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__labeled_counter__urlclassifier_lookup_miss}) AS metrics__metrics__labeled_counter__urlclassifier_lookup_miss ON ${metrics.document_id} = ${metrics__metrics__labeled_counter__urlclassifier_lookup_miss.document_id} ;;
  }

  # Real-time mode prep counters (Bugs 2010020, 2010023). Keyed by ETP mode and
  # window type. These size what real-time mode would cost.
  join: metrics__metrics__labeled_counter__urlclassifier_global_cache_hit {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__labeled_counter__urlclassifier_global_cache_hit}) AS metrics__metrics__labeled_counter__urlclassifier_global_cache_hit ON ${metrics.document_id} = ${metrics__metrics__labeled_counter__urlclassifier_global_cache_hit.document_id} ;;
  }

  join: metrics__metrics__labeled_counter__urlclassifier_global_cache_miss {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__labeled_counter__urlclassifier_global_cache_miss}) AS metrics__metrics__labeled_counter__urlclassifier_global_cache_miss ON ${metrics.document_id} = ${metrics__metrics__labeled_counter__urlclassifier_global_cache_miss.document_id} ;;
  }

  join: metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_request_count {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__labeled_counter__urlclassifier_realtime_simulation_request_count}) AS metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_request_count ON ${metrics.document_id} = ${metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_request_count.document_id} ;;
  }

  join: metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_request_size {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__labeled_counter__urlclassifier_realtime_simulation_request_size}) AS metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_request_size ON ${metrics.document_id} = ${metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_request_size.document_id} ;;
  }

  join: metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_response_size {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__labeled_counter__urlclassifier_realtime_simulation_response_size}) AS metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_response_size ON ${metrics.document_id} = ${metrics__metrics__labeled_counter__urlclassifier_realtime_simulation_response_size.document_id} ;;
  }

  # Download protection verdicts. A second Safe Browsing efficacy signal.
  join: metrics__metrics__custom_distribution__application_reputation_server_verdict__values {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${metrics.metrics__custom_distribution__application_reputation_server_verdict__values}) AS metrics__metrics__custom_distribution__application_reputation_server_verdict__values ;;
  }

  always_filter: {
    filters: [
      metrics.submission_date: "28 days",
      metrics.normalized_channel: "release",
    ]
  }
}
