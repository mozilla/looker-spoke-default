view: metrics {
  sql_table_name: `mozdata.org_mozilla_ios_firefox.metrics` ;;

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

  dimension: metrics__boolean__application_services_bookmark_highlights_visible {
    group_item_label: "Application Services Bookmark Highlights Visible"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.application_services_bookmark_highlights_visible ;;
    type: yesno
  }

  dimension: metrics__boolean__application_services_pocket_stories_visible {
    group_item_label: "Application Services Pocket Stories Visible"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.application_services_pocket_stories_visible ;;
    type: yesno
  }

  dimension: metrics__boolean__application_services_recent_highlights_visible {
    group_item_label: "Application Services Recent Highlights Visible"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.application_services_recent_highlights_visible ;;
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

  dimension: metrics__boolean__preferences_block_popups {
    group_item_label: "Preferences Block Popups"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.preferences_block_popups ;;
    type: yesno
  }

  dimension: metrics__boolean__preferences_close_private_tabs {
    group_item_label: "Preferences Close Private Tabs"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.preferences_close_private_tabs ;;
    type: yesno
  }

  dimension: metrics__boolean__preferences_save_logins {
    group_item_label: "Preferences Save Logins"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.preferences_save_logins ;;
    type: yesno
  }

  dimension: metrics__boolean__preferences_show_clipboard_bar {
    group_item_label: "Preferences Show Clipboard Bar"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.preferences_show_clipboard_bar ;;
    type: yesno
  }

  dimension: metrics__boolean__theme_automatic_mode {
    group_item_label: "Theme Automatic Mode"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.theme_automatic_mode ;;
    type: yesno
  }

  dimension: metrics__boolean__theme_use_system_theme {
    group_item_label: "Theme Use System Theme"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.theme_use_system_theme ;;
    type: yesno
  }

  dimension: metrics__boolean__tracking_protection_enabled {
    group_item_label: "Tracking Protection Enabled"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.tracking_protection_enabled ;;
    type: yesno
  }

  dimension: metrics__counter__app_opened_as_default_browser {
    group_item_label: "App Opened As Default Browser"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.app_opened_as_default_browser ;;
    type: number
  }

  dimension: metrics__counter__default_browser_card_dismiss_pressed {
    group_item_label: "Default Browser Card Dismiss Pressed"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.default_browser_card_dismiss_pressed ;;
    type: number
  }

  dimension: metrics__counter__default_browser_card_go_to_settings_pressed {
    group_item_label: "Default Browser Card Go To Settings Pressed"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.default_browser_card_go_to_settings_pressed ;;
    type: number
  }

  dimension: metrics__counter__default_browser_onboarding_dismiss_pressed {
    group_item_label: "Default Browser Onboarding Dismiss Pressed"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.default_browser_onboarding_dismiss_pressed ;;
    type: number
  }

  dimension: metrics__counter__default_browser_onboarding_go_to_settings_pressed {
    group_item_label: "Default Browser Onboarding Go To Settings Pressed"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.default_browser_onboarding_go_to_settings_pressed ;;
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

  dimension: metrics__counter__pocket_open_story {
    group_item_label: "Pocket Open Story"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.pocket_open_story ;;
    type: number
  }

  dimension: metrics__counter__qr_code_scanned {
    group_item_label: "Qr Code Scanned"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.qr_code_scanned ;;
    type: number
  }

  dimension: metrics__counter__reader_mode_close {
    group_item_label: "Reader Mode Close"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.reader_mode_close ;;
    type: number
  }

  dimension: metrics__counter__reader_mode_open {
    group_item_label: "Reader Mode Open"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.reader_mode_open ;;
    type: number
  }

  dimension: metrics__counter__reading_list_mark_read {
    group_item_label: "Reading List Mark Read"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.reading_list_mark_read ;;
    type: number
  }

  dimension: metrics__counter__reading_list_mark_unread {
    group_item_label: "Reading List Mark Unread"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.reading_list_mark_unread ;;
    type: number
  }

  dimension: metrics__counter__reading_list_open {
    group_item_label: "Reading List Open"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.reading_list_open ;;
    type: number
  }

  dimension: metrics__counter__search_start_search_pressed {
    group_item_label: "Search Start Search Pressed"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.search_start_search_pressed ;;
    type: number
  }

  dimension: metrics__counter__settings_menu_set_as_default_browser_pressed {
    group_item_label: "Settings Menu Set As Default Browser Pressed"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.settings_menu_set_as_default_browser_pressed ;;
    type: number
  }

  dimension: metrics__counter__tabs_cumulative_count {
    group_item_label: "Tabs Cumulative Count"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.tabs_cumulative_count ;;
    type: number
  }

  dimension: metrics__counter__tabs_new_tab_pressed {
    group_item_label: "Tabs New Tab Pressed"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.tabs_new_tab_pressed ;;
    type: number
  }

  dimension: metrics__counter__widget_l_tabs_open_url {
    group_item_label: "Widget L Tabs Open Url"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.widget_l_tabs_open_url ;;
    type: number
  }

  dimension: metrics__counter__widget_m_quick_action_close_private {
    group_item_label: "Widget M Quick Action Close Private"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.widget_m_quick_action_close_private ;;
    type: number
  }

  dimension: metrics__counter__widget_m_quick_action_copied_link {
    group_item_label: "Widget M Quick Action Copied Link"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.widget_m_quick_action_copied_link ;;
    type: number
  }

  dimension: metrics__counter__widget_m_quick_action_private_search {
    group_item_label: "Widget M Quick Action Private Search"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.widget_m_quick_action_private_search ;;
    type: number
  }

  dimension: metrics__counter__widget_m_quick_action_search {
    group_item_label: "Widget M Quick Action Search"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.widget_m_quick_action_search ;;
    type: number
  }

  dimension: metrics__counter__widget_m_tabs_open_url {
    group_item_label: "Widget M Tabs Open Url"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.widget_m_tabs_open_url ;;
    type: number
  }

  dimension: metrics__counter__widget_m_top_sites_widget {
    group_item_label: "Widget M Top Sites Widget"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.widget_m_top_sites_widget ;;
    type: number
  }

  dimension: metrics__counter__widget_s_quick_action_search {
    group_item_label: "Widget S Quick Action Search"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.widget_s_quick_action_search ;;
    type: number
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

  dimension: metrics__labeled_counter__bookmarks_add {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.bookmarks_add ;;
  }

  dimension: metrics__labeled_counter__bookmarks_delete {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.bookmarks_delete ;;
  }

  dimension: metrics__labeled_counter__bookmarks_open {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.bookmarks_open ;;
  }

  dimension: metrics__labeled_counter__bookmarks_view_list {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.bookmarks_view_list ;;
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

  dimension: metrics__labeled_counter__reading_list_add {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.reading_list_add ;;
  }

  dimension: metrics__labeled_counter__reading_list_delete {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.reading_list_delete ;;
  }

  dimension: metrics__labeled_counter__search_counts {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.search_counts ;;
  }

  dimension: metrics__labeled_counter__search_google_topsite_pressed {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.search_google_topsite_pressed ;;
  }

  dimension: metrics__labeled_counter__search_in_content {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.search_in_content ;;
  }

  dimension: metrics__labeled_counter__tabs_close {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_close ;;
  }

  dimension: metrics__labeled_counter__tabs_close_all {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_close_all ;;
  }

  dimension: metrics__labeled_counter__tabs_open {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_open ;;
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

  dimension: metrics__string__ping_reason {
    group_item_label: "Ping Reason"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.ping_reason ;;
    type: string
  }

  dimension: metrics__string__preferences_mail_client {
    group_item_label: "Preferences Mail Client"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.preferences_mail_client ;;
    type: string
  }

  dimension: metrics__string__preferences_new_tab_experience {
    group_item_label: "Preferences New Tab Experience"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.preferences_new_tab_experience ;;
    type: string
  }

  dimension: metrics__string__search_default_engine {
    group_item_label: "Search Default Engine"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.search_default_engine ;;
    type: string
  }

  dimension: metrics__string__theme_automatic_slider_value {
    group_item_label: "Theme Automatic Slider Value"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.theme_automatic_slider_value ;;
    type: string
  }

  dimension: metrics__string__theme_name {
    group_item_label: "Theme Name"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.theme_name ;;
    type: string
  }

  dimension: metrics__string__tracking_protection_strength {
    group_item_label: "Tracking Protection Strength"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.tracking_protection_strength ;;
    type: string
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