view: session_end {
  sql_table_name: `mozdata.org_mozilla_vrbrowser.session_end` ;;

  dimension: additional_properties {
    sql: ${TABLE}.additional_properties ;;
    type: string
  }

  dimension: client_info__android_sdk_version {
    group_item_label: "Android Sdk Version"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.android_sdk_version ;;
    type: string
  }

  dimension: client_info__app_build {
    group_item_label: "App Build"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.app_build ;;
    type: string
  }

  dimension: client_info__app_channel {
    group_item_label: "App Channel"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.app_channel ;;
    type: string
  }

  dimension: client_info__app_display_version {
    group_item_label: "App Display Version"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.app_display_version ;;
    type: string
  }

  dimension: client_info__architecture {
    group_item_label: "Architecture"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.architecture ;;
    type: string
  }

  dimension: client_info__client_id {
    hidden: yes
    sql: ${TABLE}.client_info.client_id ;;
  }

  dimension: client_info__device_manufacturer {
    group_item_label: "Device Manufacturer"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.device_manufacturer ;;
    type: string
  }

  dimension: client_info__device_model {
    group_item_label: "Device Model"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.device_model ;;
    type: string
  }

  dimension: client_info__first_run_date {
    group_item_label: "First Run Date"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.first_run_date ;;
    type: string
  }

  dimension: client_info__locale {
    group_item_label: "Locale"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.locale ;;
    type: string
  }

  dimension: client_info__os {
    group_item_label: "Os"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.os ;;
    type: string
  }

  dimension: client_info__os_version {
    group_item_label: "Os Version"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.os_version ;;
    type: string
  }

  dimension: client_info__telemetry_sdk_build {
    group_item_label: "Telemetry Sdk Build"
    group_label: "Client Info"
    sql: ${TABLE}.client_info.telemetry_sdk_build ;;
    type: string
  }

  dimension: document_id {
    hidden: yes
    sql: ${TABLE}.document_id ;;
  }

  dimension: events {
    hidden: yes
    sql: ${TABLE}.events ;;
  }

  dimension: metadata__geo__city {
    group_item_label: "City"
    group_label: "Metadata Geo"
    sql: ${TABLE}.metadata.geo.city ;;
    type: string
  }

  dimension: metadata__geo__country {
    group_item_label: "Country"
    group_label: "Metadata Geo"
    map_layer_name: countries
    sql: ${TABLE}.metadata.geo.country ;;
    type: string
  }

  dimension: metadata__geo__db_version {
    group_item_label: "Db Version"
    group_label: "Metadata Geo"
    sql: ${TABLE}.metadata.geo.db_version ;;
    type: string
  }

  dimension: metadata__geo__subdivision1 {
    group_item_label: "Subdivision1"
    group_label: "Metadata Geo"
    sql: ${TABLE}.metadata.geo.subdivision1 ;;
    type: string
  }

  dimension: metadata__geo__subdivision2 {
    group_item_label: "Subdivision2"
    group_label: "Metadata Geo"
    sql: ${TABLE}.metadata.geo.subdivision2 ;;
    type: string
  }

  dimension: metadata__header__date {
    group_item_label: "Date"
    group_label: "Metadata Header"
    sql: ${TABLE}.metadata.header.date ;;
    type: string
  }

  dimension: metadata__header__dnt {
    group_item_label: "Dnt"
    group_label: "Metadata Header"
    sql: ${TABLE}.metadata.header.dnt ;;
    type: string
  }

  dimension: metadata__header__parsed_x_source_tags {
    hidden: yes
    sql: ${TABLE}.metadata.header.parsed_x_source_tags ;;
  }

  dimension: metadata__header__x_debug_id {
    group_item_label: "X Debug Id"
    group_label: "Metadata Header"
    sql: ${TABLE}.metadata.header.x_debug_id ;;
    type: string
  }

  dimension: metadata__header__x_pingsender_version {
    group_item_label: "X Pingsender Version"
    group_label: "Metadata Header"
    sql: ${TABLE}.metadata.header.x_pingsender_version ;;
    type: string
  }

  dimension: metadata__header__x_source_tags {
    group_item_label: "X Source Tags"
    group_label: "Metadata Header"
    sql: ${TABLE}.metadata.header.x_source_tags ;;
    type: string
  }

  dimension: metadata__isp__db_version {
    group_item_label: "Db Version"
    group_label: "Metadata Isp"
    sql: ${TABLE}.metadata.isp.db_version ;;
    type: string
  }

  dimension: metadata__isp__name {
    group_item_label: "Name"
    group_label: "Metadata Isp"
    sql: ${TABLE}.metadata.isp.name ;;
    type: string
  }

  dimension: metadata__isp__organization {
    group_item_label: "Organization"
    group_label: "Metadata Isp"
    sql: ${TABLE}.metadata.isp.organization ;;
    type: string
  }

  dimension: metadata__user_agent__browser {
    group_item_label: "Browser"
    group_label: "Metadata User Agent"
    sql: ${TABLE}.metadata.user_agent.browser ;;
    type: string
  }

  dimension: metadata__user_agent__os {
    group_item_label: "Os"
    group_label: "Metadata User Agent"
    sql: ${TABLE}.metadata.user_agent.os ;;
    type: string
  }

  dimension: metadata__user_agent__version {
    group_item_label: "Version"
    group_label: "Metadata User Agent"
    sql: ${TABLE}.metadata.user_agent.version ;;
    type: string
  }

  dimension: metrics__counter__control_open_new_window {
    group_item_label: "Control Open New Window"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.control_open_new_window ;;
    type: number
  }

  dimension: metrics__counter__tabs_activated {
    group_item_label: "Tabs Activated"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.tabs_activated ;;
    type: number
  }

  dimension: metrics__counter__url_domains {
    group_item_label: "Url Domains"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.url_domains ;;
    type: number
  }

  dimension: metrics__counter__url_visits {
    group_item_label: "Url Visits"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.url_visits ;;
    type: number
  }

  dimension: metrics__counter__windows_movement {
    group_item_label: "Windows Movement"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.windows_movement ;;
    type: number
  }

  dimension: metrics__counter__windows_resize {
    group_item_label: "Windows Resize"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.windows_resize ;;
    type: number
  }

  dimension: metrics__jwe {
    hidden: yes
    sql: ${TABLE}.metrics.jwe ;;
  }

  dimension: metrics__labeled_counter__glean_error_invalid_label {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_label ;;
  }

  dimension: metrics__labeled_counter__glean_error_invalid_overflow {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_overflow ;;
  }

  dimension: metrics__labeled_counter__glean_error_invalid_state {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_state ;;
  }

  dimension: metrics__labeled_counter__glean_error_invalid_value {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_value ;;
  }

  dimension: metrics__labeled_counter__tabs_opened {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_opened ;;
  }

  dimension: metrics__labeled_counter__windows_opened_pri_window_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.windows_opened_pri_window_count ;;
  }

  dimension: metrics__labeled_counter__windows_opened_window_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.windows_opened_window_count ;;
  }

  dimension: metrics__labeled_rate {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_rate ;;
  }

  dimension: metrics__string__distribution_channel_name {
    group_item_label: "Distribution Channel Name"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.distribution_channel_name ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_active_in_front_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Active In Front Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_front_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_front_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Active In Front Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_front_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_active_in_front_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Active In Front Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_front_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_front_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_front_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_active_in_front_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Active In Front Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_front_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_front_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Active In Front Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_front_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_active_in_front_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Active In Front Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_front_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_front_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_front_time.values ;;
  }

  dimension: metrics__timing_distribution__windows_active_in_left_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Active In Left Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_left_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_left_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Active In Left Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_left_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_active_in_left_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Active In Left Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_left_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_left_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_left_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_active_in_left_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Active In Left Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_left_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_left_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Active In Left Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_left_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_active_in_left_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Active In Left Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_left_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_left_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_left_time.values ;;
  }

  dimension: metrics__timing_distribution__windows_active_in_right_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Active In Right Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_right_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_right_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Active In Right Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_right_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_active_in_right_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Active In Right Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_right_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_right_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_right_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_active_in_right_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Active In Right Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_right_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_right_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Active In Right Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_right_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_active_in_right_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Active In Right Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_right_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_active_in_right_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_active_in_right_time.values ;;
  }

  dimension: metrics__timing_distribution__windows_double_pri_window_opened_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Double Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_pri_window_opened_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_double_pri_window_opened_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Double Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_pri_window_opened_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_double_pri_window_opened_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Double Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_pri_window_opened_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_double_pri_window_opened_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_double_pri_window_opened_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_double_pri_window_opened_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Double Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_pri_window_opened_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_double_pri_window_opened_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Double Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_pri_window_opened_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_double_pri_window_opened_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Double Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_pri_window_opened_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_double_pri_window_opened_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_double_pri_window_opened_time.values ;;
  }

  dimension: metrics__timing_distribution__windows_double_window_opened_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Double Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_window_opened_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_double_window_opened_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Double Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_window_opened_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_double_window_opened_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Double Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_window_opened_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_double_window_opened_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_double_window_opened_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_double_window_opened_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Double Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_window_opened_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_double_window_opened_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Double Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_window_opened_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_double_window_opened_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Double Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_double_window_opened_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_double_window_opened_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_double_window_opened_time.values ;;
  }

  dimension: metrics__timing_distribution__windows_single_pri_window_opened_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Single Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_pri_window_opened_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_single_pri_window_opened_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Single Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_pri_window_opened_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_single_pri_window_opened_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Single Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_pri_window_opened_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_single_pri_window_opened_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_single_pri_window_opened_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_single_pri_window_opened_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Single Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_pri_window_opened_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_single_pri_window_opened_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Single Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_pri_window_opened_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_single_pri_window_opened_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Single Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_pri_window_opened_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_single_pri_window_opened_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_single_pri_window_opened_time.values ;;
  }

  dimension: metrics__timing_distribution__windows_single_window_opened_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Single Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_window_opened_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_single_window_opened_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Single Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_window_opened_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_single_window_opened_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Single Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_window_opened_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_single_window_opened_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_single_window_opened_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_single_window_opened_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Single Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_window_opened_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_single_window_opened_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Single Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_window_opened_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_single_window_opened_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Single Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_single_window_opened_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_single_window_opened_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_single_window_opened_time.values ;;
  }

  dimension: metrics__timing_distribution__windows_triple_pri_window_opened_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Triple Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_pri_window_opened_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_triple_pri_window_opened_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Triple Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_pri_window_opened_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_triple_pri_window_opened_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Triple Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_pri_window_opened_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_triple_pri_window_opened_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_pri_window_opened_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_triple_pri_window_opened_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Triple Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_pri_window_opened_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_triple_pri_window_opened_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Triple Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_pri_window_opened_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_triple_pri_window_opened_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Triple Pri Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_pri_window_opened_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_triple_pri_window_opened_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_pri_window_opened_time.values ;;
  }

  dimension: metrics__timing_distribution__windows_triple_window_opened_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Windows Triple Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_window_opened_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_triple_window_opened_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Windows Triple Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_window_opened_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_triple_window_opened_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Windows Triple Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_window_opened_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_triple_window_opened_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_window_opened_time.range ;;
  }

  dimension: metrics__timing_distribution__windows_triple_window_opened_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Windows Triple Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_window_opened_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_triple_window_opened_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Windows Triple Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_window_opened_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__windows_triple_window_opened_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Windows Triple Window Opened Time"
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_window_opened_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__windows_triple_window_opened_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.windows_triple_window_opened_time.values ;;
  }

  dimension: normalized_app_name {
    sql: ${TABLE}.normalized_app_name ;;
    type: string
  }

  dimension: normalized_channel {
    sql: ${TABLE}.normalized_channel ;;
    type: string
  }

  dimension: normalized_country_code {
    sql: ${TABLE}.normalized_country_code ;;
    type: string
  }

  dimension: normalized_os {
    sql: ${TABLE}.normalized_os ;;
    type: string
  }

  dimension: normalized_os_version {
    sql: ${TABLE}.normalized_os_version ;;
    type: string
  }

  dimension: ping_info__end_time {
    group_item_label: "End Time"
    group_label: "Ping Info"
    sql: ${TABLE}.ping_info.end_time ;;
    type: string
  }

  dimension: ping_info__experiments {
    hidden: yes
    sql: ${TABLE}.ping_info.experiments ;;
  }

  dimension: ping_info__ping_type {
    group_item_label: "Ping Type"
    group_label: "Ping Info"
    sql: ${TABLE}.ping_info.ping_type ;;
    type: string
  }

  dimension: ping_info__reason {
    group_item_label: "Reason"
    group_label: "Ping Info"
    sql: ${TABLE}.ping_info.reason ;;
    type: string
  }

  dimension: ping_info__seq {
    group_item_label: "Seq"
    group_label: "Ping Info"
    sql: ${TABLE}.ping_info.seq ;;
    type: number
  }

  dimension: ping_info__start_time {
    group_item_label: "Start Time"
    group_label: "Ping Info"
    sql: ${TABLE}.ping_info.start_time ;;
    type: string
  }

  dimension: sample_id {
    sql: ${TABLE}.sample_id ;;
    type: number
  }

  dimension_group: metadata__header__parsed_date {
    group_item_label: "Parsed Date"
    group_label: "Metadata Header"
    sql: ${TABLE}.metadata.header.parsed_date ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: ping_info__parsed_end {
    group_item_label: "Parsed End Time"
    group_label: "Ping Info"
    sql: ${TABLE}.ping_info.parsed_end_time ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: ping_info__parsed_start {
    group_item_label: "Parsed Start Time"
    group_label: "Ping Info"
    sql: ${TABLE}.ping_info.parsed_start_time ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_timestamp ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  measure: clients {
    sql: COUNT(DISTINCT client_info.client_id) ;;
    type: number
  }

  measure: ping_count {
    type: count
  }
}