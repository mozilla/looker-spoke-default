include: "//looker-hub/bigeye_derived/views/metrics.view.lkml"

view: +metrics {
  dimension: latest_metric_runs {
    hidden: yes
  }
  dimension: is_snoozed {
    hidden: yes
  }
  dimension: status {
    hidden: yes
  }
  dimension: group_count {
    hidden: yes
  }
  dimension: critical_group_count {
    hidden: yes
  }
  dimension: can_backfill {
    hidden: yes
  }
  dimension: collections {
    hidden: yes
  }
  dimension: no_value_group_count {
    hidden: yes
  }
  dimension: tags {
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
  dimension: metric_configuration_is_lookback_using_current_time {
    hidden: yes
  }
  dimension: metric_metadata_field_id {
    hidden: yes
  }
  dimension: metric_metadata_dataset_time_column_name {
    hidden: yes
  }
  dimension: metric_metadata_warehouse_name {
    hidden: yes
  }
  dimension: metric_metadata_schema_id {
    hidden: yes
  }
  dimension: metric_metadata_warehouse_id {
    hidden: yes
  }
  dimension: metric_metadata_dataset_id {
    hidden: yes
  }
  dimension: metric_metadata_companion_metrics {
    hidden: yes
  }
  dimension: metric_metadata_is_favorite {
    hidden: yes
  }
  dimension: metric_metadata_metric_history_begin_at {
    hidden: yes
  }
  dimension: metric_metadata_current_metric_status {
    hidden: yes
  }
  dimension: metric_metadata_workspace_id {
    hidden: yes
  }
  dimension: metric_metadata_metric_history_end_at {
    hidden: yes
  }
  dimension: metric_metadata_run_at {
    hidden: yes
  }
  dimension: active_issue_id {
    hidden: yes
  }
  dimension: active_issue_display_name {
    hidden: yes
  }
  dimension: reason_cannot_backfill {
    hidden: yes
  }
  dimension: metric_configuration_rct_override {
    hidden: yes
  }
  dimension: metric_configuration_schedule_frequency_interval_type {
    hidden: yes
  }
  dimension: metric_configuration_schedule_frequency_interval_value {
    hidden: yes
  }
  dimension: metric_configuration_metric_type_template_metric_template_id {
    hidden: yes
  }
  dimension: metric_configuration_metric_type_template_metric_aggregation_type {
    hidden: yes
  }
  dimension: metric_configuration_metric_type_template_metric_template_name {
    hidden: yes
  }
  dimension: metric_configuration_metric_schedule_schedule_frequency_interval_type {
    hidden: yes
  }
  dimension: metric_configuration_metric_schedule_schedule_frequency_interval_value {
    hidden: yes
  }
  dimension: metric_configuration_bigconfig_namespace {
    hidden: yes
  }
  dimension: refreshed_at {
    hidden: yes
  }
}
