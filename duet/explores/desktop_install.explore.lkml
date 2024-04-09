include: "../views/desktop_install.view.lkml"
include: "../views/country_buckets.view.lkml"

explore: desktop_install  {
  description: "New Installs and re-installation of Firefox."
  sql_always_where:
    ${submission_date} > date(2020, 7 ,1) AND
    (${silent} = FALSE OR ${silent} IS NULL) AND
    ${build_channel} = "release" AND
    ${succeeded} AND
    DATE_DIFF(  -- Only use builds from the last month
        ${submission_date},
        SAFE.PARSE_DATE('%Y%m%d', SUBSTR(${build_id}, 0, 8)),
        WEEK
    ) <= 6 AND
    ${attribution} IN ("chrome", "ie", "edge") AND
    DATE(${submission_date}) <= DATE_SUB(
      IF({% parameter desktop_install.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_end desktop_install.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_install.date %}), DATE({% date_end desktop_install.date %}), DAY) DAY)),
        DATE({% date_end desktop_install.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_install.ignore_most_recent_week %}, 9, 0) DAY)
    AND
    DATE(${submission_date}) > DATE_SUB(
      IF({% parameter desktop_install.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_start desktop_install.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_install.date %}), DATE({% date_end desktop_install.date %}), DAY) DAY)),
        DATE({% date_start desktop_install.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_install.ignore_most_recent_week %}, 9, 0) DAY);;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.code} = ${desktop_install.normalized_country_code} ;;
  }
  always_filter: {
    filters: [
      desktop_install.date: "28 day",
      join_field: "yes"
    ]
  }

  aggregate_table: rollup__country_buckets_bucket__submission_date {
    query: {
      dimensions: [country_buckets.bucket, submission_date, join_field]
      measures: [new_installs, paveovers]
      filters: [desktop_install.date: "28 day", desktop_install.ignore_most_recent_week: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_buckets_bucket__submission_date_prev {
    query: {
      dimensions: [country_buckets.bucket, submission_date, join_field]
      measures: [new_installs, paveovers]
      filters: [
        desktop_install.date: "28 day",
        desktop_install.ignore_most_recent_week: "Yes",
        desktop_install.previous_time_period: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  query: total_new_installs {
    dimensions: [country_buckets.bucket]
    measures: [desktop_install.new_installs]
    filters: [
      desktop_install.date: "28 days",
      desktop_install.ignore_most_recent_week: "No",
      desktop_install.join_field: "yes"
    ]
    label: "Total new Firefox installs in the past 28 days"
  }
}
