view: firefox_desktop_usage_2021 {
  sql_table_name: `mozdata.telemetry.firefox_desktop_usage_2021`
    ;;

  dimension: activity_segment {
    type: string
    sql: ${TABLE}.activity_segment ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: content {
    type: string
    sql: ${TABLE}.content ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: distribution_id {
    type: string
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: id_bucket {
    type: number
    sql: ${TABLE}.id_bucket ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: ${TABLE}.submission_date ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: mau {
    type: sum
    sql: ${TABLE}.mau ;;
  }

  measure: new_profiles {
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_cumulative {
    type: running_total
    sql: ${new_profiles} ;;
  }

  measure: cdou {
    type: sum
    sql: ${TABLE}.cdou ;;
  }

  measure: wau {
    type: sum
    sql: ${TABLE}.wau ;;
  }

}
