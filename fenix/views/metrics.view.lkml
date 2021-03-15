view: metrics {
  sql_table_name: `mozdata.org_mozilla_firefox.metrics` ;;

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

  dimension: metrics__boolean__addons_has_enabled_addons {
    group_item_label: "Addons Has Enabled Addons"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.addons_has_enabled_addons ;;
    type: yesno
  }

  dimension: metrics__boolean__addons_has_installed_addons {
    group_item_label: "Addons Has Installed Addons"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.addons_has_installed_addons ;;
    type: yesno
  }

  dimension: metrics__boolean__contextual_menu_long_press_tapped {
    group_item_label: "Contextual Menu Long Press Tapped"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.contextual_menu_long_press_tapped ;;
    type: yesno
  }

  dimension: metrics__boolean__gfx_status_headless {
    group_item_label: "Gfx Status Headless"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.gfx_status_headless ;;
    type: yesno
  }

  dimension: metrics__boolean__glean_core_migration_successful {
    group_item_label: "Glean Core Migration Successful"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.glean_core_migration_successful ;;
    type: yesno
  }

  dimension: metrics__boolean__glean_error_preinit_tasks_timeout {
    group_item_label: "Glean Error Preinit Tasks Timeout"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.glean_error_preinit_tasks_timeout ;;
    type: yesno
  }

  dimension: metrics__boolean__metrics_default_browser {
    group_item_label: "Metrics Default Browser"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.metrics_default_browser ;;
    type: yesno
  }

  dimension: metrics__boolean__metrics_has_desktop_bookmarks {
    group_item_label: "Metrics Has Desktop Bookmarks"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.metrics_has_desktop_bookmarks ;;
    type: yesno
  }

  dimension: metrics__boolean__metrics_has_mobile_bookmarks {
    group_item_label: "Metrics Has Mobile Bookmarks"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.metrics_has_mobile_bookmarks ;;
    type: yesno
  }

  dimension: metrics__boolean__metrics_has_open_tabs {
    group_item_label: "Metrics Has Open Tabs"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.metrics_has_open_tabs ;;
    type: yesno
  }

  dimension: metrics__boolean__metrics_has_recent_pwas {
    group_item_label: "Metrics Has Recent Pwas"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.metrics_has_recent_pwas ;;
    type: yesno
  }

  dimension: metrics__boolean__metrics_has_top_sites {
    group_item_label: "Metrics Has Top Sites"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.metrics_has_top_sites ;;
    type: yesno
  }

  dimension: metrics__boolean__metrics_search_widget_installed {
    group_item_label: "Metrics Search Widget Installed"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.metrics_search_widget_installed ;;
    type: yesno
  }

  dimension: metrics__counter__events_normal_and_private_uri_count {
    group_item_label: "Events Normal And Private Uri Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.events_normal_and_private_uri_count ;;
    type: number
  }

  dimension: metrics__counter__events_total_uri_count {
    group_item_label: "Events Total Uri Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.events_total_uri_count ;;
    type: number
  }

  dimension: metrics__counter__glean_error_io {
    group_item_label: "Glean Error Io"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.glean_error_io ;;
    type: number
  }

  dimension: metrics__counter__glean_error_preinit_tasks_overflow {
    group_item_label: "Glean Error Preinit Tasks Overflow"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.glean_error_preinit_tasks_overflow ;;
    type: number
  }

  dimension: metrics__counter__glean_upload_deleted_pings_after_quota_hit {
    group_item_label: "Glean Upload Deleted Pings After Quota Hit"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.glean_upload_deleted_pings_after_quota_hit ;;
    type: number
  }

  dimension: metrics__counter__glean_upload_pending_pings {
    group_item_label: "Glean Upload Pending Pings"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.glean_upload_pending_pings ;;
    type: number
  }

  dimension: metrics__counter__glean_validation_app_forceclosed_count {
    group_item_label: "Glean Validation App Forceclosed Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.glean_validation_app_forceclosed_count ;;
    type: number
  }

  dimension: metrics__counter__glean_validation_baseline_ping_count {
    group_item_label: "Glean Validation Baseline Ping Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.glean_validation_baseline_ping_count ;;
    type: number
  }

  dimension: metrics__counter__glean_validation_foreground_count {
    group_item_label: "Glean Validation Foreground Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.glean_validation_foreground_count ;;
    type: number
  }

  dimension: metrics__counter__logins_store_read_query_count {
    group_item_label: "Logins Store Read Query Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.logins_store_read_query_count ;;
    type: number
  }

  dimension: metrics__counter__logins_store_unlock_count {
    group_item_label: "Logins Store Unlock Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.logins_store_unlock_count ;;
    type: number
  }

  dimension: metrics__counter__logins_store_write_query_count {
    group_item_label: "Logins Store Write Query Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.logins_store_write_query_count ;;
    type: number
  }

  dimension: metrics__counter__metrics_desktop_bookmarks_count {
    group_item_label: "Metrics Desktop Bookmarks Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.metrics_desktop_bookmarks_count ;;
    type: number
  }

  dimension: metrics__counter__metrics_mobile_bookmarks_count {
    group_item_label: "Metrics Mobile Bookmarks Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.metrics_mobile_bookmarks_count ;;
    type: number
  }

  dimension: metrics__counter__metrics_recently_used_pwa_count {
    group_item_label: "Metrics Recently Used Pwa Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.metrics_recently_used_pwa_count ;;
    type: number
  }

  dimension: metrics__counter__metrics_tabs_open_count {
    group_item_label: "Metrics Tabs Open Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.metrics_tabs_open_count ;;
    type: number
  }

  dimension: metrics__counter__metrics_top_sites_count {
    group_item_label: "Metrics Top Sites Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.metrics_top_sites_count ;;
    type: number
  }

  dimension: metrics__counter__places_manager_read_query_count {
    group_item_label: "Places Manager Read Query Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.places_manager_read_query_count ;;
    type: number
  }

  dimension: metrics__counter__places_manager_write_query_count {
    group_item_label: "Places Manager Write Query Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.places_manager_write_query_count ;;
    type: number
  }

  dimension: metrics__custom_distribution__geckoview_document_site_origins__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Geckoview Document Site Origins"
    sql: ${TABLE}.metrics.custom_distribution.geckoview_document_site_origins.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__geckoview_document_site_origins__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.geckoview_document_site_origins.values ;;
  }

  dimension: metrics__custom_distribution__geckoview_per_document_site_origins__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Geckoview Per Document Site Origins"
    sql: ${TABLE}.metrics.custom_distribution.geckoview_per_document_site_origins.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__geckoview_per_document_site_origins__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.geckoview_per_document_site_origins.values ;;
  }

  dimension: metrics__custom_distribution__gfx_checkerboard_peak_pixel_count__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Gfx Checkerboard Peak Pixel Count"
    sql: ${TABLE}.metrics.custom_distribution.gfx_checkerboard_peak_pixel_count.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__gfx_checkerboard_peak_pixel_count__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.gfx_checkerboard_peak_pixel_count.values ;;
  }

  dimension: metrics__custom_distribution__gfx_checkerboard_severity__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Gfx Checkerboard Severity"
    sql: ${TABLE}.metrics.custom_distribution.gfx_checkerboard_severity.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__gfx_checkerboard_severity__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.gfx_checkerboard_severity.values ;;
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_from_paint__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Gfx Content Frame Time From Paint"
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_from_paint.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_from_paint__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_from_paint.values ;;
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_from_vsync__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Gfx Content Frame Time From Vsync"
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_from_vsync.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_from_vsync__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_from_vsync.values ;;
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_with_svg__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Gfx Content Frame Time With Svg"
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_with_svg.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_with_svg__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_with_svg.values ;;
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_without_resource_upload__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Gfx Content Frame Time Without Resource Upload"
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_without_resource_upload.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_without_resource_upload__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_without_resource_upload.values ;;
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_without_upload__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Gfx Content Frame Time Without Upload"
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_without_upload.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__gfx_content_frame_time_without_upload__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.gfx_content_frame_time_without_upload.values ;;
  }

  dimension: metrics__custom_distribution__js_baseline_compile_percentage__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Js Baseline Compile Percentage"
    sql: ${TABLE}.metrics.custom_distribution.js_baseline_compile_percentage.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__js_baseline_compile_percentage__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.js_baseline_compile_percentage.values ;;
  }

  dimension: metrics__custom_distribution__js_delazification_percentage__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Js Delazification Percentage"
    sql: ${TABLE}.metrics.custom_distribution.js_delazification_percentage.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__js_delazification_percentage__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.js_delazification_percentage.values ;;
  }

  dimension: metrics__custom_distribution__js_execution_percentage__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Js Execution Percentage"
    sql: ${TABLE}.metrics.custom_distribution.js_execution_percentage.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__js_execution_percentage__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.js_execution_percentage.values ;;
  }

  dimension: metrics__custom_distribution__js_xdr_encode_percentage__sum {
    group_item_label: "Sum"
    group_label: "Metrics Custom Distribution Js Xdr Encode Percentage"
    sql: ${TABLE}.metrics.custom_distribution.js_xdr_encode_percentage.sum ;;
    type: number
  }

  dimension: metrics__custom_distribution__js_xdr_encode_percentage__values {
    hidden: yes
    sql: ${TABLE}.metrics.custom_distribution.js_xdr_encode_percentage.values ;;
  }

  dimension: metrics__datetime__glean_validation_first_run_hour {
    group_item_label: "Glean Validation First Run Hour"
    group_label: "Metrics Datetime"
    sql: ${TABLE}.metrics.datetime.glean_validation_first_run_hour ;;
    type: string
  }

  dimension: metrics__jwe {
    hidden: yes
    sql: ${TABLE}.metrics.jwe ;;
  }

  dimension: metrics__labeled_counter__avif_bit_depth {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.avif_bit_depth ;;
  }

  dimension: metrics__labeled_counter__avif_decode_result {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.avif_decode_result ;;
  }

  dimension: metrics__labeled_counter__avif_decoder {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.avif_decoder ;;
  }

  dimension: metrics__labeled_counter__avif_yuv_color_space {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.avif_yuv_color_space ;;
  }

  dimension: metrics__labeled_counter__browser_search_ad_clicks {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.browser_search_ad_clicks ;;
  }

  dimension: metrics__labeled_counter__browser_search_in_content {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.browser_search_in_content ;;
  }

  dimension: metrics__labeled_counter__browser_search_with_ads {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.browser_search_with_ads ;;
  }

  dimension: metrics__labeled_counter__crash_metrics_crash_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.crash_metrics_crash_count ;;
  }

  dimension: metrics__labeled_counter__engine_tab_kills {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.engine_tab_kills ;;
  }

  dimension: metrics__labeled_counter__gfx_content_frame_time_reason {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.gfx_content_frame_time_reason ;;
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

  dimension: metrics__labeled_counter__glean_upload_ping_upload_failure {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_upload_ping_upload_failure ;;
  }

  dimension: metrics__labeled_counter__glean_validation_pings_submitted {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_validation_pings_submitted ;;
  }

  dimension: metrics__labeled_counter__logins_store_read_query_error_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.logins_store_read_query_error_count ;;
  }

  dimension: metrics__labeled_counter__logins_store_unlock_error_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.logins_store_unlock_error_count ;;
  }

  dimension: metrics__labeled_counter__logins_store_write_query_error_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.logins_store_write_query_error_count ;;
  }

  dimension: metrics__labeled_counter__media_audio_backend {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.media_audio_backend ;;
  }

  dimension: metrics__labeled_counter__media_audio_init_failure {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.media_audio_init_failure ;;
  }

  dimension: metrics__labeled_counter__metrics_search_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.metrics_search_count ;;
  }

  dimension: metrics__labeled_counter__places_manager_read_query_error_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.places_manager_read_query_error_count ;;
  }

  dimension: metrics__labeled_counter__places_manager_write_query_error_count {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.places_manager_write_query_error_count ;;
  }

  dimension: metrics__labeled_rate {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_rate ;;
  }

  dimension: metrics__memory_distribution__glean_database_size__sum {
    group_item_label: "Sum"
    group_label: "Metrics Memory Distribution Glean Database Size"
    sql: ${TABLE}.metrics.memory_distribution.glean_database_size.sum ;;
    type: number
  }

  dimension: metrics__memory_distribution__glean_database_size__values {
    hidden: yes
    sql: ${TABLE}.metrics.memory_distribution.glean_database_size.values ;;
  }

  dimension: metrics__memory_distribution__glean_upload_discarded_exceeding_pings_size__sum {
    group_item_label: "Sum"
    group_label: "Metrics Memory Distribution Glean Upload Discarded Exceeding Pings Size"
    sql: ${TABLE}.metrics.memory_distribution.glean_upload_discarded_exceeding_pings_size.sum ;;
    type: number
  }

  dimension: metrics__memory_distribution__glean_upload_discarded_exceeding_pings_size__values {
    hidden: yes
    sql: ${TABLE}.metrics.memory_distribution.glean_upload_discarded_exceeding_pings_size.values ;;
  }

  dimension: metrics__memory_distribution__glean_upload_pending_pings_directory_size__sum {
    group_item_label: "Sum"
    group_label: "Metrics Memory Distribution Glean Upload Pending Pings Directory Size"
    sql: ${TABLE}.metrics.memory_distribution.glean_upload_pending_pings_directory_size.sum ;;
    type: number
  }

  dimension: metrics__memory_distribution__glean_upload_pending_pings_directory_size__values {
    hidden: yes
    sql: ${TABLE}.metrics.memory_distribution.glean_upload_pending_pings_directory_size.values ;;
  }

  dimension: metrics__memory_distribution__storage_stats_app_bytes__sum {
    group_item_label: "Sum"
    group_label: "Metrics Memory Distribution Storage Stats App Bytes"
    sql: ${TABLE}.metrics.memory_distribution.storage_stats_app_bytes.sum ;;
    type: number
  }

  dimension: metrics__memory_distribution__storage_stats_app_bytes__values {
    hidden: yes
    sql: ${TABLE}.metrics.memory_distribution.storage_stats_app_bytes.values ;;
  }

  dimension: metrics__memory_distribution__storage_stats_cache_bytes__sum {
    group_item_label: "Sum"
    group_label: "Metrics Memory Distribution Storage Stats Cache Bytes"
    sql: ${TABLE}.metrics.memory_distribution.storage_stats_cache_bytes.sum ;;
    type: number
  }

  dimension: metrics__memory_distribution__storage_stats_cache_bytes__values {
    hidden: yes
    sql: ${TABLE}.metrics.memory_distribution.storage_stats_cache_bytes.values ;;
  }

  dimension: metrics__memory_distribution__storage_stats_data_dir_bytes__sum {
    group_item_label: "Sum"
    group_label: "Metrics Memory Distribution Storage Stats Data Dir Bytes"
    sql: ${TABLE}.metrics.memory_distribution.storage_stats_data_dir_bytes.sum ;;
    type: number
  }

  dimension: metrics__memory_distribution__storage_stats_data_dir_bytes__values {
    hidden: yes
    sql: ${TABLE}.metrics.memory_distribution.storage_stats_data_dir_bytes.values ;;
  }

  dimension: metrics__quantity__avif_aom_decode_error {
    group_item_label: "Avif Aom Decode Error"
    group_label: "Metrics Quantity"
    sql: ${TABLE}.metrics.quantity.avif_aom_decode_error ;;
    type: number
  }

  dimension: metrics__quantity__avif_dav1d_decode_error {
    group_item_label: "Avif Dav1D Decode Error"
    group_label: "Metrics Quantity"
    sql: ${TABLE}.metrics.quantity.avif_dav1d_decode_error ;;
    type: number
  }

  dimension: metrics__quantity__gfx_adapter_primary_ram {
    group_item_label: "Gfx Adapter Primary Ram"
    group_label: "Metrics Quantity"
    sql: ${TABLE}.metrics.quantity.gfx_adapter_primary_ram ;;
    type: number
  }

  dimension: metrics__quantity__gfx_display_count {
    group_item_label: "Gfx Display Count"
    group_label: "Metrics Quantity"
    sql: ${TABLE}.metrics.quantity.gfx_display_count ;;
    type: number
  }

  dimension: metrics__quantity__gfx_display_primary_height {
    group_item_label: "Gfx Display Primary Height"
    group_label: "Metrics Quantity"
    sql: ${TABLE}.metrics.quantity.gfx_display_primary_height ;;
    type: number
  }

  dimension: metrics__quantity__gfx_display_primary_width {
    group_item_label: "Gfx Display Primary Width"
    group_label: "Metrics Quantity"
    sql: ${TABLE}.metrics.quantity.gfx_display_primary_width ;;
    type: number
  }

  dimension: metrics__string__experiments_metrics_active_experiment {
    group_item_label: "Experiments Metrics Active Experiment"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.experiments_metrics_active_experiment ;;
    type: string
  }

  dimension: metrics__string__geckoview_build_id {
    group_item_label: "Geckoview Build Id"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.geckoview_build_id ;;
    type: string
  }

  dimension: metrics__string__geckoview_version {
    group_item_label: "Geckoview Version"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.geckoview_version ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_description {
    group_item_label: "Gfx Adapter Primary Description"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_description ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_device_id {
    group_item_label: "Gfx Adapter Primary Device Id"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_device_id ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_device_id_last_seen {
    group_item_label: "Gfx Adapter Primary Device Id Last Seen"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_device_id_last_seen ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_driver_date {
    group_item_label: "Gfx Adapter Primary Driver Date"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_driver_date ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_driver_files {
    group_item_label: "Gfx Adapter Primary Driver Files"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_driver_files ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_driver_vendor {
    group_item_label: "Gfx Adapter Primary Driver Vendor"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_driver_vendor ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_driver_version {
    group_item_label: "Gfx Adapter Primary Driver Version"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_driver_version ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_subsystem_id {
    group_item_label: "Gfx Adapter Primary Subsystem Id"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_subsystem_id ;;
    type: string
  }

  dimension: metrics__string__gfx_adapter_primary_vendor_id {
    group_item_label: "Gfx Adapter Primary Vendor Id"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_adapter_primary_vendor_id ;;
    type: string
  }

  dimension: metrics__string__gfx_feature_webrender {
    group_item_label: "Gfx Feature Webrender"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_feature_webrender ;;
    type: string
  }

  dimension: metrics__string__gfx_status_compositor {
    group_item_label: "Gfx Status Compositor"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_status_compositor ;;
    type: string
  }

  dimension: metrics__string__gfx_status_compositor_last_seen {
    group_item_label: "Gfx Status Compositor Last Seen"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.gfx_status_compositor_last_seen ;;
    type: string
  }

  dimension: metrics__string__metrics_adjust_ad_group {
    group_item_label: "Metrics Adjust Ad Group"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_adjust_ad_group ;;
    type: string
  }

  dimension: metrics__string__metrics_adjust_campaign {
    group_item_label: "Metrics Adjust Campaign"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_adjust_campaign ;;
    type: string
  }

  dimension: metrics__string__metrics_adjust_creative {
    group_item_label: "Metrics Adjust Creative"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_adjust_creative ;;
    type: string
  }

  dimension: metrics__string__metrics_adjust_network {
    group_item_label: "Metrics Adjust Network"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_adjust_network ;;
    type: string
  }

  dimension: metrics__string__metrics_close_tab_setting {
    group_item_label: "Metrics Close Tab Setting"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_close_tab_setting ;;
    type: string
  }

  dimension: metrics__string__metrics_default_moz_browser {
    group_item_label: "Metrics Default Moz Browser"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_default_moz_browser ;;
    type: string
  }

  dimension: metrics__string__metrics_distribution_id {
    group_item_label: "Metrics Distribution Id"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_distribution_id ;;
    type: string
  }

  dimension: metrics__string__metrics_tab_view_setting {
    group_item_label: "Metrics Tab View Setting"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_tab_view_setting ;;
    type: string
  }

  dimension: metrics__string__metrics_toolbar_position {
    group_item_label: "Metrics Toolbar Position"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_toolbar_position ;;
    type: string
  }

  dimension: metrics__string__metrics_total_uri_count {
    group_item_label: "Metrics Total Uri Count"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.metrics_total_uri_count ;;
    type: string
  }

  dimension: metrics__string__ping_reason {
    group_item_label: "Ping Reason"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.ping_reason ;;
    type: string
  }

  dimension: metrics__string__search_default_engine_code {
    group_item_label: "Search Default Engine Code"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.search_default_engine_code ;;
    type: string
  }

  dimension: metrics__string__search_default_engine_name {
    group_item_label: "Search Default Engine Name"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.search_default_engine_name ;;
    type: string
  }

  dimension: metrics__string__search_default_engine_submission_url {
    group_item_label: "Search Default Engine Submission Url"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.search_default_engine_submission_url ;;
    type: string
  }

  dimension: metrics__string_list__addons_enabled_addons {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.addons_enabled_addons ;;
  }

  dimension: metrics__string_list__addons_installed_addons {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.addons_installed_addons ;;
  }

  dimension: metrics__string_list__metrics_mozilla_products {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.metrics_mozilla_products ;;
  }

  dimension: metrics__string_list__metrics_syncing_items {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.metrics_syncing_items ;;
  }

  dimension: metrics__string_list__preferences_accessibility_services {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_accessibility_services ;;
  }

  dimension: metrics__string_list__preferences_open_links_in_a_private_tab {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_open_links_in_a_private_tab ;;
  }

  dimension: metrics__string_list__preferences_open_links_in_app {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_open_links_in_app ;;
  }

  dimension: metrics__string_list__preferences_remote_debugging {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_remote_debugging ;;
  }

  dimension: metrics__string_list__preferences_search_bookmarks {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_search_bookmarks ;;
  }

  dimension: metrics__string_list__preferences_search_browsing_history {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_search_browsing_history ;;
  }

  dimension: metrics__string_list__preferences_search_suggestions_private {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_search_suggestions_private ;;
  }

  dimension: metrics__string_list__preferences_show_clipboard_suggestions {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_show_clipboard_suggestions ;;
  }

  dimension: metrics__string_list__preferences_show_search_shortcuts {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_show_search_shortcuts ;;
  }

  dimension: metrics__string_list__preferences_show_search_suggestions {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_show_search_suggestions ;;
  }

  dimension: metrics__string_list__preferences_show_voice_search {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_show_voice_search ;;
  }

  dimension: metrics__string_list__preferences_sync {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_sync ;;
  }

  dimension: metrics__string_list__preferences_sync_items {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_sync_items ;;
  }

  dimension: metrics__string_list__preferences_telemetry {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_telemetry ;;
  }

  dimension: metrics__string_list__preferences_theme {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_theme ;;
  }

  dimension: metrics__string_list__preferences_toolbar_position {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_toolbar_position ;;
  }

  dimension: metrics__string_list__preferences_tracking_protection {
    hidden: yes
    sql: ${TABLE}.metrics.string_list.preferences_tracking_protection ;;
  }

  dimension: metrics__timespan__engine_kill_background_age__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Engine Kill Background Age"
    sql: ${TABLE}.metrics.timespan.engine_kill_background_age.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__engine_kill_background_age__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Engine Kill Background Age"
    sql: ${TABLE}.metrics.timespan.engine_kill_background_age.value ;;
    type: number
  }

  dimension: metrics__timespan__engine_kill_foreground_age__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Engine Kill Foreground Age"
    sql: ${TABLE}.metrics.timespan.engine_kill_foreground_age.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__engine_kill_foreground_age__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Engine Kill Foreground Age"
    sql: ${TABLE}.metrics.timespan.engine_kill_foreground_age.value ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_background_age__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Engine Tab Kill Background Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_background_age.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_background_age__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Engine Tab Kill Background Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_background_age.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__engine_tab_kill_background_age__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Engine Tab Kill Background Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_background_age.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_background_age__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_background_age.range ;;
  }

  dimension: metrics__timing_distribution__engine_tab_kill_background_age__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Engine Tab Kill Background Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_background_age.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_background_age__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Engine Tab Kill Background Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_background_age.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__engine_tab_kill_background_age__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Engine Tab Kill Background Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_background_age.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_background_age__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_background_age.values ;;
  }

  dimension: metrics__timing_distribution__engine_tab_kill_foreground_age__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Engine Tab Kill Foreground Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_foreground_age.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_foreground_age__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Engine Tab Kill Foreground Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_foreground_age.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__engine_tab_kill_foreground_age__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Engine Tab Kill Foreground Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_foreground_age.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_foreground_age__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_foreground_age.range ;;
  }

  dimension: metrics__timing_distribution__engine_tab_kill_foreground_age__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Engine Tab Kill Foreground Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_foreground_age.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_foreground_age__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Engine Tab Kill Foreground Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_foreground_age.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__engine_tab_kill_foreground_age__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Engine Tab Kill Foreground Age"
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_foreground_age.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__engine_tab_kill_foreground_age__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.engine_tab_kill_foreground_age.values ;;
  }

  dimension: metrics__timing_distribution__geckoview_content_process_lifetime__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Geckoview Content Process Lifetime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_content_process_lifetime.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_content_process_lifetime__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Geckoview Content Process Lifetime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_content_process_lifetime.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_content_process_lifetime__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Geckoview Content Process Lifetime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_content_process_lifetime.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_content_process_lifetime__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_content_process_lifetime.range ;;
  }

  dimension: metrics__timing_distribution__geckoview_content_process_lifetime__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Geckoview Content Process Lifetime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_content_process_lifetime.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_content_process_lifetime__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Geckoview Content Process Lifetime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_content_process_lifetime.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_content_process_lifetime__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Geckoview Content Process Lifetime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_content_process_lifetime.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_content_process_lifetime__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_content_process_lifetime.values ;;
  }

  dimension: metrics__timing_distribution__geckoview_page_load_progress_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Geckoview Page Load Progress Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_progress_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_load_progress_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Geckoview Page Load Progress Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_progress_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_page_load_progress_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Geckoview Page Load Progress Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_progress_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_load_progress_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_progress_time.range ;;
  }

  dimension: metrics__timing_distribution__geckoview_page_load_progress_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Geckoview Page Load Progress Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_progress_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_load_progress_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Geckoview Page Load Progress Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_progress_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_page_load_progress_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Geckoview Page Load Progress Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_progress_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_load_progress_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_progress_time.values ;;
  }

  dimension: metrics__timing_distribution__geckoview_page_load_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Geckoview Page Load Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_load_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Geckoview Page Load Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_page_load_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Geckoview Page Load Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_load_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_time.range ;;
  }

  dimension: metrics__timing_distribution__geckoview_page_load_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Geckoview Page Load Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_load_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Geckoview Page Load Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_page_load_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Geckoview Page Load Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_load_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_load_time.values ;;
  }

  dimension: metrics__timing_distribution__geckoview_page_reload_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Geckoview Page Reload Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_reload_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_reload_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Geckoview Page Reload Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_reload_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_page_reload_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Geckoview Page Reload Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_reload_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_reload_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_reload_time.range ;;
  }

  dimension: metrics__timing_distribution__geckoview_page_reload_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Geckoview Page Reload Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_reload_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_reload_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Geckoview Page Reload Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_reload_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_page_reload_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Geckoview Page Reload Time"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_reload_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_page_reload_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_page_reload_time.values ;;
  }

  dimension: metrics__timing_distribution__geckoview_startup_runtime__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Geckoview Startup Runtime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_startup_runtime.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_startup_runtime__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Geckoview Startup Runtime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_startup_runtime.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_startup_runtime__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Geckoview Startup Runtime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_startup_runtime.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_startup_runtime__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_startup_runtime.range ;;
  }

  dimension: metrics__timing_distribution__geckoview_startup_runtime__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Geckoview Startup Runtime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_startup_runtime.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_startup_runtime__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Geckoview Startup Runtime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_startup_runtime.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__geckoview_startup_runtime__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Geckoview Startup Runtime"
    sql: ${TABLE}.metrics.timing_distribution.geckoview_startup_runtime.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__geckoview_startup_runtime__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.geckoview_startup_runtime.values ;;
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_duration__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_duration.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_duration__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_duration.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_duration__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_duration.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_duration__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_duration.range ;;
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_duration__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_duration.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_duration__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_duration.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_duration__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_duration.values ;;
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_potential_duration__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Potential Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_potential_duration.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_potential_duration__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Potential Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_potential_duration.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_potential_duration__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Potential Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_potential_duration.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_potential_duration__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_potential_duration.range ;;
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_potential_duration__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Potential Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_potential_duration.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_potential_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Potential Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_potential_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_potential_duration__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Checkerboard Potential Duration"
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_potential_duration.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_checkerboard_potential_duration__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_checkerboard_potential_duration.values ;;
  }

  dimension: metrics__timing_distribution__gfx_composite_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Composite Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_composite_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_composite_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Composite Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_composite_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_composite_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Composite Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_composite_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_composite_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_composite_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_composite_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Composite Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_composite_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_composite_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Composite Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_composite_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_composite_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Composite Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_composite_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_composite_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_composite_time.values ;;
  }

  dimension: metrics__timing_distribution__gfx_content_full_paint_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Content Full Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_full_paint_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_content_full_paint_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Content Full Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_full_paint_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_content_full_paint_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Content Full Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_full_paint_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_content_full_paint_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_full_paint_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_content_full_paint_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Content Full Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_full_paint_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_content_full_paint_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Content Full Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_full_paint_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_content_full_paint_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Content Full Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_full_paint_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_content_full_paint_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_full_paint_time.values ;;
  }

  dimension: metrics__timing_distribution__gfx_content_paint_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Content Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_paint_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_content_paint_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Content Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_paint_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_content_paint_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Content Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_paint_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_content_paint_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_paint_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_content_paint_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Content Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_paint_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_content_paint_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Content Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_paint_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_content_paint_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Content Paint Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_paint_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_content_paint_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_content_paint_time.values ;;
  }

  dimension: metrics__timing_distribution__gfx_scroll_present_latency__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Scroll Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.gfx_scroll_present_latency.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_scroll_present_latency__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Scroll Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.gfx_scroll_present_latency.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_scroll_present_latency__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Scroll Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.gfx_scroll_present_latency.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_scroll_present_latency__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_scroll_present_latency.range ;;
  }

  dimension: metrics__timing_distribution__gfx_scroll_present_latency__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Scroll Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.gfx_scroll_present_latency.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_scroll_present_latency__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Scroll Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.gfx_scroll_present_latency.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_scroll_present_latency__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Scroll Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.gfx_scroll_present_latency.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_scroll_present_latency__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_scroll_present_latency.values ;;
  }

  dimension: metrics__timing_distribution__gfx_status_framebuild_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Status Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_framebuild_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_status_framebuild_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Status Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_framebuild_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_status_framebuild_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Status Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_framebuild_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_status_framebuild_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_framebuild_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_status_framebuild_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Status Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_framebuild_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_status_framebuild_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Status Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_framebuild_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_status_framebuild_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Status Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_framebuild_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_status_framebuild_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_framebuild_time.values ;;
  }

  dimension: metrics__timing_distribution__gfx_status_sceneswap_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Status Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_sceneswap_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_status_sceneswap_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Status Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_sceneswap_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_status_sceneswap_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Status Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_sceneswap_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_status_sceneswap_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_sceneswap_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_status_sceneswap_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Status Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_sceneswap_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_status_sceneswap_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Status Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_sceneswap_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_status_sceneswap_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Status Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_sceneswap_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_status_sceneswap_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_status_sceneswap_time.values ;;
  }

  dimension: metrics__timing_distribution__gfx_webrender_framebuild_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Webrender Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_framebuild_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_framebuild_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Webrender Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_framebuild_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_webrender_framebuild_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Webrender Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_framebuild_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_framebuild_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_framebuild_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_webrender_framebuild_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Webrender Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_framebuild_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_framebuild_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Webrender Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_framebuild_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_webrender_framebuild_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Webrender Framebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_framebuild_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_framebuild_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_framebuild_time.values ;;
  }

  dimension: metrics__timing_distribution__gfx_webrender_render_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Webrender Render Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_render_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_render_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Webrender Render Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_render_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_webrender_render_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Webrender Render Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_render_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_render_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_render_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_webrender_render_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Webrender Render Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_render_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_render_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Webrender Render Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_render_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_webrender_render_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Webrender Render Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_render_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_render_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_render_time.values ;;
  }

  dimension: metrics__timing_distribution__gfx_webrender_scenebuild_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Webrender Scenebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_scenebuild_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_scenebuild_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Webrender Scenebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_scenebuild_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_webrender_scenebuild_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Webrender Scenebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_scenebuild_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_scenebuild_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_scenebuild_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_webrender_scenebuild_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Webrender Scenebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_scenebuild_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_scenebuild_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Webrender Scenebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_scenebuild_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_webrender_scenebuild_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Webrender Scenebuild Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_scenebuild_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_scenebuild_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_scenebuild_time.values ;;
  }

  dimension: metrics__timing_distribution__gfx_webrender_sceneswap_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Gfx Webrender Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_sceneswap_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_sceneswap_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Gfx Webrender Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_sceneswap_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_webrender_sceneswap_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Gfx Webrender Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_sceneswap_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_sceneswap_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_sceneswap_time.range ;;
  }

  dimension: metrics__timing_distribution__gfx_webrender_sceneswap_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Gfx Webrender Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_sceneswap_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_sceneswap_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Gfx Webrender Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_sceneswap_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__gfx_webrender_sceneswap_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Gfx Webrender Sceneswap Time"
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_sceneswap_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__gfx_webrender_sceneswap_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.gfx_webrender_sceneswap_time.values ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_compact_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Javascript Gc Compact Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_compact_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_compact_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Javascript Gc Compact Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_compact_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_compact_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Javascript Gc Compact Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_compact_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_compact_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_compact_time.range ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_compact_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Javascript Gc Compact Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_compact_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_compact_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Javascript Gc Compact Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_compact_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_compact_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Javascript Gc Compact Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_compact_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_compact_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_compact_time.values ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_roots_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Roots Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_roots_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_roots_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Roots Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_roots_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_roots_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Roots Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_roots_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_roots_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_roots_time.range ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_roots_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Roots Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_roots_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_roots_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Roots Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_roots_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_roots_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Roots Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_roots_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_roots_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_roots_time.values ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_time.range ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Javascript Gc Mark Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_mark_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_mark_time.values ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_minor_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Javascript Gc Minor Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_minor_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_minor_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Javascript Gc Minor Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_minor_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_minor_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Javascript Gc Minor Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_minor_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_minor_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_minor_time.range ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_minor_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Javascript Gc Minor Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_minor_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_minor_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Javascript Gc Minor Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_minor_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_minor_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Javascript Gc Minor Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_minor_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_minor_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_minor_time.values ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_prepare_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Javascript Gc Prepare Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_prepare_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_prepare_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Javascript Gc Prepare Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_prepare_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_prepare_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Javascript Gc Prepare Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_prepare_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_prepare_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_prepare_time.range ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_prepare_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Javascript Gc Prepare Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_prepare_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_prepare_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Javascript Gc Prepare Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_prepare_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_prepare_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Javascript Gc Prepare Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_prepare_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_prepare_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_prepare_time.values ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_slice_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Javascript Gc Slice Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_slice_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_slice_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Javascript Gc Slice Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_slice_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_slice_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Javascript Gc Slice Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_slice_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_slice_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_slice_time.range ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_slice_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Javascript Gc Slice Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_slice_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_slice_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Javascript Gc Slice Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_slice_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_slice_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Javascript Gc Slice Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_slice_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_slice_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_slice_time.values ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_sweep_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Javascript Gc Sweep Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_sweep_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_sweep_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Javascript Gc Sweep Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_sweep_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_sweep_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Javascript Gc Sweep Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_sweep_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_sweep_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_sweep_time.range ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_sweep_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Javascript Gc Sweep Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_sweep_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_sweep_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Javascript Gc Sweep Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_sweep_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_sweep_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Javascript Gc Sweep Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_sweep_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_sweep_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_sweep_time.values ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_total_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Javascript Gc Total Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_total_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_total_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Javascript Gc Total Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_total_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_total_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Javascript Gc Total Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_total_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_total_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_total_time.range ;;
  }

  dimension: metrics__timing_distribution__javascript_gc_total_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Javascript Gc Total Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_total_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_total_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Javascript Gc Total Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_total_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__javascript_gc_total_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Javascript Gc Total Time"
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_total_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__javascript_gc_total_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.javascript_gc_total_time.values ;;
  }

  dimension: metrics__timing_distribution__js_bytecode_caching_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Js Bytecode Caching Time"
    sql: ${TABLE}.metrics.timing_distribution.js_bytecode_caching_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__js_bytecode_caching_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Js Bytecode Caching Time"
    sql: ${TABLE}.metrics.timing_distribution.js_bytecode_caching_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__js_bytecode_caching_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Js Bytecode Caching Time"
    sql: ${TABLE}.metrics.timing_distribution.js_bytecode_caching_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__js_bytecode_caching_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.js_bytecode_caching_time.range ;;
  }

  dimension: metrics__timing_distribution__js_bytecode_caching_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Js Bytecode Caching Time"
    sql: ${TABLE}.metrics.timing_distribution.js_bytecode_caching_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__js_bytecode_caching_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Js Bytecode Caching Time"
    sql: ${TABLE}.metrics.timing_distribution.js_bytecode_caching_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__js_bytecode_caching_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Js Bytecode Caching Time"
    sql: ${TABLE}.metrics.timing_distribution.js_bytecode_caching_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__js_bytecode_caching_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.js_bytecode_caching_time.values ;;
  }

  dimension: metrics__timing_distribution__logins_store_read_query_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Logins Store Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_read_query_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_read_query_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Logins Store Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_read_query_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__logins_store_read_query_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Logins Store Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_read_query_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_read_query_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.logins_store_read_query_time.range ;;
  }

  dimension: metrics__timing_distribution__logins_store_read_query_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Logins Store Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_read_query_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_read_query_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Logins Store Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_read_query_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__logins_store_read_query_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Logins Store Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_read_query_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_read_query_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.logins_store_read_query_time.values ;;
  }

  dimension: metrics__timing_distribution__logins_store_unlock_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Logins Store Unlock Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_unlock_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_unlock_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Logins Store Unlock Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_unlock_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__logins_store_unlock_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Logins Store Unlock Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_unlock_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_unlock_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.logins_store_unlock_time.range ;;
  }

  dimension: metrics__timing_distribution__logins_store_unlock_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Logins Store Unlock Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_unlock_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_unlock_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Logins Store Unlock Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_unlock_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__logins_store_unlock_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Logins Store Unlock Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_unlock_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_unlock_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.logins_store_unlock_time.values ;;
  }

  dimension: metrics__timing_distribution__logins_store_write_query_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Logins Store Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_write_query_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_write_query_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Logins Store Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_write_query_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__logins_store_write_query_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Logins Store Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_write_query_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_write_query_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.logins_store_write_query_time.range ;;
  }

  dimension: metrics__timing_distribution__logins_store_write_query_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Logins Store Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_write_query_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_write_query_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Logins Store Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_write_query_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__logins_store_write_query_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Logins Store Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.logins_store_write_query_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__logins_store_write_query_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.logins_store_write_query_time.values ;;
  }

  dimension: metrics__timing_distribution__network_cache_hit_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Network Cache Hit Time"
    sql: ${TABLE}.metrics.timing_distribution.network_cache_hit_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_cache_hit_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Network Cache Hit Time"
    sql: ${TABLE}.metrics.timing_distribution.network_cache_hit_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_cache_hit_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Network Cache Hit Time"
    sql: ${TABLE}.metrics.timing_distribution.network_cache_hit_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_cache_hit_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_cache_hit_time.range ;;
  }

  dimension: metrics__timing_distribution__network_cache_hit_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Network Cache Hit Time"
    sql: ${TABLE}.metrics.timing_distribution.network_cache_hit_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_cache_hit_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Network Cache Hit Time"
    sql: ${TABLE}.metrics.timing_distribution.network_cache_hit_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_cache_hit_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Network Cache Hit Time"
    sql: ${TABLE}.metrics.timing_distribution.network_cache_hit_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_cache_hit_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_cache_hit_time.values ;;
  }

  dimension: metrics__timing_distribution__network_dns_end__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Network Dns End"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_end.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_dns_end__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Network Dns End"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_end.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_dns_end__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Network Dns End"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_end.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_dns_end__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_dns_end.range ;;
  }

  dimension: metrics__timing_distribution__network_dns_end__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Network Dns End"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_end.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_dns_end__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Network Dns End"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_end.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_dns_end__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Network Dns End"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_end.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_dns_end__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_dns_end.values ;;
  }

  dimension: metrics__timing_distribution__network_dns_start__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Network Dns Start"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_start.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_dns_start__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Network Dns Start"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_start.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_dns_start__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Network Dns Start"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_start.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_dns_start__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_dns_start.range ;;
  }

  dimension: metrics__timing_distribution__network_dns_start__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Network Dns Start"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_start.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_dns_start__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Network Dns Start"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_start.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_dns_start__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Network Dns Start"
    sql: ${TABLE}.metrics.timing_distribution.network_dns_start.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_dns_start__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_dns_start.values ;;
  }

  dimension: metrics__timing_distribution__network_first_from_cache__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Network First From Cache"
    sql: ${TABLE}.metrics.timing_distribution.network_first_from_cache.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_first_from_cache__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Network First From Cache"
    sql: ${TABLE}.metrics.timing_distribution.network_first_from_cache.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_first_from_cache__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Network First From Cache"
    sql: ${TABLE}.metrics.timing_distribution.network_first_from_cache.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_first_from_cache__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_first_from_cache.range ;;
  }

  dimension: metrics__timing_distribution__network_first_from_cache__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Network First From Cache"
    sql: ${TABLE}.metrics.timing_distribution.network_first_from_cache.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_first_from_cache__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Network First From Cache"
    sql: ${TABLE}.metrics.timing_distribution.network_first_from_cache.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_first_from_cache__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Network First From Cache"
    sql: ${TABLE}.metrics.timing_distribution.network_first_from_cache.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_first_from_cache__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_first_from_cache.values ;;
  }

  dimension: metrics__timing_distribution__network_font_download_end__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Network Font Download End"
    sql: ${TABLE}.metrics.timing_distribution.network_font_download_end.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_font_download_end__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Network Font Download End"
    sql: ${TABLE}.metrics.timing_distribution.network_font_download_end.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_font_download_end__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Network Font Download End"
    sql: ${TABLE}.metrics.timing_distribution.network_font_download_end.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_font_download_end__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_font_download_end.range ;;
  }

  dimension: metrics__timing_distribution__network_font_download_end__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Network Font Download End"
    sql: ${TABLE}.metrics.timing_distribution.network_font_download_end.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_font_download_end__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Network Font Download End"
    sql: ${TABLE}.metrics.timing_distribution.network_font_download_end.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_font_download_end__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Network Font Download End"
    sql: ${TABLE}.metrics.timing_distribution.network_font_download_end.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_font_download_end__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_font_download_end.values ;;
  }

  dimension: metrics__timing_distribution__network_tcp_connection__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Network Tcp Connection"
    sql: ${TABLE}.metrics.timing_distribution.network_tcp_connection.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_tcp_connection__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Network Tcp Connection"
    sql: ${TABLE}.metrics.timing_distribution.network_tcp_connection.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_tcp_connection__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Network Tcp Connection"
    sql: ${TABLE}.metrics.timing_distribution.network_tcp_connection.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_tcp_connection__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_tcp_connection.range ;;
  }

  dimension: metrics__timing_distribution__network_tcp_connection__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Network Tcp Connection"
    sql: ${TABLE}.metrics.timing_distribution.network_tcp_connection.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_tcp_connection__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Network Tcp Connection"
    sql: ${TABLE}.metrics.timing_distribution.network_tcp_connection.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_tcp_connection__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Network Tcp Connection"
    sql: ${TABLE}.metrics.timing_distribution.network_tcp_connection.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_tcp_connection__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_tcp_connection.values ;;
  }

  dimension: metrics__timing_distribution__network_tls_handshake__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Network Tls Handshake"
    sql: ${TABLE}.metrics.timing_distribution.network_tls_handshake.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_tls_handshake__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Network Tls Handshake"
    sql: ${TABLE}.metrics.timing_distribution.network_tls_handshake.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_tls_handshake__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Network Tls Handshake"
    sql: ${TABLE}.metrics.timing_distribution.network_tls_handshake.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_tls_handshake__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_tls_handshake.range ;;
  }

  dimension: metrics__timing_distribution__network_tls_handshake__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Network Tls Handshake"
    sql: ${TABLE}.metrics.timing_distribution.network_tls_handshake.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_tls_handshake__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Network Tls Handshake"
    sql: ${TABLE}.metrics.timing_distribution.network_tls_handshake.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__network_tls_handshake__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Network Tls Handshake"
    sql: ${TABLE}.metrics.timing_distribution.network_tls_handshake.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__network_tls_handshake__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.network_tls_handshake.values ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_bookmark_suggestions__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Awesomebar Bookmark Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_bookmark_suggestions.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_bookmark_suggestions__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Awesomebar Bookmark Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_bookmark_suggestions.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_bookmark_suggestions__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Bookmark Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_bookmark_suggestions.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_bookmark_suggestions__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_bookmark_suggestions.range ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_bookmark_suggestions__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Awesomebar Bookmark Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_bookmark_suggestions.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_bookmark_suggestions__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Awesomebar Bookmark Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_bookmark_suggestions.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_bookmark_suggestions__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Bookmark Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_bookmark_suggestions.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_bookmark_suggestions__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_bookmark_suggestions.values ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_clipboard_suggestions__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Awesomebar Clipboard Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_clipboard_suggestions.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_clipboard_suggestions__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Awesomebar Clipboard Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_clipboard_suggestions.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_clipboard_suggestions__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Clipboard Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_clipboard_suggestions.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_clipboard_suggestions__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_clipboard_suggestions.range ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_clipboard_suggestions__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Awesomebar Clipboard Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_clipboard_suggestions.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_clipboard_suggestions__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Awesomebar Clipboard Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_clipboard_suggestions.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_clipboard_suggestions__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Clipboard Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_clipboard_suggestions.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_clipboard_suggestions__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_clipboard_suggestions.values ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_history_suggestions__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Awesomebar History Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_history_suggestions.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_history_suggestions__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Awesomebar History Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_history_suggestions.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_history_suggestions__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar History Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_history_suggestions.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_history_suggestions__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_history_suggestions.range ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_history_suggestions__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Awesomebar History Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_history_suggestions.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_history_suggestions__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Awesomebar History Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_history_suggestions.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_history_suggestions__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar History Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_history_suggestions.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_history_suggestions__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_history_suggestions.values ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_search_engine_suggestions__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Awesomebar Search Engine Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_search_engine_suggestions.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_search_engine_suggestions__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Awesomebar Search Engine Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_search_engine_suggestions.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_search_engine_suggestions__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Search Engine Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_search_engine_suggestions.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_search_engine_suggestions__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_search_engine_suggestions.range ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_search_engine_suggestions__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Awesomebar Search Engine Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_search_engine_suggestions.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_search_engine_suggestions__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Awesomebar Search Engine Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_search_engine_suggestions.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_search_engine_suggestions__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Search Engine Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_search_engine_suggestions.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_search_engine_suggestions__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_search_engine_suggestions.values ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_session_suggestions__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Awesomebar Session Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_session_suggestions.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_session_suggestions__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Awesomebar Session Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_session_suggestions.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_session_suggestions__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Session Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_session_suggestions.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_session_suggestions__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_session_suggestions.range ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_session_suggestions__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Awesomebar Session Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_session_suggestions.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_session_suggestions__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Awesomebar Session Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_session_suggestions.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_session_suggestions__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Session Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_session_suggestions.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_session_suggestions__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_session_suggestions.values ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_shortcuts_suggestions__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Awesomebar Shortcuts Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_shortcuts_suggestions.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_shortcuts_suggestions__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Awesomebar Shortcuts Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_shortcuts_suggestions.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_shortcuts_suggestions__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Shortcuts Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_shortcuts_suggestions.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_shortcuts_suggestions__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_shortcuts_suggestions.range ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_shortcuts_suggestions__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Awesomebar Shortcuts Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_shortcuts_suggestions.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_shortcuts_suggestions__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Awesomebar Shortcuts Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_shortcuts_suggestions.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_shortcuts_suggestions__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Shortcuts Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_shortcuts_suggestions.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_shortcuts_suggestions__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_shortcuts_suggestions.values ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_synced_tabs_suggestions__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Awesomebar Synced Tabs Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_synced_tabs_suggestions.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_synced_tabs_suggestions__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Awesomebar Synced Tabs Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_synced_tabs_suggestions.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_synced_tabs_suggestions__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Synced Tabs Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_synced_tabs_suggestions.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_synced_tabs_suggestions__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_synced_tabs_suggestions.range ;;
  }

  dimension: metrics__timing_distribution__perf_awesomebar_synced_tabs_suggestions__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Awesomebar Synced Tabs Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_synced_tabs_suggestions.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_synced_tabs_suggestions__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Awesomebar Synced Tabs Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_synced_tabs_suggestions.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_awesomebar_synced_tabs_suggestions__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Awesomebar Synced Tabs Suggestions"
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_synced_tabs_suggestions.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_awesomebar_synced_tabs_suggestions__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_awesomebar_synced_tabs_suggestions.values ;;
  }

  dimension: metrics__timing_distribution__perf_startup_application_on_create__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Startup Application On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_application_on_create.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_startup_application_on_create__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Startup Application On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_application_on_create.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_startup_application_on_create__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Startup Application On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_application_on_create.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_startup_application_on_create__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_application_on_create.range ;;
  }

  dimension: metrics__timing_distribution__perf_startup_application_on_create__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Startup Application On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_application_on_create.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_startup_application_on_create__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Startup Application On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_application_on_create.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_startup_application_on_create__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Startup Application On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_application_on_create.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_startup_application_on_create__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_application_on_create.values ;;
  }

  dimension: metrics__timing_distribution__perf_startup_home_activity_on_create__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Perf Startup Home Activity On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_home_activity_on_create.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_startup_home_activity_on_create__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Perf Startup Home Activity On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_home_activity_on_create.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_startup_home_activity_on_create__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Perf Startup Home Activity On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_home_activity_on_create.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_startup_home_activity_on_create__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_home_activity_on_create.range ;;
  }

  dimension: metrics__timing_distribution__perf_startup_home_activity_on_create__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Perf Startup Home Activity On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_home_activity_on_create.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_startup_home_activity_on_create__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Perf Startup Home Activity On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_home_activity_on_create.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__perf_startup_home_activity_on_create__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Perf Startup Home Activity On Create"
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_home_activity_on_create.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__perf_startup_home_activity_on_create__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.perf_startup_home_activity_on_create.values ;;
  }

  dimension: metrics__timing_distribution__performance_interaction_keypress_present_latency__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Interaction Keypress Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_keypress_present_latency.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_interaction_keypress_present_latency__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Interaction Keypress Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_keypress_present_latency.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_interaction_keypress_present_latency__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Interaction Keypress Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_keypress_present_latency.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_interaction_keypress_present_latency__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_keypress_present_latency.range ;;
  }

  dimension: metrics__timing_distribution__performance_interaction_keypress_present_latency__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Interaction Keypress Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_keypress_present_latency.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_interaction_keypress_present_latency__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Interaction Keypress Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_keypress_present_latency.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_interaction_keypress_present_latency__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Interaction Keypress Present Latency"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_keypress_present_latency.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_interaction_keypress_present_latency__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_keypress_present_latency.values ;;
  }

  dimension: metrics__timing_distribution__performance_interaction_tab_switch_composite__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Interaction Tab Switch Composite"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_tab_switch_composite.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_interaction_tab_switch_composite__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Interaction Tab Switch Composite"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_tab_switch_composite.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_interaction_tab_switch_composite__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Interaction Tab Switch Composite"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_tab_switch_composite.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_interaction_tab_switch_composite__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_tab_switch_composite.range ;;
  }

  dimension: metrics__timing_distribution__performance_interaction_tab_switch_composite__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Interaction Tab Switch Composite"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_tab_switch_composite.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_interaction_tab_switch_composite__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Interaction Tab Switch Composite"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_tab_switch_composite.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_interaction_tab_switch_composite__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Interaction Tab Switch Composite"
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_tab_switch_composite.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_interaction_tab_switch_composite__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_interaction_tab_switch_composite.values ;;
  }

  dimension: metrics__timing_distribution__performance_page_non_blank_paint__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Page Non Blank Paint"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_non_blank_paint.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_page_non_blank_paint__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Page Non Blank Paint"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_non_blank_paint.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_page_non_blank_paint__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Page Non Blank Paint"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_non_blank_paint.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_page_non_blank_paint__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_page_non_blank_paint.range ;;
  }

  dimension: metrics__timing_distribution__performance_page_non_blank_paint__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Page Non Blank Paint"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_non_blank_paint.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_page_non_blank_paint__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Page Non Blank Paint"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_non_blank_paint.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_page_non_blank_paint__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Page Non Blank Paint"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_non_blank_paint.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_page_non_blank_paint__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_page_non_blank_paint.values ;;
  }

  dimension: metrics__timing_distribution__performance_page_total_content_page_load__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Page Total Content Page Load"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_total_content_page_load.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_page_total_content_page_load__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Page Total Content Page Load"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_total_content_page_load.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_page_total_content_page_load__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Page Total Content Page Load"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_total_content_page_load.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_page_total_content_page_load__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_page_total_content_page_load.range ;;
  }

  dimension: metrics__timing_distribution__performance_page_total_content_page_load__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Page Total Content Page Load"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_total_content_page_load.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_page_total_content_page_load__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Page Total Content Page Load"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_total_content_page_load.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_page_total_content_page_load__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Page Total Content Page Load"
    sql: ${TABLE}.metrics.timing_distribution.performance_page_total_content_page_load.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_page_total_content_page_load__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_page_total_content_page_load.values ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl.range ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl.values ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl_responsestart__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl_responsestart.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl_responsestart__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl_responsestart.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl_responsestart__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl_responsestart.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl_responsestart__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl_responsestart.range ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl_responsestart__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl_responsestart.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl_responsestart__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl_responsestart.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl_responsestart__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Pageload Dcl Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl_responsestart.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_dcl_responsestart__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_dcl_responsestart.values ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp.range ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp.values ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp_responsestart__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp_responsestart.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp_responsestart__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp_responsestart.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp_responsestart__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp_responsestart.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp_responsestart__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp_responsestart.range ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp_responsestart__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp_responsestart.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp_responsestart__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp_responsestart.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp_responsestart__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Pageload Fcp Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp_responsestart.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_fcp_responsestart__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_fcp_responsestart.values ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time.range ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time.values ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time_responsestart__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time_responsestart.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time_responsestart__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time_responsestart.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time_responsestart__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time_responsestart.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time_responsestart__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time_responsestart.range ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time_responsestart__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time_responsestart.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time_responsestart__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time_responsestart.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time_responsestart__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Pageload Load Time Responsestart"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time_responsestart.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_load_time_responsestart__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_load_time_responsestart.values ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_req_anim_frame_callback__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Pageload Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_req_anim_frame_callback.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_req_anim_frame_callback__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Pageload Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_req_anim_frame_callback.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_req_anim_frame_callback__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Pageload Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_req_anim_frame_callback.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_req_anim_frame_callback__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_req_anim_frame_callback.range ;;
  }

  dimension: metrics__timing_distribution__performance_pageload_req_anim_frame_callback__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Pageload Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_req_anim_frame_callback.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_req_anim_frame_callback__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Pageload Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_req_anim_frame_callback.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_pageload_req_anim_frame_callback__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Pageload Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_req_anim_frame_callback.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_pageload_req_anim_frame_callback__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_pageload_req_anim_frame_callback.values ;;
  }

  dimension: metrics__timing_distribution__performance_responsiveness_req_anim_frame_callback__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Responsiveness Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_responsiveness_req_anim_frame_callback.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_responsiveness_req_anim_frame_callback__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Responsiveness Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_responsiveness_req_anim_frame_callback.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_responsiveness_req_anim_frame_callback__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Responsiveness Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_responsiveness_req_anim_frame_callback.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_responsiveness_req_anim_frame_callback__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_responsiveness_req_anim_frame_callback.range ;;
  }

  dimension: metrics__timing_distribution__performance_responsiveness_req_anim_frame_callback__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Responsiveness Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_responsiveness_req_anim_frame_callback.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_responsiveness_req_anim_frame_callback__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Responsiveness Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_responsiveness_req_anim_frame_callback.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_responsiveness_req_anim_frame_callback__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Responsiveness Req Anim Frame Callback"
    sql: ${TABLE}.metrics.timing_distribution.performance_responsiveness_req_anim_frame_callback.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_responsiveness_req_anim_frame_callback__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_responsiveness_req_anim_frame_callback.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_dom_complete__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Dom Complete"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_complete.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_complete__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Dom Complete"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_complete.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_dom_complete__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Dom Complete"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_complete.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_complete__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_complete.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_dom_complete__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Dom Complete"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_complete.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_complete__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Dom Complete"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_complete.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_dom_complete__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Dom Complete"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_complete.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_complete__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_complete.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_end__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_end.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_end__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_end.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_end__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_end.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_end__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_end.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_end__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_end.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_end__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_end.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_end__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_end.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_end__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_end.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_start__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_start.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_start__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_start.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_start__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_start.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_start__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_start.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_start__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_start.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_start__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_start.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_start__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Dom Content Loaded Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_start.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_content_loaded_start__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_content_loaded_start.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_dom_interactive__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Dom Interactive"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_interactive.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_interactive__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Dom Interactive"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_interactive.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_dom_interactive__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Dom Interactive"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_interactive.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_interactive__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_interactive.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_dom_interactive__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Dom Interactive"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_interactive.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_interactive__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Dom Interactive"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_interactive.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_dom_interactive__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Dom Interactive"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_interactive.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_dom_interactive__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_dom_interactive.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Load Event End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Load Event End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Load Event End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Load Event End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event End"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_no_preload__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Load Event End No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_no_preload.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_no_preload__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Load Event End No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_no_preload.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_no_preload__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event End No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_no_preload.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_no_preload__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_no_preload.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_no_preload__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Load Event End No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_no_preload.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_no_preload__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Load Event End No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_no_preload.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_no_preload__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event End No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_no_preload.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_no_preload__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_no_preload.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_preload__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Load Event End Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_preload.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_preload__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Load Event End Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_preload.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_preload__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event End Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_preload.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_preload__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_preload.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_preload__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Load Event End Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_preload.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_preload__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Load Event End Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_preload.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_preload__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event End Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_preload.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_end_preload__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_end_preload.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_no_preload__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_no_preload.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_no_preload__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_no_preload.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_no_preload__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_no_preload.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_no_preload__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_no_preload.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_no_preload__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_no_preload.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_no_preload__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_no_preload.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_no_preload__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start No Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_no_preload.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_no_preload__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_no_preload.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_preload__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_preload.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_preload__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_preload.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_preload__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_preload.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_preload__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_preload.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_preload__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_preload.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_preload__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_preload.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_preload__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Load Event Start Preload"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_preload.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_load_event_start_preload__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_load_event_start_preload.values ;;
  }

  dimension: metrics__timing_distribution__performance_time_response_start__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Performance Time Response Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_response_start.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_response_start__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Performance Time Response Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_response_start.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_response_start__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Performance Time Response Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_response_start.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_response_start__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_response_start.range ;;
  }

  dimension: metrics__timing_distribution__performance_time_response_start__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Performance Time Response Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_response_start.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_response_start__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Performance Time Response Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_response_start.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__performance_time_response_start__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Performance Time Response Start"
    sql: ${TABLE}.metrics.timing_distribution.performance_time_response_start.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__performance_time_response_start__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.performance_time_response_start.values ;;
  }

  dimension: metrics__timing_distribution__places_manager_read_query_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Places Manager Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_read_query_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_read_query_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Places Manager Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_read_query_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__places_manager_read_query_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Places Manager Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_read_query_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_read_query_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.places_manager_read_query_time.range ;;
  }

  dimension: metrics__timing_distribution__places_manager_read_query_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Places Manager Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_read_query_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_read_query_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Places Manager Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_read_query_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__places_manager_read_query_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Places Manager Read Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_read_query_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_read_query_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.places_manager_read_query_time.values ;;
  }

  dimension: metrics__timing_distribution__places_manager_scan_query_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Places Manager Scan Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_scan_query_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_scan_query_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Places Manager Scan Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_scan_query_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__places_manager_scan_query_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Places Manager Scan Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_scan_query_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_scan_query_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.places_manager_scan_query_time.range ;;
  }

  dimension: metrics__timing_distribution__places_manager_scan_query_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Places Manager Scan Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_scan_query_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_scan_query_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Places Manager Scan Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_scan_query_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__places_manager_scan_query_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Places Manager Scan Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_scan_query_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_scan_query_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.places_manager_scan_query_time.values ;;
  }

  dimension: metrics__timing_distribution__places_manager_write_query_time__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Places Manager Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_write_query_time.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_write_query_time__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Places Manager Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_write_query_time.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__places_manager_write_query_time__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Places Manager Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_write_query_time.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_write_query_time__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.places_manager_write_query_time.range ;;
  }

  dimension: metrics__timing_distribution__places_manager_write_query_time__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Places Manager Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_write_query_time.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_write_query_time__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Places Manager Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_write_query_time.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__places_manager_write_query_time__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Places Manager Write Query Time"
    sql: ${TABLE}.metrics.timing_distribution.places_manager_write_query_time.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__places_manager_write_query_time__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.places_manager_write_query_time.values ;;
  }

  dimension: metrics__timing_distribution__storage_stats_query_stats_duration__bucket_count {
    group_item_label: "Bucket Count"
    group_label: "Metrics Timing Distribution Storage Stats Query Stats Duration"
    sql: ${TABLE}.metrics.timing_distribution.storage_stats_query_stats_duration.bucket_count ;;
    type: number
  }

  dimension: metrics__timing_distribution__storage_stats_query_stats_duration__histogram_type {
    group_item_label: "Histogram Type"
    group_label: "Metrics Timing Distribution Storage Stats Query Stats Duration"
    sql: ${TABLE}.metrics.timing_distribution.storage_stats_query_stats_duration.histogram_type ;;
    type: string
  }

  dimension: metrics__timing_distribution__storage_stats_query_stats_duration__overflow {
    group_item_label: "Overflow"
    group_label: "Metrics Timing Distribution Storage Stats Query Stats Duration"
    sql: ${TABLE}.metrics.timing_distribution.storage_stats_query_stats_duration.overflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__storage_stats_query_stats_duration__range {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.storage_stats_query_stats_duration.range ;;
  }

  dimension: metrics__timing_distribution__storage_stats_query_stats_duration__sum {
    group_item_label: "Sum"
    group_label: "Metrics Timing Distribution Storage Stats Query Stats Duration"
    sql: ${TABLE}.metrics.timing_distribution.storage_stats_query_stats_duration.sum ;;
    type: number
  }

  dimension: metrics__timing_distribution__storage_stats_query_stats_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timing Distribution Storage Stats Query Stats Duration"
    sql: ${TABLE}.metrics.timing_distribution.storage_stats_query_stats_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timing_distribution__storage_stats_query_stats_duration__underflow {
    group_item_label: "Underflow"
    group_label: "Metrics Timing Distribution Storage Stats Query Stats Duration"
    sql: ${TABLE}.metrics.timing_distribution.storage_stats_query_stats_duration.underflow ;;
    type: number
  }

  dimension: metrics__timing_distribution__storage_stats_query_stats_duration__values {
    hidden: yes
    sql: ${TABLE}.metrics.timing_distribution.storage_stats_query_stats_duration.values ;;
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