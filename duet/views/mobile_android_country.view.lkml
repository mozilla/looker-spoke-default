view: mobile_android_country {
  derived_table: {
    sql: with play_store_retained as (
          SELECT
          Date AS submission_date,
          COALESCE(IF(country = "Other", null, country), "OTHER") as country,
          MAX(_LATEST_DATE) as latest_date,
          SUM(Store_Listing_visitors) AS first_time_visitor_count,
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
          sum(Install_events) as event_installs,
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
              count(distinct client_id) as first_seen,
              count(distinct case when coalesce(BIT_COUNT(days_seen_bits), 0) >= 5 then client_id end) as activated
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
          max(latest_date) as latest_date,
          sum(first_time_visitor_count) as first_time_visitor_count,
          sum(first_time_installs) as first_time_installs,
          sum(device_installs) as device_installs,
          sum(user_installs) as user_installs,
          sum(first_seen) as first_seen,
          sum(activated) as activated
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

  dimension_group: submission {
    type: time
    datatype: date
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.submission_date ;;
  }

  dimension: latest_date {
    type: date
    datatype: date
    sql: ${TABLE}.latest_date ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  measure: first_time_visitor_count {
    type: sum
    sql: ${TABLE}.first_time_visitor_count ;;
  }

  measure: first_time_installs {
    type: sum
    sql: ${TABLE}.first_time_installs ;;
  }

  measure: device_installs {
    type: sum
    sql: ${TABLE}.device_installs ;;
  }

  measure: user_installs {
    type: sum
    sql: ${TABLE}.user_installs ;;
  }

  measure: event_installs {
    type: sum
    sql: ${TABLE}.event_installs ;;
  }


  measure: first_seen {
    type: sum
    sql: ${TABLE}.first_seen ;;
  }

  measure: activated {
    type: sum
    sql: ${TABLE}.activated ;;
  }

  set: detail {
    fields: [
      country,
      first_time_visitor_count,
      first_time_installs,
      device_installs,
      user_installs,
      first_seen,
      activated
    ]
  }
}
