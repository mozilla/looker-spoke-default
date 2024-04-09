include: "../views/desktop_session.view.lkml"
include: "../views/country_buckets.view.lkml"

explore: desktop_session {
  description: "Individual user visits to mozilla.org. By default, if a user is inactive for 30 minutes or more, any future activity is attributed to a new visit. Users that leave mozilla.org and return within 30 minutes are counted as part of the original visit."
  sql_always_where:
    ${operating_system} = "Windows" and ${browser} != "Mozilla" AND
    DATE(${desktop_session.date_date}) <= DATE_SUB(
      IF({% parameter desktop_session.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(
          DATE({% date_end desktop_session.date %}),
          INTERVAL DATE_DIFF(DATE({% date_start desktop_session.date %}), DATE({% date_end desktop_session.date %}), DAY) DAY)),
        DATE({% date_end desktop_session.date %})),
      -- if the most recent week is to be ignored, shift date range by 9 days
      INTERVAL IF({% parameter desktop_session.ignore_most_recent_week %}, 9, 0) DAY)
    AND
    DATE(${desktop_session.date_date}) > DATE_SUB(
      IF({% parameter desktop_session.previous_time_period %},
        -- if the data for the previous time period is requested,
        -- shift dates by the date range provided via the 'date' filter
        DATE(DATE_ADD(DATE({% date_start desktop_session.date %}),
        INTERVAL DATE_DIFF(DATE({% date_start desktop_session.date %}), DATE({% date_end desktop_session.date %}), DAY) DAY)),
      DATE({% date_start desktop_session.date %})),
    -- if the most recent week is to be ignored, shift date range by 9 days
    INTERVAL IF({% parameter desktop_session.ignore_most_recent_week %}, 9, 0) DAY);;
  join: country_buckets {
    type: cross
    relationship: many_to_one
    sql_where: (
      -- the country names recorded in ga_derived cannot be mapped to country codes using
      -- the static.country_names_v1 dataset, instead some manual mapping needs to be done
      -- so that countries can get assigned to the correct bucket
      (${desktop_session.standardized_country_name} = "USA" AND ${country_buckets.code} = "US") OR
      (${country_buckets.code} = "GB" AND ${desktop_session.standardized_country_name} = "United Kingdom") OR
      (${country_buckets.code} = "DE" AND ${desktop_session.standardized_country_name} = "Germany") OR
      (${country_buckets.code} = "FR" AND ${desktop_session.standardized_country_name} = "France") OR
      (${country_buckets.code} = "CA" AND ${desktop_session.standardized_country_name} = "Canada") OR
      (${country_buckets.code} = "BR" AND ${desktop_session.standardized_country_name} = "Brazil") OR
      (${country_buckets.code} = "MX" AND ${desktop_session.standardized_country_name} = "Mexico") OR
      (${country_buckets.code} = "CN" AND ${desktop_session.standardized_country_name} = "China") OR
      (
        ${desktop_session.standardized_country_name} NOT IN ("Germany", "USA", "United Kingdom", "France", "Canada", "Mexico", "China", "Brazil") AND
        ${country_buckets.bucket} IN ("non-tier-1", "Overall") AND ${country_buckets.code} = "OTHER" )
      );;
  }
  always_filter: {
    filters: [
      desktop_session.date: "28 day",
      desktop_session.join_field: "yes"
    ]
  }

  aggregate_table: rollup__country_buckets_bucket__submission_date {
    query: {
      dimensions: [country_buckets.bucket, desktop_session.date_date, desktop_session.join_field]
      measures: [desktop_session.total_non_fx_downloads, desktop_session.total_non_fx_sessions]
      filters: [desktop_session.date: "28 day", desktop_session.ignore_most_recent_week: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_buckets_bucket__submission_date_prev {
    query: {
      dimensions: [country_buckets.bucket, desktop_session.date_date, desktop_session.join_field]
      measures: [desktop_session.total_non_fx_downloads, desktop_session.total_non_fx_sessions]
      filters: [
        desktop_session.date: "28 day",
        desktop_session.ignore_most_recent_week: "Yes",
        desktop_session.previous_time_period: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  query: total_downloads {
    dimensions: [country_buckets.bucket]
    measures: [desktop_session.total_non_fx_downloads]
    filters: [
      desktop_session.date: "28 days",
      desktop_session.ignore_most_recent_week: "No",
      desktop_session.join_field: "yes"
    ]
    label: "Total downloads from non-Firefox browsers in the past 28 days"
  }

  query: total_visits {
    dimensions: [country_buckets.bucket]
    measures: [desktop_session.total_non_fx_downloads]
    filters: [
      desktop_session.date: "28 days",
      desktop_session.ignore_most_recent_week: "No",
      desktop_session.join_field: "yes"
    ]
    label: "Total visits from non-Firefox browsers in the past 28 days"
  }
}
