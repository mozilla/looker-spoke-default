view: funnel_ios {

  derived_table: {
    sql: WITH views_data AS (
          SELECT
            date,
            territory AS country_name,
            SUM(impressions_unique_device) AS views
          FROM
            `mozdata.analysis.firefox_app_store_territory_source_type_report`
          WHERE
            date >= '2022-01-01'
          GROUP BY 1, 2
        ), downloads_data AS (
          SELECT
            date,
            territory AS country_name,
            SUM(total_downloads) AS downloads
          FROM
            `mozdata.analysis.firefox_app_store_downloads_territory_source_type_report`
          WHERE
            date >= '2022-01-01'
            AND source_type <> 'Institutional Purchase'
          GROUP BY 1, 2
        ), top AS (
          SELECT
            DATE(date) as date,
            code AS country,
            views,
            downloads
          FROM views_data
          JOIN downloads_data USING (date, country_name)
          JOIN `moz-fx-data-shared-prod.static.country_codes_v1` ON country_name = name
        ), bottom AS (
          SELECT
            first_seen_date AS date,
            country,
            SUM(new_profile) as new_profiles,
            SUM(activated) as activations
          FROM `moz-fx-data-shared-prod.firefox_ios.new_profile_activation`
          WHERE submission_date >= '2022-01-01'
          AND first_seen_date >= '2022-01-01'
          AND NOT (app_display_version = '107.2' AND submission_date >= '2023-02-01') -- incident filter
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
    description: "Unique daily impressions, counted when a customer views the app on the Today, Games, Apps, or Search tabs on the App Store, or on the product page"
    type: sum
    sql: ${TABLE}.views ;;
  }

  measure: downloads {
    description: "Total downloads, including first-time downloads and redownloads"
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
