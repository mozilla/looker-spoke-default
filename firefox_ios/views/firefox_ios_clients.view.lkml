include: "//looker-hub/firefox_ios/views/firefox_ios_clients.view.lkml"

view: +firefox_ios_clients {
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

  dimension: is_suspicious_device_client {
    hidden: yes
  }

  dimension: metadata__adjust_info__source_ping {
    hidden: yes
  }

  dimension: metadata__is_reported_first_session_ping {
    hidden: yes
  }

  dimension: metadata__is_reported_metrics_ping {
    hidden: yes
  }

  measure: client_count {
    type: count_distinct
    sql: ${TABLE}.client_id ;;
    description: "Count of clients."
  }
}
