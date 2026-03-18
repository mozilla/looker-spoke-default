connection: "telemetry"

include: "views/event_counts/onboarding_v1.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/onboarding_table_last_updated.datagroup.lkml"


explore: event_counts {
  from: onboarding_v1
  persist_with: onboarding_table_last_updated

  join: onboarding_v1__experiments {
    type: cross
    relationship: one_to_many
    view_label: "Experiments"
  }
  join: message_id_ranks {
    fields: [rank]
    type: inner
    relationship: many_to_one
    sql_on: ${event_counts.message_id} = ${message_id_ranks.message_id} ;;
  }

  always_filter: {
    filters: [
      submission_timestamp_date: "14 days",
    ]
  }

  query: top_ten_messages {
    pivots: [event_counts.message_id]
    dimensions: [event_counts.submission_timestamp_date, event_counts.message_id]
    measures: [event_counts.event_count]
    filters: [
      event_counts.submission_timestamp_date: "21 days",
      event_counts.event: "IMPRESSION",
      message_id_ranks.rank: "<=10"
    ]
    label: "Top 10 Impression Events"
    limit: 500
  }
  sql_always_where: DATE(submission_timestamp) > '2020-01-01'
    ;;
}
