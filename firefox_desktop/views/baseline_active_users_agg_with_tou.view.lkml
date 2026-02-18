include: "//looker-hub/firefox_desktop/views/baseline_active_users_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/terms_of_use_status_table.view.lkml"

view: baseline_active_users_agg_with_tou {
  derived_table: {
    sql:
      SELECT
        b.os_grouped,
        b.app_version,
        TIMESTAMP(b.submission_date) as submission_date,
        b.country,
        CASE
          WHEN b.country in ('US','CA','GB','DE','FR','ES','IT','BR','MX','IN','ID','CN','RU')
            THEN b.country
          ELSE 'ROW'
        END AS country_segmentation,
-- rebuild_2026_02_18

      /* Base DAU/WAU/MAU */
      COUNT(DISTINCT CASE WHEN b.is_dau THEN b.client_id END) AS daily_active_users,
      COUNT(DISTINCT CASE WHEN b.is_wau THEN b.client_id END) AS weekly_active_users,
      COUNT(DISTINCT CASE WHEN b.is_mau THEN b.client_id END) AS monthly_active_users,

      /* ToU DAU/WAU/MAU (requires join) */
      COUNT(DISTINCT CASE WHEN t.client_id IS NOT NULL AND b.is_dau THEN b.client_id END) AS tou_daily_active_users,
      COUNT(DISTINCT CASE WHEN t.client_id IS NOT NULL AND b.is_wau THEN b.client_id END) AS tou_weekly_active_users,
      COUNT(DISTINCT CASE WHEN t.client_id IS NOT NULL AND b.is_mau THEN b.client_id END) AS tou_monthly_active_users

      FROM ${baseline_active_users_table.SQL_TABLE_NAME} AS b
      LEFT JOIN ${terms_of_use_status_table.SQL_TABLE_NAME} AS t
      ON b.client_id = t.client_id
      AND DATE(b.submission_date) >= DATE(t.submission_date)
      WHERE b.is_desktop AND b.sample_id <= 19
      AND DATE(b.submission_date) >= DATE '2025-11-15'

      GROUP BY 1,2,3,4,5
      ;;
    datagroup_trigger: baseline_agg_daily_tou

    increment_key: "submission_date"
    increment_offset: 1
  }

  # Dimensions at the new grain
  dimension: os_grouped { sql: ${TABLE}.os_grouped ;; group_label: "OS" }
  dimension: app_version { sql: ${TABLE}.app_version ;; group_label: "App Version" }

  dimension_group: submission {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.submission_date ;;
  }

  dimension: country { sql: ${TABLE}.country ;; group_label: "Location" }
  dimension: country_segmentation { sql: ${TABLE}.country_segmentation ;; group_label: "Location" }

  # Measures become SUMs of the pre-aggregated columns
  measure: daily_active_users {
    label: "DAU"
    type: sum
    sql: ${TABLE}.daily_active_users ;;
  }

  measure: weekly_active_users {
    label: "WAU"
    type: sum
    sql: ${TABLE}.weekly_active_users ;;
  }

  measure: monthly_active_users {
    label: "MAU"
    type: sum
    sql: ${TABLE}.monthly_active_users ;;
  }

  measure: tou_daily_active_users {
    label: "ToU DAU"
    type: sum
    sql: ${TABLE}.tou_daily_active_users ;;
  }

  measure: tou_weekly_active_users {
    label: "ToU WAU"
    type: sum
    sql: ${TABLE}.tou_weekly_active_users ;;
  }

  measure: tou_monthly_active_users {
    label: "ToU MAU"
    type: sum
    sql: ${TABLE}.tou_monthly_active_users ;;
  }
}
