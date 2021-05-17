view: mobile_android_store {
  sql_table_name: `moz-fx-data-marketing-prod.google_play_store.Retained_installers_play_country_v1`
    ;;

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: installer_to_15_days_retention_rate {
    type: number
    sql: ${TABLE}.Installer_to_15_days_retention_rate ;;
  }

  dimension: installer_to_1_day_retention_rate {
    type: number
    sql: ${TABLE}.Installer_to_1_day_retention_rate ;;
  }

  dimension: installer_to_30_days_retention_rate {
    type: number
    sql: ${TABLE}.Installer_to_30_days_retention_rate ;;
  }

  dimension: installer_to_7_days_retention_rate {
    type: number
    sql: ${TABLE}.Installer_to_7_days_retention_rate ;;
  }

  dimension: installers {
    type: number
    sql: ${TABLE}.Installers ;;
  }

  dimension: installers_retained_for_15_days {
    type: number
    sql: ${TABLE}.Installers_retained_for_15_days ;;
  }

  dimension: installers_retained_for_1_day {
    type: number
    sql: ${TABLE}.Installers_retained_for_1_day ;;
  }

  dimension: installers_retained_for_30_days {
    type: number
    sql: ${TABLE}.Installers_retained_for_30_days ;;
  }

  dimension: installers_retained_for_7_days {
    type: number
    sql: ${TABLE}.Installers_retained_for_7_days ;;
  }

  dimension: median_visitor_to_installer_conversion_rate_benchmark {
    type: number
    sql: ${TABLE}.Median_Visitor_to_Installer_conversion_rate_benchmark ;;
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.Package_Name ;;
  }

  dimension: store_listing_visitors {
    type: number
    sql: ${TABLE}.Store_Listing_Visitors ;;
  }

  dimension: visitor_to_installer_conversion_rate {
    type: number
    sql: ${TABLE}.Visitor_to_Installer_conversion_rate ;;
  }

  measure: count {
    type: count
    drill_fields: [package_name]
  }
}
