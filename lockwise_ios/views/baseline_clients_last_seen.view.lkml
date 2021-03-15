view: baseline_clients_last_seen {
  sql_table_name: `mozdata.org_mozilla_ios_lockbox.baseline_clients_last_seen` ;;

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

  dimension: days_created_profile_bits {
    sql: ${TABLE}.days_created_profile_bits ;;
    type: number
  }

  dimension: days_seen_bits {
    sql: ${TABLE}.days_seen_bits ;;
    type: number
  }

  dimension: days_seen_session_end_bits {
    sql: ${TABLE}.days_seen_session_end_bits ;;
    type: number
  }

  dimension: days_seen_session_start_bits {
    sql: ${TABLE}.days_seen_session_start_bits ;;
    type: number
  }

  dimension: days_since_created_profile {
    sql: ${TABLE}.days_since_created_profile ;;
    type: number
  }

  dimension: days_since_seen {
    sql: ${TABLE}.days_since_seen ;;
    type: number
  }

  dimension: days_since_seen_session_end {
    sql: ${TABLE}.days_since_seen_session_end ;;
    type: number
  }

  dimension: days_since_seen_session_start {
    sql: ${TABLE}.days_since_seen_session_start ;;
    type: number
  }

  dimension: device_manufacturer {
    sql: ${TABLE}.device_manufacturer ;;
    type: string
  }

  dimension: device_model {
    sql: ${TABLE}.device_model ;;
    type: string
  }

  dimension: durations {
    sql: ${TABLE}.durations ;;
    type: number
  }

  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
  }

  dimension: normalized_channel {
    sql: ${TABLE}.normalized_channel ;;
    type: string
  }

  dimension: normalized_os {
    sql: ${TABLE}.normalized_os ;;
    type: string
  }

  dimension: normalized_os_version {
    sql: ${TABLE}.normalized_os_version ;;
    type: string
  }

  dimension: sample_id {
    sql: ${TABLE}.sample_id ;;
    type: number
  }

  dimension: telemetry_sdk_build {
    sql: ${TABLE}.telemetry_sdk_build ;;
    type: string
  }

  dimension_group: first_run {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_run_date ;;
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