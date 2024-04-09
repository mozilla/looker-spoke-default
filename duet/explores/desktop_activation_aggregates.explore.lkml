include: "../views/desktop_activation_aggregates.view.lkml"
include: "../views/country_buckets.view.lkml"

explore: desktop_activation_aggregates {
  hidden: yes
  description: "Aggregated activated new profiles. A new profile is active at least 5 days out of 7 in the week after it’s first run. Note, this number is only available one week after a cohort date."
  sql_always_where: ${submission_timestamp_date} > date(2020, 7 ,1) AND
    ${channel} = "release" AND
    DATE_DIFF(  -- Only use builds from the last month
      ${submission_timestamp_date},
      SAFE.PARSE_DATE('%Y%m%d', SUBSTR(${build_id}, 0, 8)),
      WEEK
    ) <= 6 AND
    ${os} = "Windows" AND
    ${attribution_source} IS NOT NULL AND
    ${distribution_id} IS NULL AND
    ${attribution_ua} != "firefox" AND
    DATE(${submission_timestamp_date}) <= DATE_SUB(
      IF({% parameter desktop_activation_aggregates.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_end desktop_activation_aggregates.date %}), INTERVAL DATE_DIFF(DATE({% date_start desktop_activation_aggregates.date %}), DATE({% date_end desktop_activation_aggregates.date %}), DAY) DAY)),
          DATE({% date_end desktop_activation_aggregates.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_activation_aggregates.ignore_most_recent_week %}, 9, 0) DAY)
    AND
    DATE(${submission_timestamp_date}) > DATE_SUB(
      IF({% parameter desktop_activation_aggregates.previous_time_period %},
      -- if the data for the previous time period is requested,
      -- shift dates by the date range provided via the 'date' filter
      DATE(DATE_ADD(
        DATE({% date_start desktop_activation_aggregates.date %}), INTERVAL DATE_DIFF(DATE({% date_start desktop_activation_aggregates.date %}), DATE({% date_end desktop_activation_aggregates.date %}), DAY) DAY)),
        DATE({% date_start desktop_activation_aggregates.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_activation_aggregates.ignore_most_recent_week %}, 9, 0) DAY);;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.code} = ${desktop_activation_aggregates.country_code} ;;
  }
  always_filter: {
    filters: [
      desktop_activation_aggregates.date: "28 day",
      desktop_activation_aggregates.ignore_most_recent_week: "yes",
      join_field: "yes"
    ]
  }

  aggregate_table: rollup__country_buckets_bucket__submission_date {
    query: {
      dimensions: [country_buckets.bucket, desktop_activation_aggregates.submission_timestamp_date, join_field]
      measures: [desktop_activation_aggregates.activations]
      filters: [desktop_activation_aggregates.date: "28 day", desktop_activation_aggregates.ignore_most_recent_week: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_buckets_bucket__submission_date_prev {
    query: {
      dimensions: [country_buckets.bucket, desktop_activation_aggregates.submission_timestamp_date, join_field]
      measures: [desktop_activation_aggregates.activations]
      filters: [
        desktop_activation_aggregates.date: "28 day",
        desktop_activation_aggregates.ignore_most_recent_week: "Yes",
        desktop_activation_aggregates.previous_time_period: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }
}
