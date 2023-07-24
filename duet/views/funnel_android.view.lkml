view: funnel_android {

  derived_table: {
    sql: WITH top AS (
          SELECT
            date,
            Country_region AS country,
            SUM(Store_listing_visitors) AS views,
            SUM(Store_listing_acquisitions) AS downloads
          FROM
            `moz-fx-data-marketing-prod.google_play_store.Store_Performance_country_v1`
          WHERE
            Package_name = 'org.mozilla.firefox'
            AND date >= '2022-01-01'
          GROUP BY 1, 2
        ), bottom AS (
          SELECT
            c.first_seen_date AS date,
            first_reported_country AS country,
            COUNT(1) AS new_profiles,
            SUM(a.activated) AS activations
          FROM
            `mozdata.fenix.firefox_android_clients` c
          INNER JOIN
            `moz-fx-data-shared-prod.fenix.new_profile_activation` a
          USING
            (client_id)
          WHERE
            c.first_seen_date >= '2022-01-01'
            AND a.submission_date >= '2022-01-01'
            AND install_source = 'com.android.vending'
          GROUP BY 1, 2
        )
        SELECT date, country, views, downloads, new_profiles, activations
        FROM top
        JOIN bottom USING (date, country)
  ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: date {
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
    convert_tz: no
  }

  measure: views {
    description: "The number of users that visited the app listing who didn't already have the app installed on any of their devices"
    type: sum
    sql: ${TABLE}.views ;;
  }

  measure: downloads {
    description: "The number of users that visited your Store Listing and installed your app, who did not have your app installed on any device"
    type: sum
    sql: ${TABLE}.downloads ;;
  }

  measure: new_profiles {
    description: "Unique Client IDs, usually generated when the app is opened for the first time"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: activations {
    description: "Early indicator for LTV based on days of app open and searches on the first week"
    type: sum
    sql: ${TABLE}.activations ;;
  }


  measure: view_ctr {
    label: "View Click Through Rate"
    type: number
    value_format_name: percent_2
    sql: ${downloads}/ NULLIF(${views},0) ;;
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${activations}/ NULLIF(${new_profiles},0) ;;
  }

}
