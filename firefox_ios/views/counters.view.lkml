view: counters {
  derived_table: {
    sql:
    SELECT
        client_info.client_id,
        CAST(DATE(submission_timestamp) AS TIMESTAMP) AS submission_date,
        key,
        SUM(
          {% if metric._parameter_value contains "labeled_counter" %}
            mozfun.map.get_key(metrics.{% parameter metric %}, key)
          {% else %}
            metrics.{% parameter metric %}
          {% endif %}
        ) AS client_aggregate,
        mozfun.stats.mode_last(ARRAY_AGG(normalized_app_name)) AS normalized_app_name,
        mozfun.stats.mode_last(ARRAY_AGG(normalized_channel)) AS normalized_channel,
        mozfun.stats.mode_last(ARRAY_AGG(normalized_country_code)) AS normalized_country_code,
        mozfun.stats.mode_last(ARRAY_AGG(normalized_os)) AS normalized_os,
        mozfun.stats.mode_last(ARRAY_AGG(normalized_os_version)) AS normalized_os_version,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.android_sdk_version)) AS android_sdk_version,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.app_build)) AS app_build,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.app_channel)) AS app_channel,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.app_display_version)) AS app_display_version,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.architecture)) AS architecture,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.device_manufacturer)) AS device_manufacturer,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.device_model)) AS device_model,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.locale)) AS locale,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.os)) AS os,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.os_version)) AS os_version,
        mozfun.stats.mode_last(ARRAY_AGG(client_info.telemetry_sdk_build)) AS telemetry_sdk_build,
        mozfun.stats.mode_last(ARRAY_AGG(metadata.geo.city)) AS city,
        mozfun.stats.mode_last(ARRAY_AGG(metadata.geo.country)) AS country,
        mozfun.stats.mode_last(ARRAY_AGG(metadata.geo.subdivision1)) AS subdivision1,
        mozfun.stats.mode_last(ARRAY_AGG(metadata.geo.subdivision2)) AS subdivision2,
    FROM
        `moz-fx-data-shared-prod`.org_mozilla_ios_firefox.metrics m
        CROSS JOIN UNNEST({% if metric._parameter_value contains "labeled_counter" %}
                            ARRAY(
                               SELECT DISTINCT AS STRUCT key
                               FROM `moz-fx-data-shared-prod`.org_mozilla_ios_firefox.metrics m
                               CROSS JOIN UNNEST(metrics.{% parameter metric %})
                               WHERE DATE(submission_timestamp) >= DATE_SUB(current_date, INTERVAL 3 DAY))
                          {% else %}
                            [STRUCT(NULL as key)]
                          {% endif %})
    WHERE
        DATE(submission_timestamp) >= '2019-01-01'
    GROUP BY
        client_id,
        key,
        submission_date;;
  }

  parameter: metric {
    default_value: ""
    type: unquoted
    suggest_explore: metrics_counters
    suggest_dimension: metrics_counters.metric_name
  }


  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: client_aggregate {
    sql: ${TABLE}.client_aggregate ;;
  }

  dimension: normalized_app_name {
    type: string
    sql: ${TABLE}.normalized_app_name ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.normalized_app_name
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.normalized_channel
  }

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.normalized_country_code
  }

  dimension: normalized_os {
    type: string
    sql: ${TABLE}.normalized_os ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.normalized_os
  }

  dimension: normalized_os_version {
    type: string
    sql: ${TABLE}.normalized_os_version ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.normalized_os_version
  }

  dimension: android_sdk_version {
    type: string
    sql: ${TABLE}.android_sdk_version ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.android_sdk_version
  }

  dimension: app_build {
    type: string
    sql: ${TABLE}.app_build ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.app_build
  }

  dimension: app_channel {
    type: string
    sql: ${TABLE}.app_channel ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.app_channel
  }

  dimension: app_display_version {
    hidden: yes
    type: string
    sql: ${TABLE}.app_display_version ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.app_display_version
  }

  dimension: app_display_major_version {
    type: number
    sql: mozfun.norm.truncate_version(${app_display_version}, "major") ;;
  }

  dimension: app_display_major_minor_version {
    type: number
    sql: mozfun.norm.truncate_version(${app_display_version}, "minor") ;;
  }

  dimension: architecture {
    type: string
    sql: ${TABLE}.architecture ;;
    suggest_explore: metrics
    suggest_dimension: metrics.architecture
  }

  dimension: device_manufacturer {
    type: string
    sql: ${TABLE}.device_manufacturer ;;
    suggest_explore: metrics
    suggest_dimension: metrics.device_manufacturer
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
    suggest_explore: metrics
    suggest_dimension: metrics.device_model
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.locale
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.os
  }

  dimension: os_version {
    hidden: yes
    type: string
    sql: ${TABLE}.os_version ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.os_version
  }

  dimension: os_major_version {
    type: number
    sql: mozfun.norm.truncate_version(${os_version}, "major") ;;
  }

  dimension: os_major_minor_version {
    type: number
    sql: mozfun.norm.truncate_version(${os_version}, "minor") ;;
  }

  dimension: telemetry_sdk_build {
    type: string
    sql: ${TABLE}.telemetry_sdk_build ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.telemetry_sdk_build
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.city
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.country
  }

  dimension: subdivision1 {
    type: string
    sql: ${TABLE}.subdivision1 ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.subdivision1
  }

  dimension: subdivision2 {
    type: string
    sql: ${TABLE}.subdivision2 ;;
    suggest_explore: metrics_sample
    suggest_dimension: metrics_sample.subdivision2
  }

  measure: user_count {
    sql: COUNTIF(${client_aggregate} > 0) ;;
    type: number
  }

  measure: total_count {
    sql: SUM(${client_aggregate}) ;;
    type: number
  }

  measure: fraction_of_users {
    sql: SAFE_DIVIDE(COUNTIF(${client_aggregate} > 0), COUNT(*)) ;;
    type: number
  }

  measure: total_users_overall {
    sql: COUNT(*) ;;
    type: number
  }
}
