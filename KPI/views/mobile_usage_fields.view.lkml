view: mobile_usage_fields {
  derived_table: {
    sql:
      SELECT
        * EXCEPT(app_name, canonical_app_name),
        CASE WHEN app_name IN ('fennec', 'fenix') THEN 'fennec_fenix' ELSE app_name END AS app_name,
        CASE WHEN canonical_app_name IN ('Firefox for Android (Fennec)', 'Firefox for Android (Fenix)') THEN 'Firefox for Android (Fennec + Fenix)' ELSE canonical_app_name END AS canonical_app_name
      FROM `mozdata.telemetry.mobile_usage_2021`
      WHERE app_name IN ('firefox_ios', 'fennec', 'fenix', 'focus_android', 'focus_ios');;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: canonical_app_name {
    type: string
    sql: ${TABLE}.canonical_app_name ;;
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

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: wau {
    type: sum
    sql: ${TABLE}.wau ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: cdou {
    type: sum
    sql: ${TABLE}.cdou ;;
  }

  measure: mau {
    type: sum
    sql: ${TABLE}.mau ;;
  }

}
