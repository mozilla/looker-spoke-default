
view: mobile_android_country {
  derived_table: {
    sql: with last_updated as (
      -- this table has rows that lag ~7 days plus/minus several days
      select distinct
        _LATEST_DATE as play_store_updated,
        -- We need a full week to see activated client; ignore the current day of partial data
        if(
          _LATEST_DATE < date_sub(current_date(), interval 7+1 day),
          _LATEST_DATE,
          date_sub(current_date(), interval 7+1 day)
        ) as latest_date
      from `moz-fx-data-marketing-prod.google_play_store.Installs_country_v1`
      where Date >= date_sub(current_date(), interval 28 day)
    ),
    period as (
      select
        play_store_updated,
        latest_date,
        date_sub(latest_date,
          interval {% parameter history_days %} * ({% parameter period_offset %} + 1) - 1  day
        ) as start_date,
        date_sub(latest_date,
          interval {% parameter history_days %} * {% parameter period_offset %} day
        ) as end_date
      from last_updated
    ),
      play_store_performance as (
        SELECT
          Date AS submission_date,
          COALESCE(IF(Country_region = "Other", NULL, Country_region), "OTHER") AS country,
            sum(Store_listing_visitors) as first_time_visitor_count,
            sum(Store_listing_acquisitions) as first_time_installs,
        FROM
          `moz-fx-data-marketing-prod.google_play_store.Store_Performance_country_v1`
        CROSS JOIN
          period
        WHERE
          Date BETWEEN start_date AND end_date
          AND Package_name IN ('org.mozilla.{% parameter app_id %}')
        GROUP BY
          1, 2
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
          CROSS JOIN
            period
          WHERE
            Date between start_date and end_date
          AND Package_name IN ('org.mozilla.{% parameter app_id %}')
          GROUP BY 1, 2
      ),
      -- The set of play store countries is much smaller than the entire set of countries that we may
      -- be interested in. We'll limit last seen buckets to these values.
      play_store_countries as (
          select distinct country from play_store_installs
      ),
      last_seen as (
          select
              first_seen_date as submission_date,
              coalesce(play_store_countries.country, "OTHER") as country,
              count(distinct client_id) as first_seen,
              count(distinct case when coalesce(BIT_COUNT(days_seen_bits), 0) >= 5 then client_id end) as activated
          from
            {% if "firefox firefox_beta fenix" contains app_id._parameter_value %}
                `moz-fx-data-shared-prod.org_mozilla_{% parameter app_id %}_derived.baseline_clients_last_seen_v1`
            {% elsif "focus klar" contains app_id._parameter_value %}
                `moz-fx-data-shared-prod.telemetry.core_clients_last_seen`
            {% endif %}
          -- limit countries to those in the play store
          left join play_store_countries
          using (country)
          CROSS JOIN
            period
          WHERE
            -- NOTE: we need to filter on the primary partition key since pushdown doesn't happen in this context.
            -- We'll overshoot the amount of time we need to filter by 3 days, in case the latest day is behind by
            -- more than a week. The number of days chosen is abitrary, the margin for fuzzing could be smaller.
            submission_date
              between date_sub(current_date(), interval {% parameter history_days %}*({% parameter period_offset %}+1) + 7 + 3 day)
              and date_sub(current_date(), interval {% parameter history_days %}*{% parameter period_offset %} day)
            and first_seen_date between start_date and end_date
            and date_sub(submission_date, interval 7 day) = first_seen_date
            {% if app_id._parameter_value == "focus" %} and app_name = "Focus" and os = "Android"
            {% elsif app_id._parameter_value == "klar" %} and app_name = "Klar" and os = "Android"
            {% endif %}
          group by 1, 2
      )
      select
          submission_date,
          country,
          max(play_store_updated) as play_store_updated,
          max(latest_date) as latest_date,
          -- NOTE: DS-1666 values from the defunct user acquisition tables
          sum(first_time_visitor_count) as first_time_visitor_count,
          sum(first_time_installs) as first_time_installs,
          sum(device_installs) as device_installs,
          sum(user_installs) as user_installs,
          sum(event_installs) as event_installs,
          sum(first_seen) as first_seen,
          sum(activated) as activated
      from play_store_installs
      full join play_store_performance
      using (submission_date, country)
      full join last_seen
      using (submission_date, country)
      cross join period
      where submission_date between start_date and end_date
      group by 1, 2
      order by 1, 2
       ;;
  }

  # Allow swapping between various applications in the dataset
  parameter: app_id {
    description: "The name of the application in the `org.mozilla` namespace."
    type:  unquoted
    default_value: "fenix"
    allowed_value: {
      label: "Firefox Release"
      value: "firefox"
    }
    allowed_value: {
      label: "Firefox Beta"
      value: "firefox_beta"
    }
    allowed_value: {
      label: "Firefox Nightly"
      value:  "fenix"
    }
    allowed_value: {
      label: "Focus"
      value: "focus"
    }
    allowed_value: {
      label: "Klar (Focus)"
      value: "klar"
    }
  }

  # Choose how far back in history to look
  parameter: history_days {
    description: "The number of days to include in the aggregation period."
    type:  number
    default_value: "7"
    allowed_value: {
      value: "1"
    }
    allowed_value: {
      value: "7"
    }
    allowed_value: {
      value: "28"
    }
    allowed_value: {
      value: "84"
    }
  }

  parameter: period_offset {
    description: "An offset into the aggregation period, used to calculate percent difference since last period."
    type: number
    default_value: "0"
    allowed_value: {
      value: "0"
    }
    allowed_value: {
      value: "1"
    }
  }

  dimension: bucket {
    description: "The geographical bucket that the lies under. Do not combine with country unless this is set to overall."
    type: "string"
    suggest_explore: country_buckets
    suggest_dimension: country_buckets.bucket
  }

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores."
    sql: TRUE ;;
  }


  dimension_group: submission {
    description: "The submission date of the data."
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

  dimension: play_store_updated {
    description: "The submission date of the last play store update."
    type: date
    datatype: date
    sql: ${TABLE}.play_store_updated ;;
  }

  dimension: latest_date {
    description: "The latest full day of data used for aggregates."
    type: date
    datatype: date
    sql: ${TABLE}.latest_date ;;
  }

  dimension: country {
    description: "The country code of the aggregates. The set is limited by those reported in the play store."
    type: string
    sql: ${TABLE}.country ;;
  }

  measure: first_time_visitor_count {
    description: "The number of first time visitors to the play store."
    type: sum
    sql: ${TABLE}.first_time_visitor_count ;;
  }

  measure: first_time_installs {
    description: "The number of first time installs reported by the play store."
    type: sum
    sql: ${TABLE}.first_time_installs ;;
  }

  measure: device_installs {
    description: "The number of installs by device reported by the play store."
    type: sum
    sql: ${TABLE}.device_installs ;;
  }

  measure: user_installs {
    description: "The number of installs by user reported by the play store."
    type: sum
    sql: ${TABLE}.user_installs ;;
  }

  measure: event_installs {
    description: "The number of install events reported by the play store."
    type: sum
    sql: ${TABLE}.event_installs ;;
  }

  measure: first_seen {
    description: "The number of client ids seen for the first time in the baseline clients last seen table."
    type: sum
    sql: ${TABLE}.first_seen ;;
  }

  measure: activated {
    description: "The number of clients that have used the app for 5/7 days."
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
