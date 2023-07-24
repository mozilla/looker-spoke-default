view: app_store_territory_source_type_report {
  derived_table: {
    sql:
      SELECT
        date,
        territory,
        source_type,
        active_devices,
        active_devices_last_30_days,
        deletions,
        installations,
        sessions,
        first_time_downloads,
        redownloads,
        total_downloads,
        impressions,
        impressions_unique_device,
        page_views,
        page_views_unique_device
      FROM
        mozdata.app_store.firefox_app_store_territory_source_type_report
      FULL OUTER JOIN
        mozdata.app_store.firefox_downloads_territory_source_type_report
        USING (date, territory, source_type)
      FULL OUTER JOIN
        mozdata.app_store.firefox_usage_territory_source_type_report
        USING (date, territory, source_type) ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    description: "The date that the associated events took place on."
  }

  dimension: country {
    type: string
    sql: ${TABLE}.territory ;;
    description: "The country the events took place in."
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type ;;
    description: "The source type of the install, i.e. how the user ended up on the app landing page. Examples include 'App Store Search' and 'Web Referrer'."
  }

  measure: active_devices {
    group_label: "App Metrics"
    type: sum
    sql: ${TABLE}.active_devices ;;
    description: "WARNING: Opt-in only. The number of devices with at least one session during the selected period."
  }

  measure: active_devices_last_30_days {
    group_label: "App Metrics"
    type: sum
    sql: ${TABLE}.active_devices_last_30_days ;;
    description: "WARNING: Opt-in only. The number of active devices with at least one session during the previous 30 days."
  }

  measure: deletions {
    group_label: "App Metrics"
    type: sum
    sql: ${TABLE}.deletions ;;
    description: "WARNING: Opt-in only. The number of times Firefox was deleted on devices running iOS 12.3 or later."
  }

  measure: installations {
    group_label: "App Metrics"
    type: sum
    sql: ${TABLE}.installations ;;
    description: "WARNING: Opt-in only. The total number of times Firefox has been installed on devices with iOS 8 or later. Re-installs are included."
  }

  measure: sessions {
    group_label: "App Metrics"
    type: sum
    sql: ${TABLE}.sessions ;;
    description: "WARNING: Opt-in only. The number of times Firefox has been used for at least two seconds"
  }

  measure: first_time_downloads {
    group_label: "Download Metrics"
    type: sum
    sql: ${TABLE}.first_time_downloads ;;
    description: "The total number of first time downloads."
  }

  measure: redownloads {
    group_label: "Download Metrics"
    type: sum
    sql: ${TABLE}.redownloads ;;
    description: "The total number of redownloads."
  }

  measure: total_downloads {
    group_label: "Download Metrics"
    type: sum
    sql: ${TABLE}.total_downloads ;;
    description: "The total number of Firefox downloads, including first time & redownloads."
  }

  measure: impressions {
    group_label: "App Store Listing Metrics"
    type: sum
    sql: ${TABLE}.impressions ;;
    description: "The number of times the app listing was viewed on the Today, Games, Apps, and Search tabs of the App Store. Includes Product Page Views."
  }

  measure: impressions_unique_device {
    group_label: "App Store Listing Metrics"
    type: sum
    sql: ${TABLE}.impressions_unique_device ;;
    description: "The number of unique devices that have viewed the app on the Today, Games, Apps, and Search tabs of the App Store. Includes Unique Product Page views."
  }

  measure: page_views {
    group_label: "App Store Listing Metrics"
    type: sum
    sql: ${TABLE}.page_views ;;
    description: "The total number of times the App Store product page was viewed."
  }

  measure: page_views_unique_device {
    group_label: "App Store Listing Metrics"
    type: sum
    sql: ${TABLE}.page_views_unique_device ;;
    description: "The number of unique devices that have viewed the App Store product page."
  }

}
