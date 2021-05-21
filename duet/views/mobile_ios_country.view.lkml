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
            INTERVAL {% parameter.history_days %} * ({% parameter.period_offset %} + 1) - 1  day
          ) AS start_date,
          date_sub(latest_date,
            INTERVAL {% parameter.history_days %} * {% parameter.period_offset %} day
          ) AS end_date
        FROM
          last_updated
      ),
      apple_storefront_metrics
      AS
        (
          SELECT
            date,
            app_name,
            CASE
            WHEN
              storefront LIKE '%St.%'
            THEN
              REPLACE(storefront, 'St.', 'Saint')
            WHEN
              storefront = 'China mainland'
            THEN
              'China'
            WHEN
              storefront = 'Russia'
            THEN
              'Russian Federation'
            WHEN
              storefront = 'Tanzania'
            THEN
              'Tanzania, United Republic of'
            WHEN
              storefront = 'North Macedonia'
            THEN
              'Macedonia, the Former Yugoslav Republic of'
            WHEN
              storefront = 'São Tomé and Príncipe'
            THEN
              'Sao Tome and Principe'
            WHEN
              storefront = 'Micronesia'
            THEN
              'Micronesia, Federated States of'
            WHEN
              storefront = 'Moldova'
            THEN
              'Moldova, Republic of'
            WHEN
              storefront = 'Venezuela'
            THEN
              'Venezuela, Bolivarian Republic of'
            WHEN
              storefront = 'Taiwan'
            THEN
              'Taiwan, Province of China'
            WHEN
              storefront = 'British Virgin Islands'
            THEN
              'Virgin Islands, British'
            WHEN
              storefront = 'Brunei'
            THEN
              'Brunei Darussalam'
            WHEN
              storefront = 'Congo, Democratic Republic of the'
            THEN
              'Congo, the Democratic Republic of the'
            WHEN
              storefront = 'Congo, Republic of the'
            THEN
              'Congo'
            WHEN
              storefront = 'Bolivia'
            THEN
              'Bolivia, Plurinational State of'
            WHEN
              storefront = 'Vietnam'
            THEN
              'Viet Nam'
            WHEN
              storefront = "Cote d'Ivoire"
            THEN
              "Côte d'Ivoire"
            ELSE
              storefront
            END
            AS name,
            product_page_views,
            app_units AS first_time_installs,
            installations_opt_in
          FROM
            `moz-fx-data-marketing-prod.apple_app_store.metrics_by_storefront`
          CROSS JOIN
            period
          WHERE
            date
            BETWEEN start_date
            AND end_date
            AND app_name IN (
              {% if app_id._parameter_value == "firefox" %} "Firefox"
              {% elsif app_id._parameter_value == "focus" %} "Focus"
              {% elsif app_id._parameter_value == "klar" %} "Klar"
              {% endif %}
            )
        ),
        apple_country_metrics AS (
          SELECT
            date AS submission_date,
            app_name,
           -- Macau, Eswatini, Laos
            CASE
            WHEN
              name = 'Macau'
            THEN
              'MO'
            WHEN
              name = 'Eswatini'
            THEN
              'SZ'
            WHEN
              name = 'Laos'
            THEN
              'LA'
            ELSE
              code
            END
            AS country,
            product_page_views,
            first_time_installs,
            installations_opt_in
          FROM
            apple_storefront_metrics
          LEFT JOIN
            `mozdata.static.country_codes_v1`
          USING
            (name)
        ),
        apple_countries AS (
          SELECT DISTINCT
            country
          FROM
            apple_country_metrics
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
            `moz-fx-data-shared-prod.org_mozilla_ios_{% parameter.app_id %}.baseline_clients_last_seen`
          LEFT JOIN
            apple_countries
          USING
            (country)
          CROSS JOIN
            period
          WHERE
            submission_date
              BETWEEN date_sub(current_date(), INTERVAL {% parameter.history_days %}*({% parameter.period_offset %} + 1) + 7 day)
              AND date_sub(current_date(), INTERVAL {% parameter.history_days %}*{% parameter.period_offset %} day)
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
        apple_country_metrics
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

  parameter: app_id {
    description: "The name of the application in the `org.mozilla` namespace."
    type:  unquoted
    default_value: "firefox"
    allowed_value: {
      value: "firefox"
    }
    allowed_value: {
      value: "focus"
    }
    allowed_value: {
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
    hidden: yes
    suggest_explore: country_buckets
    suggest_dimension: country_buckets.bucket
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
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: ios_store_updated {
    type: date
    datatype: date
    sql: ${TABLE}.ios_store_updated ;;
  }

  dimension: latest_date {
    type: date
    datatype: date
    sql: ${TABLE}.latest_date ;;
  }

  measure: product_page_views {
    type: sum
    sql: ${TABLE}.product_page_views ;;
  }

  measure: first_time_installs {
    type: sum
    sql: ${TABLE}.first_time_installs ;;
  }

  measure: installations_opt_in {
    type: sum
    sql: ${TABLE}.installations_opt_in ;;
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
