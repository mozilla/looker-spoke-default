include: "../views/desktop_new_profile.view.lkml"
include: "../views/country_buckets.view.lkml"

# view used to ensure duplicate entries are only counted once.
view: distinct_new_profiles {
  derived_table: {
    sql:
    SELECT
    ROW_NUMBER() OVER (PARTITION BY client_id, DATE(submission_timestamp)) AS rn,
    client_id,
    submission_timestamp
  FROM
    `mozdata.telemetry.new_profile`
  WHERE
      DATE(submission_timestamp) <= DATE_SUB(
      IF({% parameter desktop_new_profile.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_end desktop_new_profile.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_new_profile.date %}), DATE({% date_end desktop_new_profile.date %}), DAY) DAY)),
        DATE({% date_end desktop_new_profile.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_new_profile.ignore_most_recent_week %}, 9, 0) DAY)
    AND
    DATE(submission_timestamp) > DATE_SUB(
      IF({% parameter desktop_new_profile.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_start desktop_new_profile.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_new_profile.date %}), DATE({% date_end desktop_new_profile.date %}), DAY) DAY)),
        DATE({% date_start desktop_new_profile.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_new_profile.ignore_most_recent_week %}, 9, 0) DAY) AND
    payload.processes.parent.scalars.startup_profile_selection_reason = 'firstrun-created-default';;
  }

  dimension: client_id {
    hidden: yes
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: rn {
    description: "Row number. Used to prevent counting duplicates."
    hidden: yes
    type: number
    sql: ${TABLE}.rn ;;
  }

  dimension: submission_timestamp {
    hidden: yes
    type: date_time
    sql: ${TABLE}.submission_timestamp ;;
  }
}

explore: desktop_new_profile {
  description: "First runs of a new installation of Firefox (for installs downloaded from the website on a non-Firefox browser)."
  sql_always_where:
    ${submission_date} > date(2020, 7, 1) AND
    ${normalized_channel} = "release" AND
    DATE_DIFF(  -- Only use builds from the last month
      ${submission_date},
      SAFE.PARSE_DATE('%Y%m%d', SUBSTR(${application__build_id}, 0, 8)),
      WEEK
    ) <= 6 AND
    ${normalized_os} = "Windows" AND
    ${environment__settings__attribution__source} IS NOT NULL AND
    ${environment__partner__distribution_id} IS NULL AND
    COALESCE(${environment__settings__attribution__ua}, "") != "firefox" AND
    ${payload__processes__parent__scalars__startup_profile_selection_reason} = "firstrun-created-default" AND
    ${distinct_new_profiles.rn} = 1 AND
    DATE(${submission_date}) <= DATE_SUB(
      IF({% parameter desktop_new_profile.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_end desktop_new_profile.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_new_profile.date %}), DATE({% date_end desktop_new_profile.date %}), DAY) DAY)),
        DATE({% date_end desktop_new_profile.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_new_profile.ignore_most_recent_week %}, 9, 0) DAY)
    AND
    DATE(${submission_date}) > DATE_SUB(
      IF({% parameter desktop_new_profile.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_start desktop_new_profile.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_new_profile.date %}), DATE({% date_end desktop_new_profile.date %}), DAY) DAY)),
        DATE({% date_start desktop_new_profile.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_new_profile.ignore_most_recent_week %}, 9, 0) DAY);;
  join: distinct_new_profiles {
    type: inner
    relationship: one_to_one
    sql_on:
      ${desktop_new_profile.client_id} = ${distinct_new_profiles.client_id} AND
      ${desktop_new_profile.submission_time} = ${distinct_new_profiles.submission_timestamp};;
  }
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.code} = ${desktop_new_profile.normalized_country_code} ;;
  }
  always_filter: {
    filters: [
      desktop_new_profile.date: "28 day",
      join_field: "yes",
    ]
  }

  aggregate_table: rollup__country_buckets_bucket__submission_date {
    query: {
      dimensions: [country_buckets.bucket, submission_date, join_field]
      measures: [new_profiles]
      filters: [desktop_new_profile.date: "28 day", desktop_new_profile.ignore_most_recent_week: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_buckets_bucket__submission_date_prev {
    query: {
      dimensions: [country_buckets.bucket, submission_date, join_field]
      measures: [new_profiles]
      filters: [
        desktop_new_profile.date: "28 day",
        desktop_new_profile.ignore_most_recent_week: "Yes",
        desktop_new_profile.previous_time_period: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  query: total_new_profiles {
    dimensions: [country_buckets.bucket]
    measures: [desktop_new_profile.new_profiles]
    filters: [
      desktop_new_profile.date: "28 days",
      desktop_new_profile.ignore_most_recent_week: "No",
      desktop_new_profile.join_field: "yes"
    ]
    label: "Total new Firefox first runs in the past 28 days"
  }
}
