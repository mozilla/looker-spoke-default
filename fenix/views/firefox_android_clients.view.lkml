include: "//looker-hub/fenix/views/firefox_android_clients.view.lkml"

view: +firefox_android_clients {
  final: yes
  label: "Client profile along with their original attributes."

  dimension: client_id {
    primary_key: yes
  }

  dimension: adjust_ad_group {
    group_label: "Adjust Attribution"
    group_item_label: "Adjust Adgroup"
  }

  dimension: adjust_campaign {
    group_label: "Adjust Attribution"
    group_item_label: "Adjust Campaign"
  }

  dimension: adjust_creative {
    group_label: "Adjust Attribution"
    group_item_label: "Adjust Creative"
  }

  dimension: adjust_network {
    group_label: "Adjust Attribution"
    group_item_label: "Adjust Network"
  }

  dimension: play_store_attribution_campaign {
    group_label: "Play Store Attribution"
    group_item_label: "Play Store Campaign"
  }

  dimension: play_store_attribution_content {
    group_label: "Play Store Attribution"
    group_item_label: "Play Store Content"
  }

  dimension: play_store_attribution_install_referrer_response {
    group_label: "Play Store Attribution"
    group_item_label: "Play Store Install Referrer"
  }

  dimension: play_store_attribution_medium {
    group_label: "Play Store Attribution"
    group_item_label: "Play Store Medium"
  }

  dimension: play_store_attribution_source {
    group_label: "Play Store Attribution"
    group_item_label: "Play Store Source"
  }

  dimension: play_store_attribution_term {
    group_label: "Play Store Attribution"
    group_item_label: "Play Store Term"
  }

  dimension: device_manufacturer {
    group_label: "Device Info"
    group_item_label: "Device Manufacturer"
  }

  dimension: device_model {
    group_label: "Device Info"
    group_item_label: "Device Model"
  }

  dimension: os_version {
    group_label: "Device Info"
    group_item_label: "Device OS Version"
  }

  dimension: app_version {
    group_label: "App Info"
    group_item_label: "App Version"
  }

  dimension: channel {
    group_label: "App Info"
    group_item_label: "App Channel"
  }

  dimension_group: submission {
    hidden: yes
  }

  dimension: last_reported_adjust_ad_group {
    hidden: yes
  }

  dimension: last_reported_adjust_campaign {
    hidden: yes
  }

  dimension: last_reported_adjust_creative {
    hidden: yes
  }

  dimension: last_reported_adjust_network {
    hidden: yes
  }

  dimension: last_reported_channel {
    hidden: yes
  }

  dimension: last_reported_country {
    hidden: yes
  }

  dimension: last_reported_device_manufacturer {
    hidden: yes
  }

  dimension: last_reported_device_model {
    hidden: yes
  }

  dimension: last_reported_locale {
    hidden: yes
  }

  dimension: metadata__adjust_network__source_ping {
    hidden: yes
  }

  dimension: metadata__install_source__source_ping {
    hidden: yes
  }

  dimension: metadata__reported_baseline_ping {
    hidden: yes
  }

  dimension: metadata__reported_first_session_ping {
    hidden: yes
  }

  dimension: metadata__reported_metrics_ping {
    hidden: yes
  }

  dimension_group: first_run {
    hidden: yes
  }

  dimension_group: last_reported {
    hidden: yes
  }

  dimension_group: metadata__adjust_network__source_ping_datetime {
    hidden: yes
  }

  dimension_group: metadata__install_source__source_ping_datetime {
    hidden: yes
  }

  dimension_group: metadata__min_first_session_ping_run {
    hidden: yes
  }

  dimension_group: metadata__min_first_session_ping_submission {
    hidden: yes
  }

  dimension_group: metadata__min_metrics_ping_submission {
    hidden: yes
  }

  dimension_group: metadata__play_store_attribution_campaign__ping_datetime {
    hidden: yes
  }

  dimension_group: metadata__play_store_attribution_content__ping_datetime {
    hidden: yes
  }

  dimension_group: metadata__play_store_attribution_install_referrer_response__ping_datetime {
    hidden: yes
  }

  dimension_group: metadata__play_store_attribution_medium__ping_datetime {
    hidden: yes
  }

  dimension_group: metadata__play_store_attribution_source__ping_datetime {
    hidden: yes
  }

  dimension_group: metadata__play_store_attribution_term__ping_datetime {
    hidden: yes
  }

  measure: client_count {
    type: count_distinct
    sql: ${TABLE}.client_id ;;
    description: "Count of clients."
  }
}
