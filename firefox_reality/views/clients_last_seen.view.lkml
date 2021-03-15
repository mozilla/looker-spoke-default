view: clients_last_seen {
  sql_table_name: `mozdata.org_mozilla_vrbrowser.clients_last_seen` ;;

  dimension: app_build {
    sql: ${TABLE}.app_build ;;
    type: string
  }

  dimension: app_display_version {
    sql: ${TABLE}.app_display_version ;;
    type: string
  }

  dimension: app_name {
    sql: ${TABLE}.app_name ;;
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

  dimension: days_since_created_profile {
    sql: ${TABLE}.days_since_created_profile ;;
    type: number
  }

  dimension: days_since_seen {
    sql: ${TABLE}.days_since_seen ;;
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

  dimension: distribution_channel_name {
    sql: ${TABLE}.distribution_channel_name ;;
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

  dimension_group: date_last_seen {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_last_seen ;;
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