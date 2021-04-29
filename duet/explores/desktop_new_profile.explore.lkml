include: "../views/*.view.lkml"

explore: desktop_new_profile {
  sql_always_where:
    ${submission_timestamp_date} > date(2020, 7 ,1) AND
    ${normalized_channel} = "release" AND
    DATE_DIFF(  -- Only use builds from the last month
      ${submission_timestamp_date},
      SAFE.PARSE_DATE('%Y%m%d', SUBSTR(${application__build_id}, 0, 8)),
      MONTH
    ) <= 1 AND
    ${normalized_os} = "Windows" AND
    ${attribution_source} IS NOT NULL AND
    ${distribution_id} IS NULL AND
    ${attribution_ua} != "firefox" AND
    ${startup_profile_selection_reason} = "firstrun-created-default" AND
    DATE(${submission_timestamp_date}) <= DATE_SUB(
      IF({% parameter desktop_new_profile.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_end desktop_new_profile.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_new_profile.date %}), DATE({% date_end desktop_new_profile.date %}), DAY) DAY)),
        DATE({% date_end desktop_new_profile.date %})),
      -- if the most recent week is to be ignored, shift date range by 8 days
      INTERVAL IF({% parameter desktop_new_profile.ignore_most_recent_week %}, 8, 0) DAY)
    AND
    DATE(${submission_timestamp_date}) > DATE_SUB(
      IF({% parameter desktop_new_profile.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_start desktop_new_profile.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_new_profile.date %}), DATE({% date_end desktop_new_profile.date %}), DAY) DAY)),
        DATE({% date_start desktop_new_profile.date %})),
      -- if the most recent week is to be ignored, shift date range by 8 days
      INTERVAL IF({% parameter desktop_new_profile.ignore_most_recent_week %}, 8, 0) DAY);;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: ${country_buckets.code} = ${desktop_new_profile.normalized_country_code} ;;
  }
  always_filter: {
    filters: [
      desktop_new_profile.date: "28 day"
    ]
  }
}
