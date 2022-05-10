view: firefox_desktop_usage_fields {
  sql_table_name: mozdata.telemetry.firefox_desktop_usage_2021 ;;

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

  dimension: country_name {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country_name ;;
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

  dimension: attributed {
    type: yesno
    sql: ${TABLE}.attributed ;;
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP) ;;
  }
}
