include: "//looker-hub/bigeye/views/issues.view.lkml"

view: +issues {
  dimension: events {
    hidden: yes
  }
  dimension: ack_snooze_seconds {
    hidden: yes
  }
  dimension: acked_time_seconds {
    hidden: yes
  }
  dimension: first_metric_run_status {
    hidden: yes
  }
  dimension: priority_score {
    hidden: yes
  }
  dimension: earliest_alerting_point_time_seconds {
    hidden: yes
  }
  dimension: alert_count {
    hidden: yes
  }
  dimension: notification_channels {
    hidden: yes
  }
  dimension: current_closing_feedback {
    hidden: yes
  }
  dimension: workspace_id {
    hidden: yes
  }
  dimension: alerting_metrics {
    hidden: yes
  }
  dimension: issue_resolution_steps {
    hidden: yes
  }
  dimension: alerting_metrics_with_label {
    hidden: yes
  }
  dimension: metric_configuration_filters {
    hidden: yes
  }
  dimension: metric_configuration_group_bys {
    hidden: yes
  }
  dimension: metric_configuration_thresholds {
    hidden: yes
  }
  dimension: metric_configuration_notification_channels {
    hidden: yes
  }
  dimension: metric_configuration_metric_type_predefined_metric_metric_name {
    hidden: yes
  }
  dimension: metric_configuration_metric_type_is_metadata_metric {
    hidden: yes
  }
  dimension: metric_configuration_metric_type_is_table_metric {
    hidden: yes
  }
  dimension: metric_configuration_parameters {
    hidden: yes
  }
  dimension: metric_configuration_lookback_interval_type {
    hidden: yes
  }
  dimension: metric_configuration_lookback_interval_value {
    hidden: yes
  }
  dimension: metric_configuration_lookback_type {
    hidden: yes
  }
  dimension: metric_configuration_metric_creation_state {
    hidden: yes
  }
  dimension: metric_configuration_grain_seconds {
    hidden: yes
  }
  dimension: metric_configuration_description {
    hidden: yes
  }
  dimension: metric_configuration_is_table_metric {
    hidden: yes
  }
  dimension: metric_configuration_metric_group_overrides {
    hidden: yes
  }
  dimension: metric_configuration_metric_schedule_named_schedule_id {
    hidden: yes
  }
  dimension: metric_configuration_metric_schedule_named_schedule_name {
    hidden: yes
  }
  dimension: metric_configuration_metric_schedule_named_schedule_cron {
    hidden: yes
  }
  dimension: metric_configuration_rct_override {
    hidden: yes
  }
  dimension: metric_configuration_is_lookback_using_current_time {
    hidden: yes
  }
  dimension: metric_metadata_statistic_name {
    hidden: yes
  }
  dimension: metric_metadata_statistic_full_name {
    hidden: yes
  }
  dimension: metric_metadata_field_id {
    hidden: yes
  }
  dimension: metric_metadata_field_name {
    hidden: yes
  }
  dimension: opened_time_seconds {
    type: date
    sql:
      CASE
        WHEN ${TABLE}.opened_time_seconds IS NOT NULL
        THEN DATE(TIMESTAMP_SECONDS(CAST(${TABLE}.opened_time_seconds AS INT64)))
      END ;;
  }
  dimension: closed_time_second {
    type: date
    sql:
      CASE
        WHEN ${TABLE}.closed_time_second IS NOT NULL
        THEN DATE(TIMESTAMP_SECONDS(CAST(${TABLE}.closed_time_second AS INT64)))
      END ;;
  }
  dimension: time_to_ack_seconds {
    type: date
    sql:
      CASE
        WHEN ${TABLE}.time_to_ack_seconds IS NOT NULL
        THEN DATE(TIMESTAMP_SECONDS(CAST(${TABLE}.time_to_ack_seconds AS INT64)))
      END ;;
  }
  dimension: time_to_resolve_seconds {
    type: date
    sql:
      CASE
        WHEN ${TABLE}.time_to_resolve_seconds IS NOT NULL
        THEN DATE(TIMESTAMP_SECONDS(CAST(${TABLE}.time_to_resolve_seconds AS INT64)))
      END ;;
  }
  measure: count {
    type: count
  }
}
