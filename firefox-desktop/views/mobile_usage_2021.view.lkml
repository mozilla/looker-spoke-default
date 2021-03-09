view: mobile_usage_2021 {
  sql_table_name: `mozdata.telemetry.mobile_usage_2021`
    ;;

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: canonical_app_name {
    type: string
    sql: ${TABLE}.canonical_app_name ;;
  }

  measure: cdou {
    type: number
    sql: ${TABLE}.cdou ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  measure: dau {
    type: number
    sql: ${TABLE}.dau ;;
  }

  dimension: distribution_id {
    type: string
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: id_bucket {
    type: number
    sql: ${TABLE}.id_bucket ;;
  }

  measure: mau {
    type: number
    sql: ${TABLE}.mau ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension_group: submission {
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
    sql: ${TABLE}.submission_date ;;
  }

  measure: wau {
    type: number
    sql: ${TABLE}.wau ;;
  }

}
