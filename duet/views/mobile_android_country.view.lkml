view: mobile_android_country {
  derived_table: {
    sql: with play_store_retained as (
          SELECT
          Date AS submission_date,
          COALESCE(IF(country = "Other", null, country), "OTHER") as country,
          SUM(Store_Listing_visitors) AS unique_visitor_count,
          SUM(Installers) AS first_time_installs
          FROM
          `moz-fx-data-marketing-prod.google_play_store.Retained_installers_country_v1`
          WHERE
          Date >= '2021-04-01'
          AND Package_name IN ('org.mozilla.firefox_beta')
          GROUP BY 1, 2
      ),
      play_store_installs as (
          SELECT
          Date AS submission_date,
          COALESCE(IF(country = "Other", null, country), "OTHER") as country,
          sum(Daily_Device_installs) as device_installs,
          sum(Daily_User_Installs) as user_installs,
          FROM
          `moz-fx-data-marketing-prod.google_play_store.Installs_country_v1`
          WHERE
          Date >= '2021-04-01'
          AND Package_name IN ('org.mozilla.firefox_beta')
          GROUP BY 1, 2
      ),
      -- The set of play store countries is much smaller than the entire set of countries that we may
      -- be interested in. We'll limit last seen buckets to these values.
      play_store_countries as (
          select distinct country from play_store_retained
      ),
      last_seen as (
          select
              first_seen_date as submission_date,
              coalesce(play_store_countries.country, "OTHER") as country,
              count(distinct client_id) as n_first_seen,
              count(distinct case when coalesce(BIT_COUNT(days_seen_bits), 0) >= 5 then client_id end) as n_activated
          from `moz-fx-data-shared-prod.org_mozilla_firefox_beta_derived.baseline_clients_last_seen_v1`
          -- limit countries to those in the play store
          left join play_store_countries
          using (country)
          where date_sub(submission_date, interval 7 day) = first_seen_date
          -- NOTE: we need to filter on the primary partition key since pushdown doesn't happen in this context...
          and submission_date > "2021-04-01"
          group by 1, 2
      )
      select
          submission_date,
          country,
          sum(unique_visitor_count) as unique_visitor_count,
          sum(first_time_installs) as first_time_installs,
          sum(device_installs) as device_installs,
          sum(user_installs) as user_installs,
          sum(n_first_seen) as n_first_seen,
          sum(n_activated) as n_activated
      from play_store_retained
      right join play_store_installs
      using (submission_date, country)
      right join last_seen
      using (submission_date, country)
      where submission_date > "2021-04-01"
      group by 1, 2
      order by 1, 2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: unique_visitor_count {
    type: number
    sql: ${TABLE}.unique_visitor_count ;;
  }

  dimension: first_time_installs {
    type: number
    sql: ${TABLE}.first_time_installs ;;
  }

  dimension: device_installs {
    type: number
    sql: ${TABLE}.device_installs ;;
  }

  dimension: user_installs {
    type: number
    sql: ${TABLE}.user_installs ;;
  }

  dimension: n_first_seen {
    type: number
    sql: ${TABLE}.n_first_seen ;;
  }

  dimension: n_activated {
    type: number
    sql: ${TABLE}.n_activated ;;
  }

  set: detail {
    fields: [
      submission_date,
      country,
      unique_visitor_count,
      first_time_installs,
      device_installs,
      user_installs,
      n_first_seen,
      n_activated
    ]
  }
}
