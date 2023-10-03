
view: ios_privacy_metrics {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.metrics`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2021-01-01'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(metrics.quantity.tabs_private_tabs_quantity), 0) AS tabs_private_tabs_quantity,
          COALESCE(SUM(CASE WHEN metrics.boolean.preferences_close_private_tabs THEN 1 ELSE 0 END), 0) AS preferences_close_private_tabs,
          COALESCE(SUM(CASE WHEN metrics.boolean.tracking_protection_enabled THEN 1 ELSE 0 END), 0) AS tracking_protection_enabled,
          COALESCE(SUM(CASE WHEN metrics.string.tracking_protection_strength = 'strict' THEN 1 ELSE 0 END), 0) AS tracking_protection_strict

          FROM `mozdata.firefox_ios.metrics`
      where DATE(submission_timestamp) >= '2021-01-01'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --tabs_private_tabs_quantity
          100*COUNT(DISTINCT CASE WHEN tabs_private_tabs_quantity > 0 THEN client_id END) AS tabs_private_tabs_quantity_users,
          100*COALESCE(SUM(tabs_private_tabs_quantity), 0) AS tabs_private_tabs_quantity,
          -- Preferences Close Private Tabs
          100*COUNT(DISTINCT CASE WHEN preferences_close_private_tabs > 0 THEN client_id END) AS preferences_close_private_tabs_users,
          100*COALESCE(SUM(preferences_close_private_tabs), 0) AS preferences_close_private_tabs,

          -- Tracking Protection Enabled
          100*COUNT(DISTINCT CASE WHEN tracking_protection_enabled > 0 THEN client_id END) AS tracking_protection_enabled_users,
          100*COALESCE(SUM(tracking_protection_enabled), 0) AS tracking_protection_enabled,

          -- Tracking Protection Strict
          100*COUNT(DISTINCT CASE WHEN tracking_protection_strict > 0 THEN client_id END) AS tracking_protection_strict_users,
          100*COALESCE(SUM(tracking_protection_strict), 0) AS tracking_protection_strict

          FROM product_features
      where submission_date >= '2021-01-01'
      group by 1)


      select submission_date,
      dau,
      tabs_private_tabs_quantity_users,
      tabs_private_tabs_quantity,
      preferences_close_private_tabs_users,
      preferences_close_private_tabs,
      tracking_protection_enabled_users,
      tracking_protection_enabled,
      tracking_protection_strict_users,
      tracking_protection_strict
      from dau_segments
      JOIN product_features_agg
      USING (submission_date) ;;
  }



  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: tabs_private_tabs_quantity_users {
    type: sum
    sql: ${TABLE}.tabs_private_tabs_quantity_users ;;
  }

  measure: tabs_private_tabs_quantity {
    type: sum
    sql: ${TABLE}.tabs_private_tabs_quantity ;;
  }

  measure: preferences_close_private_tabs_users {
    type: sum
    sql: ${TABLE}.preferences_close_private_tabs_users ;;
  }

  measure: preferences_close_private_tabs {
    type: sum
    sql: ${TABLE}.preferences_close_private_tabs ;;
  }

  measure: tracking_protection_enabled_users {
    type: sum
    sql: ${TABLE}.tracking_protection_enabled_users ;;
  }

  measure: tracking_protection_enabled {
    type: sum
    sql: ${TABLE}.tracking_protection_enabled ;;
  }

  measure: tracking_protection_strict_users {
    type: sum
    sql: ${TABLE}.tracking_protection_strict_users ;;
  }

  measure: tracking_protection_strict {
    type: sum
    sql: ${TABLE}.tracking_protection_strict ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      tabs_private_tabs_quantity_users,
      tabs_private_tabs_quantity,
      preferences_close_private_tabs_users,
      preferences_close_private_tabs,
      tracking_protection_enabled_users,
      tracking_protection_enabled,
      tracking_protection_strict_users,
      tracking_protection_strict
    ]
  }
}
