include: "../views/*.view.lkml"

explore: session {
  sql_always_where:
    ${operating_system} = "Windows" and ${browser} != "Mozilla" AND
    DATE(${session.date_date}) <= DATE_SUB(
      IF({% parameter session.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_end session.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start session.date %}), DATE({% date_end session.date %}), DAY) DAY)),
        DATE({% date_end session.date %})),
      -- if the most recent week is to be ignored, shift date range by 8 days
      INTERVAL IF({% parameter session.ignore_most_recent_week %}, 8, 0) DAY)
    AND
    DATE(${session.date_date}) > DATE_SUB(
      IF({% parameter session.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(DATE({% date_start session.date %}),
        INTERVAL DATE_DIFF(DATE({% date_start session.date %}), DATE({% date_end session.date %}), DAY) DAY)),
      DATE({% date_start session.date %})),
    -- if the most recent week is to be ignored, shift date range by 8 days
    INTERVAL IF({% parameter session.ignore_most_recent_week %}, 8, 0) DAY);;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: (
      -- the country names recorded in ga_derived cannot be mapped to country codes using
      -- the static.country_names_v1 dataset, instead some manual mapping needs to be done
      -- so that countries can get assigned to the correct bucket
      (${session.standardized_country_name} = "USA" AND ${country_buckets.code} = "US") OR
      (${country_buckets.code} = "GB" AND ${session.standardized_country_name} = "United Kingdom") OR
      (${country_buckets.code} = "DE" AND ${session.standardized_country_name} = "Germany") OR
      (${country_buckets.code} = "FR" AND ${session.standardized_country_name} = "France") OR
      (${country_buckets.code} = "CA" AND ${session.standardized_country_name} = "Canada") OR
      (${country_buckets.code} = "BR" AND ${session.standardized_country_name} = "Brazil") OR
      (${country_buckets.code} = "MX" AND ${session.standardized_country_name} = "Mexico") OR
      (${country_buckets.code} = "CN" AND ${session.standardized_country_name} = "China") OR
      (
        ${session.standardized_country_name} NOT IN ("USA", "Germany", "United Kingdom", "France", "Canada", "Mexico", "China", "Brazil") AND
        ${country_buckets.bucket} IN ("non-tier-1", "Overall") AND ${country_buckets.code} = "OTHER" )
      );;
  }
  always_filter: {
    filters: [
      session.date: "28 day"
    ]
  }
}
