include: "//looker-hub/fenix/views/firefox_android_clients.view.lkml"

view: +firefox_android_clients {
  final: yes
  label: "Client profile along with their original attributes."

  dimension: client_id {
    primary_key: yes
  }

  measure: client_count {
    type: count
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
}
