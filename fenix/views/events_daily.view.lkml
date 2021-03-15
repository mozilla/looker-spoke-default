view: events_daily {
  sql_table_name: `mozdata.org_mozilla_firefox.events_daily` ;;

  dimension: android_sdk_version {
    sql: ${TABLE}.android_sdk_version ;;
    type: string
  }

  dimension: app_build {
    sql: ${TABLE}.app_build ;;
    type: string
  }

  dimension: app_channel {
    sql: ${TABLE}.app_channel ;;
    type: string
  }

  dimension: app_display_version {
    sql: ${TABLE}.app_display_version ;;
    type: string
  }

  dimension: architecture {
    sql: ${TABLE}.architecture ;;
    type: string
  }

  dimension: channel {
    sql: ${TABLE}.channel ;;
    type: string
  }

  dimension: city {
    sql: ${TABLE}.city ;;
    type: string
  }

  dimension: client_id {
    hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: country {
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    type: string
  }

  dimension: device_manufacturer {
    sql: ${TABLE}.device_manufacturer ;;
    type: string
  }

  dimension: device_model {
    sql: ${TABLE}.device_model ;;
    type: string
  }

  dimension: events {
    sql: ${TABLE}.events ;;
    type: string
  }

  dimension: experiments {
    hidden: yes
    sql: ${TABLE}.experiments ;;
  }

  dimension: first_run_date {
    sql: ${TABLE}.first_run_date ;;
    type: string
  }

  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
  }

  dimension: os {
    sql: ${TABLE}.os ;;
    type: string
  }

  dimension: os_version {
    sql: ${TABLE}.os_version ;;
    type: string
  }

  dimension: sample_id {
    sql: ${TABLE}.sample_id ;;
    type: number
  }

  dimension: subdivision1 {
    sql: ${TABLE}.subdivision1 ;;
    type: string
  }

  dimension: telemetry_sdk_build {
    sql: ${TABLE}.telemetry_sdk_build ;;
    type: string
  }

  dimension_group: submission {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  measure: clients {
    sql: COUNT(DISTINCT client_id) ;;
    type: number
  }

  measure: ping_count {
    type: count
  }
}