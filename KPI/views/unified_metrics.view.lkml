view: unified_browser_metrics {
  sql_table_name: `mozdata.telemetry.unified_metrics`
    ;;

  dimension: activity_segment {
    type: string
    description: "See descriptions of user segments here: https://docs.telemetry.mozilla.org/concepts/segments.html#activity-segments-informal"
    sql: ${TABLE}.activity_segment ;;
  }

  dimension: app_display_version {
    type: string
    sql: ${TABLE}.app_display_version ;;
    description: "Browser Version"
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: days_seen_bits {
    type: number
    sql: ${TABLE}.days_seen_bits ;;
    description: "Contains a 28 Day History of Client Usage. See Documentation on Usage: https://docs.telemetry.mozilla.org/cookbooks/clients_last_seen_bits.html#udf-reference"
    link: {
      label: "Contains a 28 Day History of Client Usage. See Documentation on Usage"
      url: "https://docs.telemetry.mozilla.org/cookbooks/clients_last_seen_bits.html#udf-reference"
    }
  }

  dimension: active_today {
    type: yesno
    label: "Client Sent Ping Today"
    sql:  `mozfun`.bits28.active_in_range(${TABLE}.days_seen_bits, 0, 1) ;;
    description: "Did we recieve a ping from the client today?"
  }

  dimension: days_since_first_seen {
    type: number
    sql: ${TABLE}.days_since_first_seen ;;
    label: "Number of Days Since Client First Seen"
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
  }

  dimension_group: first_seen {
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
    sql: DATE(${TABLE}.first_seen_date) ;;
    label: "Date Client First Seen"
  }

  dimension: is_default_browser {
    type: yesno
    sql: ${TABLE}.is_default_browser ;;
  }

  dimension: is_new_profile {
    type: yesno
    sql: ${TABLE}.is_new_profile ;;
    description: "Is Yes on the day the profile is created"
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: normalized_app_name {
    type: string
    sql: ${TABLE}.normalized_app_name ;;
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: normalized_os {
    type: string
    sql: ${TABLE}.normalized_os ;;
  }

  dimension: sample_id {
    type: number
    sql: ${TABLE}.sample_id ;;
    description: " 0-99 Can be used to query a smaller random sample of data."
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
    sql: DATE(${TABLE}.submission_date) ;;
  }

  dimension: uri_count {
    type: number
    sql: ${TABLE}.uri_count ;;
    description: "Number of URIs loaded, includes refreshes"
  }

  dimension: platform {
    type: string
    sql: CASE WHEN ${TABLE}.normalized_app_name != 'Firefox Desktop' THEN 'Firefox Mobile' ELSE ${TABLE}.normalized_app_name END ;;
    label: "Platform (Firefox Desktop or Mobile)"
  }

  dimension: client_qualifies {
    type: yesno
    label: "Client Qualifies for 2022 KPI"
    sql: CASE WHEN ${TABLE}.normalized_app_name != 'Firefox Desktop' THEN TRUE
      WHEN ${TABLE}.normalized_app_name = 'Firefox Desktop' AND ${TABLE}.active_hours_sum > 0 AND ${TABLE}.uri_count > 0 THEN TRUE
      ELSE FALSE END ;;
  }

  measure: user_count {
    type: count
    drill_fields: [normalized_app_name]
  }

  measure: search_count {
    type: sum
    sql: ${TABLE}.search_count ;;
  }

  measure: search_with_ads {
    type: sum
    sql: ${TABLE}.search_with_ads ;;
    label: "Searches with Ads"
  }

  measure: ad_click {
    type: sum
    sql: ${TABLE}.ad_click ;;
    label: "Ad Clicks"
  }

  measure: organic_search_count {
    type: sum
    sql: ${TABLE}.organic_search_count ;;
  }

  measure: durations {
    type: sum
    sql: ${TABLE}.durations ;;
    label: "App Open Duration (From Baseline Ping - Mobile Only)"
  }

  measure: active_hours_sum {
    type: sum
    sql: ${TABLE}.active_hours_sum ;;
    label: "Active Hours (Desktop Only)"
  }
}

view: browser_kpis {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    increment_key: "submission_date"
    explore_source: unified_browser_metrics {
      filters: [unified_browser_metrics.active_today: "yes"]
      column: activity_segment {}
      column: app_display_version {}
      column: is_default_browser {}
      column: is_new_profile {}
      column: locale {}
      column: normalized_app_name {}
      column: normalized_os {}
      column: submission_date {}
      column: platform {}
      column: client_qualifies {}
      column: device_model {}
      column: user_count {}
    }
  }

  dimension: activity_segment {
    type: string
    sql: ${TABLE}.activity_segment ;;
    description: "See descriptions of user segments here: https://docs.telemetry.mozilla.org/concepts/segments.html#activity-segments-informal"
  }

  dimension: app_display_version {
    type: string
    sql: ${TABLE}.app_display_version ;;
    description: "Browser Version"
  }

  dimension: is_default_browser {
    type: yesno
    sql: ${TABLE}.is_default_browser ;;
  }

  dimension: is_new_profile {
    type: yesno
    sql: ${TABLE}.is_new_profile ;;
    description: "Is Yes on the day the profile is created"
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: normalized_app_name {
    type: string
    sql: ${TABLE}.normalized_app_name ;;
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: normalized_os {
    type: string
    sql: ${TABLE}.normalized_os ;;
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
    sql: DATE(${TABLE}.submission_date) ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
    label: "Platform (Firefox Desktop or Mobile)"
  }

  dimension: client_qualifies {
    type: yesno
    hidden: yes
    sql: ${TABLE}.client_qualifies ;;
    label: "Client Qualifies for 2022 KPI"
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
  }

  measure: user_count_qualified {
    type: sum
    sql: ${TABLE}.user_count ;;
    filters: [client_qualifies: "yes"]
    label: "User Count"
  }

 }
