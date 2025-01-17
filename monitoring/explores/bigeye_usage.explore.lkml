include: "../views/bigeye_usage.view.lkml"

explore: bigeye_usage {
  final: yes

  description: "Explore for understanding Bigeye's usage of BigQuery."
  label: "Bigeye usage"
  always_filter: {
    filters: [
      bigeye_usage.creation_date: "14 days",
      bigeye_usage.submission_date: "14 days"
    ]
  }

  query: top_100_most_expensive_jobs_last_7_days {
    description: "Top 100 Most expensive BQ jobs run by Bigeye in the last 7 days."
    label: "Top 100 most expensive jobs (last 7 days)"
    dimensions: [
      bigeye_usage.creation_date,
      bigeye_usage.full_table_id,
      bigeye_usage.job_id
    ]
    measures: [
      cost_sum
    ]
    filters: [
      bigeye_usage.creation_date: "7 days",
      bigeye_usage.submission_date: "7 days"
    ]
    sorts: [
      bigeye_usage.cost_sum: desc
    ]
    limit: 100
  }

  query: total_cost_bigeye_bq_last_7_days {
    description: "Total Cost of Bigeye running BQ jobs in the last 7 days."
    label: "Total Cost of Bigeye in BQ (last 7 days)"
    dimensions: [
      bigeye_usage.creation_date
    ]
    measures: [
      cost_sum
    ]
    filters: [
      bigeye_usage.creation_date: "7 days",
      bigeye_usage.submission_date: "7 days"
    ]
    sorts: [
      bigeye_usage.cost_sum: desc
    ]
    limit: 100
  }

  query: number_of_unique_jobs {
    description: "Number of unique BQ jobs triggered by Bigeye in the last 7 days."
    label: "Number of unique jobs (last 7 days)"
    dimensions: [
      bigeye_usage.creation_date
    ]
    measures: [
      cost_sum,
      distinct_job_count
    ]
    filters: [
      bigeye_usage.creation_date: "7 days",
      bigeye_usage.submission_date: "7 days"
    ]
    sorts: [
      bigeye_usage.creation_date: desc
    ]
    limit: 100
  }

  query: highest_total_cost_tables_last_7_days {
    description: "Tables with highest total cost in the last 7 days."
    label: "Tables with highest cost (last 7 days)"
    dimensions: [
      bigeye_usage.full_table_id
    ]
    measures: [
      cost_sum,
      distinct_job_count
    ]
    filters: [
      bigeye_usage.creation_date: "7 days",
      bigeye_usage.submission_date: "7 days"
    ]
    sorts: [
      bigeye_usage.creation_date: desc
    ]
    limit: 100
  }
}
