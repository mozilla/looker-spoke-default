include: "//looker-hub/firefox_desktop/views/microsurvey_redacted_table.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/microsurvey_redacted_last_updated.datagroup.lkml"

explore: microsurvey_redacted {
  label: "Microsurvey Redacted"
  description: "Microsurvey ping data using the table view to expose all metrics and event dimensions. Highly sensitive fields (e.g. write-in responses) are redacted via the stable_views_redacted generator in bigquery-etl."
  view_name: microsurvey_redacted_table
  view_label: "Microsurvey Redacted"
  sql_always_where: ${microsurvey_redacted_table.submission_date} >= '2026-01-01' ;;
  persist_with: microsurvey_redacted_last_updated

  always_filter: {
    filters: [
      microsurvey_redacted_table.submission_date: "28 days",
    ]
  }

  join: microsurvey_redacted_table__events {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${microsurvey_redacted_table.events}) AS microsurvey_redacted_table__events ;;
  }

  join: microsurvey_redacted_table__events__extra {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${microsurvey_redacted_table__events.extra}) AS microsurvey_redacted_table__events__extra ;;
  }
}
