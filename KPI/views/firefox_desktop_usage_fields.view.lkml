view: firefox_desktop_usage_fields {
  derived_table: {
    sql:
      select
        u.* EXCEPT(country),
        COALESCE(n.name, u.country) as country
      from
        `mozdata.telemetry.firefox_desktop_usage_2021` u
      left join `moz-fx-data-shared-prod.static.country_codes_v1` n
        on u.country = n.code
    ;;
  }

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

  dimension: attributed {
    type: yesno
    sql: ${TABLE}.attributed ;;
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP) ;;
  }

  measure: dau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau ;;
  }

  measure: mau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.mau ;;
  }

  measure: new_profiles {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_cumulative {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.cumulative_new_profiles ;;
  }

  measure: cdou {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.cdou ;;
  }

}
