view: mobile_ios_country {
  derived_table: {
    sql: WITH last_updated AS (
        -- this table has rows that lag ~3 days plus/minus several days
        SELECT DISTINCT
          max(date) AS ios_store_updated,
          -- We need a full week to see activated client; ignore the current day of partial data
          date_sub(current_date(), INTERVAL 7 + 1 day) AS latest_date
        FROM
          `moz-fx-data-marketing-prod.apple_app_store.metrics_by_storefront`
        WHERE
          date >= date_sub(current_date(), INTERVAL 28 day)
      ),
      period AS (
        SELECT
          ios_store_updated,
          latest_date,
          date_sub(latest_date,
            INTERVAL {% parameter history_days %} * ({% parameter period_offset %} + 1) - 1  day
          ) AS start_date,
          date_sub(latest_date,
            INTERVAL {% parameter history_days %} * {% parameter period_offset %} day
          ) AS end_date
        FROM
          last_updated
      ),
      apple_storefront_metrics
      AS
        (
          SELECT
            date as submission_date,
            app_name,
            code as country,
            product_page_views,
            app_units AS first_time_installs,
            installations_opt_in
          FROM
            `moz-fx-data-marketing-prod.apple_app_store.metrics_by_storefront`
          LEFT JOIN
            `moz-fx-data-shared-prod.static.country_names_v1`
          ON
            storefront = name
          CROSS JOIN
            period
          WHERE
            date
            BETWEEN start_date
            AND end_date
            AND app_name IN (
              {% if app_name._parameter_value == "firefox" %} "Firefox"
              {% elsif app_name._parameter_value == "focus" %} "Focus"
              {% elsif app_name._parameter_value == "klar" %} "Klar"
              {% endif %}
            )
        ),
        apple_countries AS (
          SELECT DISTINCT
            country
          FROM
            apple_storefront_metrics
        ),
        last_seen AS (
          SELECT
            first_seen_date AS submission_date,
            coalesce(apple_countries.country, "OTHER") AS country,
            count(DISTINCT client_id) AS first_seen,
            count(
              DISTINCT
              CASE
              WHEN
                coalesce(BIT_COUNT(days_seen_bits), 0) >= 5
              THEN
                client_id
              END
            ) AS activated
          FROM
            `moz-fx-data-shared-prod.org_mozilla_ios_{% parameter app_name %}.baseline_clients_last_seen`
          LEFT JOIN
            apple_countries
          USING
            (country)
          CROSS JOIN
            period
          WHERE
            submission_date
              BETWEEN date_sub(current_date(), INTERVAL {% parameter history_days %}*({% parameter period_offset %} + 1) + 7 day)
              AND date_sub(current_date(), INTERVAL {% parameter history_days %}*{% parameter period_offset %} day)
            AND first_run_date
            BETWEEN start_date
            AND period.end_date
          GROUP BY
            1,
            2
        )
      SELECT
        submission_date,
        country,
        max(ios_store_updated) AS ios_store_updated,
        max(latest_date) AS latest_date,
        sum(product_page_views) AS product_page_views,
        sum(first_time_installs) AS first_time_installs,
        sum(installations_opt_in) AS installations_opt_in,
        sum(first_seen) AS first_seen,
        sum(activated) AS activated
      FROM
        apple_storefront_metrics
      JOIN
        last_seen
      USING
        (submission_date, country)
      CROSS JOIN
        period
      WHERE
        submission_date
        BETWEEN start_date
        AND end_date
      GROUP BY
        1,
        2
      ORDER BY
        1,
        2
       ;;
  }

  parameter: app_name {
    description: "The name of the application."
    type:  unquoted
    default_value: "firefox"
    allowed_value: {
      label: "Firefox for iOS"
      value: "firefox"
    }
    allowed_value: {
      label: "Focus for iOS"
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
    description: "The geographical bucket that the country lies under. Do not combine with country unless this is set to overall."
    type: "string"
    hidden: yes
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

  dimension: country {
    description: "The country code for the aggregates"
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: ios_store_updated {
    description: "The date of the last apple store import"
    type: date
    datatype: date
    sql: ${TABLE}.ios_store_updated ;;
  }

  dimension: latest_date {
    description: "The most recent submission date used for analysis"
    type: date
    datatype: date
    sql: ${TABLE}.latest_date ;;
  }

  measure: product_page_views {
    description: "The number of page visits to a particular apple storefront"
    type: sum
    sql: ${TABLE}.product_page_views ;;
  }

  measure: first_time_installs {
    description: "The number of first time installs reported by the apple store"
    type: sum
    sql: ${TABLE}.first_time_installs ;;
  }

  measure: installations_opt_in {
    description: "The number of opt-in first time runs reported by the apple store"
    type: sum
    sql: ${TABLE}.installations_opt_in ;;
  }

  measure: first_seen {
    description: "The number of client ids that sent a baseline ping (and accounted for at least 1 DOU)."
    type: sum
    sql: ${TABLE}.first_seen ;;
  }

  measure: activated {
    description: "The number of clients that have used the app for at least 5 of their first 7 days."
    type: sum
    sql: ${TABLE}.activated ;;
  }

  set: detail {
    fields: [
      submission_date,
      country,
      ios_store_updated,
      latest_date,
      product_page_views,
      first_time_installs,
      installations_opt_in,
      first_seen,
      activated
    ]
  }
}
