view: app_store_choice_screen_engagement_pre_ios_18_2 {

  dimension_group: date {
    sql: ${TABLE}.date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: app_name {
    sql: ${TABLE}.app_name ;;
    type: string
  }

  dimension: app_apple_identifier {
    sql: ${TABLE}.app_apple_identifier ;;
    type: number
  }

  dimension: territory {
    sql: ${TABLE}.territory ;;
    type: string
  }

  dimension: device {
    sql: ${TABLE}.device ;;
    type: string
  }

  dimension: platform_version {
    sql: ${TABLE}.platform_version ;;
    type: string
  }

  dimension: event {
    sql: ${TABLE}.event ;;
    type: string
  }

  measure: counts {
    sql: ${TABLE}.counts ;;
    type: sum
  }

  measure: unique_devices {
    sql: ${TABLE}.unique_devices ;;
    type: sum
  }

  sql_table_name: `moz-fx-data-shared-prod.firefox_ios.app_store_choice_screen_engagement` ;;
}
