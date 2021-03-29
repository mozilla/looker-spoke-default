# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: unified_metrics {
  hidden: no

  join: unified_metrics__events {
    view_label: "Unified Metrics: Events"
    sql: LEFT JOIN UNNEST(${unified_metrics.events}) as unified_metrics__events ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__jwe {
    view_label: "Unified Metrics: Metrics Jwe"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__jwe}) as unified_metrics__metrics__jwe ;;
    relationship: one_to_many
  }

  join: unified_metrics__events__extra {
    view_label: "Unified Metrics: Events Extra"
    sql: LEFT JOIN UNNEST(${unified_metrics__events.extra}) as unified_metrics__events__extra ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_rate {
    view_label: "Unified Metrics: Metrics Labeled Rate"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_rate}) as unified_metrics__metrics__labeled_rate ;;
    relationship: one_to_many
  }

  join: unified_metrics__ping_info__experiments {
    view_label: "Unified Metrics: Ping Info Experiments"
    sql: LEFT JOIN UNNEST(${unified_metrics.ping_info__experiments}) as unified_metrics__ping_info__experiments ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_rate__value {
    view_label: "Unified Metrics: Metrics Labeled Rate Value"
    sql: LEFT JOIN UNNEST(${unified_metrics__metrics__labeled_rate.value}) as unified_metrics__metrics__labeled_rate__value ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__tabs_open {
    view_label: "Unified Metrics: Metrics Labeled Counter Tabs Open"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__tabs_open}) as unified_metrics__metrics__labeled_counter__tabs_open ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__tabs_close {
    view_label: "Unified Metrics: Metrics Labeled Counter Tabs Close"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__tabs_close}) as unified_metrics__metrics__labeled_counter__tabs_close ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__bookmarks_add {
    view_label: "Unified Metrics: Metrics Labeled Counter Bookmarks Add"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__bookmarks_add}) as unified_metrics__metrics__labeled_counter__bookmarks_add ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__search_counts {
    view_label: "Unified Metrics: Metrics Labeled Counter Search Counts"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__search_counts}) as unified_metrics__metrics__labeled_counter__search_counts ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__bookmarks_open {
    view_label: "Unified Metrics: Metrics Labeled Counter Bookmarks Open"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__bookmarks_open}) as unified_metrics__metrics__labeled_counter__bookmarks_open ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__tabs_close_all {
    view_label: "Unified Metrics: Metrics Labeled Counter Tabs Close All"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__tabs_close_all}) as unified_metrics__metrics__labeled_counter__tabs_close_all ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__bookmarks_delete {
    view_label: "Unified Metrics: Metrics Labeled Counter Bookmarks Delete"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__bookmarks_delete}) as unified_metrics__metrics__labeled_counter__bookmarks_delete ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__reading_list_add {
    view_label: "Unified Metrics: Metrics Labeled Counter Reading List Add"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__reading_list_add}) as unified_metrics__metrics__labeled_counter__reading_list_add ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__search_in_content {
    view_label: "Unified Metrics: Metrics Labeled Counter Search In Content"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__search_in_content}) as unified_metrics__metrics__labeled_counter__search_in_content ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__string__glean_database_size__values {
    view_label: "Unified Metrics: Metrics String Glean Database Size Values"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__string__glean_database_size__values}) as unified_metrics__metrics__string__glean_database_size__values ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__bookmarks_view_list {
    view_label: "Unified Metrics: Metrics Labeled Counter Bookmarks View List"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__bookmarks_view_list}) as unified_metrics__metrics__labeled_counter__bookmarks_view_list ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__reading_list_delete {
    view_label: "Unified Metrics: Metrics Labeled Counter Reading List Delete"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__reading_list_delete}) as unified_metrics__metrics__labeled_counter__reading_list_delete ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__glean_error_invalid_label {
    view_label: "Unified Metrics: Metrics Labeled Counter Glean Error Invalid Label"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__glean_error_invalid_label}) as unified_metrics__metrics__labeled_counter__glean_error_invalid_label ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__glean_error_invalid_state {
    view_label: "Unified Metrics: Metrics Labeled Counter Glean Error Invalid State"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__glean_error_invalid_state}) as unified_metrics__metrics__labeled_counter__glean_error_invalid_state ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__glean_error_invalid_value {
    view_label: "Unified Metrics: Metrics Labeled Counter Glean Error Invalid Value"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__glean_error_invalid_value}) as unified_metrics__metrics__labeled_counter__glean_error_invalid_value ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__glean_error_invalid_overflow {
    view_label: "Unified Metrics: Metrics Labeled Counter Glean Error Invalid Overflow"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__glean_error_invalid_overflow}) as unified_metrics__metrics__labeled_counter__glean_error_invalid_overflow ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__search_google_topsite_pressed {
    view_label: "Unified Metrics: Metrics Labeled Counter Search Google Topsite Pressed"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__search_google_topsite_pressed}) as unified_metrics__metrics__labeled_counter__search_google_topsite_pressed ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__glean_validation_pings_submitted {
    view_label: "Unified Metrics: Metrics Labeled Counter Glean Validation Pings Submitted"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__glean_validation_pings_submitted}) as unified_metrics__metrics__labeled_counter__glean_validation_pings_submitted ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__glean_upload_ping_upload_failure {
    view_label: "Unified Metrics: Metrics Labeled Counter Glean Upload Ping Upload Failure"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__labeled_counter__glean_upload_ping_upload_failure}) as unified_metrics__metrics__labeled_counter__glean_upload_ping_upload_failure ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__string__glean_upload_pending_pings_directory_size__values {
    view_label: "Unified Metrics: Metrics String Glean Upload Pending Pings Directory Size Values"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__string__glean_upload_pending_pings_directory_size__values}) as unified_metrics__metrics__string__glean_upload_pending_pings_directory_size__values ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__string__glean_upload_discarded_exceeding_pings_size__values {
    view_label: "Unified Metrics: Metrics String Glean Upload Discarded Exceeding Pings Size Values"
    sql: LEFT JOIN UNNEST(${unified_metrics.metrics__string__glean_upload_discarded_exceeding_pings_size__values}) as unified_metrics__metrics__string__glean_upload_discarded_exceeding_pings_size__values ;;
    relationship: one_to_many
  }
}

view: unified_metrics {
  sql_table_name: `moz-fx-data-shared-prod.org_mozilla_ios_firefox.unified_metrics`
    ;;

  dimension: additional_properties {
    type: string
    sql: ${TABLE}.additional_properties ;;
  }

  dimension: client_info__android_sdk_version {
    type: string
    sql: ${TABLE}.client_info.android_sdk_version ;;
    group_label: "Client Info"
    group_item_label: "Android Sdk Version"
  }

  dimension: client_info__app_build {
    type: string
    sql: ${TABLE}.client_info.app_build ;;
    group_label: "Client Info"
    group_item_label: "App Build"
  }

  dimension: client_info__app_channel {
    type: string
    sql: ${TABLE}.client_info.app_channel ;;
    group_label: "Client Info"
    group_item_label: "App Channel"
  }

  dimension: client_info__app_display_version {
    type: string
    sql: ${TABLE}.client_info.app_display_version ;;
    group_label: "Client Info"
    group_item_label: "App Display Version"
  }

  dimension: client_info__architecture {
    type: string
    sql: ${TABLE}.client_info.architecture ;;
    group_label: "Client Info"
    group_item_label: "Architecture"
  }

  dimension: client_info__client_id {
    type: string
    sql: ${TABLE}.client_info.client_id ;;
    group_label: "Client Info"
    group_item_label: "Client ID"
  }

  dimension: client_info__device_manufacturer {
    type: string
    sql: ${TABLE}.client_info.device_manufacturer ;;
    group_label: "Client Info"
    group_item_label: "Device Manufacturer"
  }

  dimension: client_info__device_model {
    type: string
    sql: ${TABLE}.client_info.device_model ;;
    group_label: "Client Info"
    group_item_label: "Device Model"
  }

  dimension: client_info__first_run_date {
    type: string
    sql: ${TABLE}.client_info.first_run_date ;;
    group_label: "Client Info"
    group_item_label: "First Run Date"
  }

  dimension: client_info__locale {
    type: string
    sql: ${TABLE}.client_info.locale ;;
    group_label: "Client Info"
    group_item_label: "Locale"
  }

  dimension: client_info__os {
    type: string
    sql: ${TABLE}.client_info.os ;;
    group_label: "Client Info"
    group_item_label: "OS"
  }

  dimension: client_info__os_version {
    type: string
    sql: ${TABLE}.client_info.os_version ;;
    group_label: "Client Info"
    group_item_label: "OS Version"
  }

  dimension: client_info__telemetry_sdk_build {
    type: string
    sql: ${TABLE}.client_info.telemetry_sdk_build ;;
    group_label: "Client Info"
    group_item_label: "Telemetry Sdk Build"
  }

  dimension: document_id {
    type: string
    sql: ${TABLE}.document_id ;;
  }

  dimension: events {
    hidden: yes
    sql: ${TABLE}.events ;;
  }

  dimension: metadata__geo__city {
    type: string
    sql: ${TABLE}.metadata.geo.city ;;
    group_label: "Metadata Geo"
    group_item_label: "City"
  }

  dimension: metadata__geo__country {
    type: string
    sql: ${TABLE}.metadata.geo.country ;;
    group_label: "Metadata Geo"
    group_item_label: "Country"
  }

  dimension: metadata__geo__db_version {
    type: string
    sql: ${TABLE}.metadata.geo.db_version ;;
    group_label: "Metadata Geo"
    group_item_label: "Db Version"
  }

  dimension: metadata__geo__subdivision1 {
    type: string
    sql: ${TABLE}.metadata.geo.subdivision1 ;;
    group_label: "Metadata Geo"
    group_item_label: "Subdivision1"
  }

  dimension: metadata__geo__subdivision2 {
    type: string
    sql: ${TABLE}.metadata.geo.subdivision2 ;;
    group_label: "Metadata Geo"
    group_item_label: "Subdivision2"
  }

  dimension: metadata__header__date {
    type: string
    sql: ${TABLE}.metadata.header.date ;;
    group_label: "Metadata Header"
    group_item_label: "Date"
  }

  dimension: metadata__header__dnt {
    type: string
    sql: ${TABLE}.metadata.header.dnt ;;
    group_label: "Metadata Header"
    group_item_label: "Dnt"
  }

  dimension: metadata__header__x_debug_id {
    type: string
    sql: ${TABLE}.metadata.header.x_debug_id ;;
    group_label: "Metadata Header"
    group_item_label: "X Debug ID"
  }

  dimension: metadata__header__x_pingsender_version {
    type: string
    sql: ${TABLE}.metadata.header.x_pingsender_version ;;
    group_label: "Metadata Header"
    group_item_label: "X Pingsender Version"
  }

  dimension: metadata__header__x_source_tags {
    type: string
    sql: ${TABLE}.metadata.header.x_source_tags ;;
    group_label: "Metadata Header"
    group_item_label: "X Source Tags"
  }

  dimension: metadata__isp__db_version {
    type: string
    sql: ${TABLE}.metadata.isp.db_version ;;
    group_label: "Metadata ISP"
    group_item_label: "Db Version"
  }

  dimension: metadata__isp__name {
    type: string
    sql: ${TABLE}.metadata.isp.name ;;
    group_label: "Metadata ISP"
    group_item_label: "Name"
  }

  dimension: metadata__isp__organization {
    type: string
    sql: ${TABLE}.metadata.isp.organization ;;
    group_label: "Metadata ISP"
    group_item_label: "Organization"
  }

  dimension: metadata__user_agent__browser {
    type: string
    sql: ${TABLE}.metadata.user_agent.browser ;;
    group_label: "Metadata User Agent"
    group_item_label: "Browser"
  }

  dimension: metadata__user_agent__os {
    type: string
    sql: ${TABLE}.metadata.user_agent.os ;;
    group_label: "Metadata User Agent"
    group_item_label: "OS"
  }

  dimension: metadata__user_agent__version {
    type: string
    sql: ${TABLE}.metadata.user_agent.version ;;
    group_label: "Metadata User Agent"
    group_item_label: "Version"
  }

  dimension: metrics__boolean__application_services_bookmark_highlights_visible {
    type: yesno
    sql: ${TABLE}.metrics.boolean.application_services_bookmark_highlights_visible ;;
    group_label: "Metrics Boolean"
    group_item_label: "Application Services Bookmark Highlights Visible"
  }

  dimension: metrics__boolean__application_services_pocket_stories_visible {
    type: yesno
    sql: ${TABLE}.metrics.boolean.application_services_pocket_stories_visible ;;
    group_label: "Metrics Boolean"
    group_item_label: "Application Services Pocket Stories Visible"
  }

  dimension: metrics__boolean__application_services_recent_highlights_visible {
    type: yesno
    sql: ${TABLE}.metrics.boolean.application_services_recent_highlights_visible ;;
    group_label: "Metrics Boolean"
    group_item_label: "Application Services Recent Highlights Visible"
  }

  dimension: metrics__boolean__glean_core_migration_successful {
    type: yesno
    sql: ${TABLE}.metrics.boolean.glean_core_migration_successful ;;
    group_label: "Metrics Boolean"
    group_item_label: "Glean Core Migration Successful"
  }

  dimension: metrics__boolean__glean_error_preinit_tasks_timeout {
    type: yesno
    sql: ${TABLE}.metrics.boolean.glean_error_preinit_tasks_timeout ;;
    group_label: "Metrics Boolean"
    group_item_label: "Glean Error Preinit Tasks Timeout"
  }

  dimension: metrics__boolean__preferences_block_popups {
    type: yesno
    sql: ${TABLE}.metrics.boolean.preferences_block_popups ;;
    group_label: "Metrics Boolean"
    group_item_label: "Preferences Block Popups"
  }

  dimension: metrics__boolean__preferences_close_private_tabs {
    type: yesno
    sql: ${TABLE}.metrics.boolean.preferences_close_private_tabs ;;
    group_label: "Metrics Boolean"
    group_item_label: "Preferences Close Private Tabs"
  }

  dimension: metrics__boolean__preferences_save_logins {
    type: yesno
    sql: ${TABLE}.metrics.boolean.preferences_save_logins ;;
    group_label: "Metrics Boolean"
    group_item_label: "Preferences Save Logins"
  }

  dimension: metrics__boolean__preferences_show_clipboard_bar {
    type: yesno
    sql: ${TABLE}.metrics.boolean.preferences_show_clipboard_bar ;;
    group_label: "Metrics Boolean"
    group_item_label: "Preferences Show Clipboard Bar"
  }

  dimension: metrics__boolean__theme_automatic_mode {
    type: yesno
    sql: ${TABLE}.metrics.boolean.theme_automatic_mode ;;
    group_label: "Metrics Boolean"
    group_item_label: "Theme Automatic Mode"
  }

  dimension: metrics__boolean__theme_use_system_theme {
    type: yesno
    sql: ${TABLE}.metrics.boolean.theme_use_system_theme ;;
    group_label: "Metrics Boolean"
    group_item_label: "Theme Use System Theme"
  }

  dimension: metrics__boolean__tracking_protection_enabled {
    type: yesno
    sql: ${TABLE}.metrics.boolean.tracking_protection_enabled ;;
    group_label: "Metrics Boolean"
    group_item_label: "Tracking Protection Enabled"
  }

  dimension: metrics__counter__app_opened_as_default_browser {
    type: number
    sql: ${TABLE}.metrics.counter.app_opened_as_default_browser ;;
    group_label: "Metrics Counter"
    group_item_label: "App Opened As Default Browser"
  }

  dimension: metrics__counter__default_browser_card_dismiss_pressed {
    type: number
    sql: ${TABLE}.metrics.counter.default_browser_card_dismiss_pressed ;;
    group_label: "Metrics Counter"
    group_item_label: "Default Browser Card Dismiss Pressed"
  }

  dimension: metrics__counter__default_browser_card_go_to_settings_pressed {
    type: number
    sql: ${TABLE}.metrics.counter.default_browser_card_go_to_settings_pressed ;;
    group_label: "Metrics Counter"
    group_item_label: "Default Browser Card Go to Settings Pressed"
  }

  dimension: metrics__counter__default_browser_onboarding_dismiss_pressed {
    type: number
    sql: ${TABLE}.metrics.counter.default_browser_onboarding_dismiss_pressed ;;
    group_label: "Metrics Counter"
    group_item_label: "Default Browser Onboarding Dismiss Pressed"
  }

  dimension: metrics__counter__default_browser_onboarding_go_to_settings_pressed {
    type: number
    sql: ${TABLE}.metrics.counter.default_browser_onboarding_go_to_settings_pressed ;;
    group_label: "Metrics Counter"
    group_item_label: "Default Browser Onboarding Go to Settings Pressed"
  }

  dimension: metrics__counter__glean_error_io {
    type: number
    sql: ${TABLE}.metrics.counter.glean_error_io ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Error Io"
  }

  dimension: metrics__counter__glean_error_preinit_tasks_overflow {
    type: number
    sql: ${TABLE}.metrics.counter.glean_error_preinit_tasks_overflow ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Error Preinit Tasks Overflow"
  }

  dimension: metrics__counter__glean_upload_deleted_pings_after_quota_hit {
    type: number
    sql: ${TABLE}.metrics.counter.glean_upload_deleted_pings_after_quota_hit ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Upload Deleted Pings After Quota Hit"
  }

  dimension: metrics__counter__glean_upload_pending_pings {
    type: number
    sql: ${TABLE}.metrics.counter.glean_upload_pending_pings ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Upload Pending Pings"
  }

  dimension: metrics__counter__glean_validation_app_forceclosed_count {
    type: number
    sql: ${TABLE}.metrics.counter.glean_validation_app_forceclosed_count ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Validation App Forceclosed Count"
  }

  dimension: metrics__counter__glean_validation_baseline_ping_count {
    type: number
    sql: ${TABLE}.metrics.counter.glean_validation_baseline_ping_count ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Validation Baseline Ping Count"
  }

  dimension: metrics__counter__glean_validation_foreground_count {
    type: number
    sql: ${TABLE}.metrics.counter.glean_validation_foreground_count ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Validation Foreground Count"
  }

  dimension: metrics__counter__pocket_open_story {
    type: number
    sql: ${TABLE}.metrics.counter.pocket_open_story ;;
    group_label: "Metrics Counter"
    group_item_label: "Pocket Open Story"
  }

  dimension: metrics__counter__qr_code_scanned {
    type: number
    sql: ${TABLE}.metrics.counter.qr_code_scanned ;;
    group_label: "Metrics Counter"
    group_item_label: "Qr Code Scanned"
  }

  dimension: metrics__counter__reader_mode_close {
    type: number
    sql: ${TABLE}.metrics.counter.reader_mode_close ;;
    group_label: "Metrics Counter"
    group_item_label: "Reader Mode Close"
  }

  dimension: metrics__counter__reader_mode_open {
    type: number
    sql: ${TABLE}.metrics.counter.reader_mode_open ;;
    group_label: "Metrics Counter"
    group_item_label: "Reader Mode Open"
  }

  measure: reader_mode_open_count {
    type:  sum
    sql:  ${metrics__counter__reader_mode_open} ;;
  }

  dimension: metrics__counter__reading_list_mark_read {
    type: number
    sql: ${TABLE}.metrics.counter.reading_list_mark_read ;;
    group_label: "Metrics Counter"
    group_item_label: "Reading List Mark Read"
  }

  dimension: metrics__counter__reading_list_mark_unread {
    type: number
    sql: ${TABLE}.metrics.counter.reading_list_mark_unread ;;
    group_label: "Metrics Counter"
    group_item_label: "Reading List Mark Unread"
  }

  dimension: metrics__counter__reading_list_open {
    type: number
    sql: ${TABLE}.metrics.counter.reading_list_open ;;
    group_label: "Metrics Counter"
    group_item_label: "Reading List Open"
  }

  dimension: metrics__counter__search_start_search_pressed {
    type: number
    sql: ${TABLE}.metrics.counter.search_start_search_pressed ;;
    group_label: "Metrics Counter"
    group_item_label: "Search Start Search Pressed"
  }

  dimension: metrics__counter__settings_menu_set_as_default_browser_pressed {
    type: number
    sql: ${TABLE}.metrics.counter.settings_menu_set_as_default_browser_pressed ;;
    group_label: "Metrics Counter"
    group_item_label: "Settings Menu Set As Default Browser Pressed"
  }

  dimension: metrics__counter__tabs_cumulative_count {
    type: number
    sql: ${TABLE}.metrics.counter.tabs_cumulative_count ;;
    group_label: "Metrics Counter"
    group_item_label: "Tabs Cumulative Count"
  }

  dimension: metrics__counter__tabs_new_tab_pressed {
    type: number
    sql: ${TABLE}.metrics.counter.tabs_new_tab_pressed ;;
    group_label: "Metrics Counter"
    group_item_label: "Tabs New Tab Pressed"
  }

  dimension: metrics__counter__widget_l_tabs_open_url {
    type: number
    sql: ${TABLE}.metrics.counter.widget_l_tabs_open_url ;;
    group_label: "Metrics Counter"
    group_item_label: "Widget L Tabs Open URL"
  }

  dimension: metrics__counter__widget_m_quick_action_close_private {
    type: number
    sql: ${TABLE}.metrics.counter.widget_m_quick_action_close_private ;;
    group_label: "Metrics Counter"
    group_item_label: "Widget M Quick Action Close Private"
  }

  dimension: metrics__counter__widget_m_quick_action_copied_link {
    type: number
    sql: ${TABLE}.metrics.counter.widget_m_quick_action_copied_link ;;
    group_label: "Metrics Counter"
    group_item_label: "Widget M Quick Action Copied Link"
  }

  dimension: metrics__counter__widget_m_quick_action_private_search {
    type: number
    sql: ${TABLE}.metrics.counter.widget_m_quick_action_private_search ;;
    group_label: "Metrics Counter"
    group_item_label: "Widget M Quick Action Private Search"
  }

  dimension: metrics__counter__widget_m_quick_action_search {
    type: number
    sql: ${TABLE}.metrics.counter.widget_m_quick_action_search ;;
    group_label: "Metrics Counter"
    group_item_label: "Widget M Quick Action Search"
  }

  dimension: metrics__counter__widget_m_tabs_open_url {
    type: number
    sql: ${TABLE}.metrics.counter.widget_m_tabs_open_url ;;
    group_label: "Metrics Counter"
    group_item_label: "Widget M Tabs Open URL"
  }

  dimension: metrics__counter__widget_m_top_sites_widget {
    type: number
    sql: ${TABLE}.metrics.counter.widget_m_top_sites_widget ;;
    group_label: "Metrics Counter"
    group_item_label: "Widget M Top Sites Widget"
  }

  dimension: metrics__counter__widget_s_quick_action_search {
    type: number
    sql: ${TABLE}.metrics.counter.widget_s_quick_action_search ;;
    group_label: "Metrics Counter"
    group_item_label: "Widget S Quick Action Search"
  }

  dimension: metrics__datetime__glean_validation_first_run_hour {
    type: string
    sql: ${TABLE}.metrics.datetime.glean_validation_first_run_hour ;;
    group_label: "Metrics Datetime"
    group_item_label: "Glean Validation First Run Hour"
  }

  dimension: metrics__jwe {
    hidden: yes
    sql: ${TABLE}.metrics.jwe ;;
    group_label: "Metrics"
    group_item_label: "Jwe"
  }

  dimension: metrics__labeled_counter__bookmarks_add {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.bookmarks_add ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Bookmarks Add"
  }

  dimension: metrics__labeled_counter__bookmarks_delete {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.bookmarks_delete ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Bookmarks Delete"
  }

  dimension: metrics__labeled_counter__bookmarks_open {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.bookmarks_open ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Bookmarks Open"
  }

  dimension: metrics__labeled_counter__bookmarks_view_list {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.bookmarks_view_list ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Bookmarks View List"
  }

  dimension: metrics__labeled_counter__glean_error_invalid_label {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_label ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Error Invalid Label"
  }

  dimension: metrics__labeled_counter__glean_error_invalid_overflow {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_overflow ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Error Invalid Overflow"
  }

  dimension: metrics__labeled_counter__glean_error_invalid_state {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_state ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Error Invalid State"
  }

  dimension: metrics__labeled_counter__glean_error_invalid_value {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_error_invalid_value ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Error Invalid Value"
  }

  dimension: metrics__labeled_counter__glean_upload_ping_upload_failure {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_upload_ping_upload_failure ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Upload Ping Upload Failure"
  }

  dimension: metrics__labeled_counter__glean_validation_pings_submitted {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.glean_validation_pings_submitted ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Glean Validation Pings Submitted"
  }

  dimension: metrics__labeled_counter__reading_list_add {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.reading_list_add ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Reading List Add"
  }

  dimension: metrics__labeled_counter__reading_list_delete {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.reading_list_delete ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Reading List Delete"
  }

  dimension: metrics__labeled_counter__search_counts {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.search_counts ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Search Counts"
  }


  dimension: metrics__labeled_counter__search_google_topsite_pressed {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.search_google_topsite_pressed ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Search Google Topsite Pressed"
  }

  dimension: metrics__labeled_counter__search_in_content {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.search_in_content ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Search In Content"
  }

  dimension: metrics__labeled_counter__tabs_close {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_close ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Tabs Close"
  }

  dimension: metrics__labeled_counter__tabs_close_all {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_close_all ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Tabs Close All"
  }

  dimension: metrics__labeled_counter__tabs_open {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_open ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Tabs Open"
  }

  dimension: metrics__labeled_rate {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_rate ;;
    group_label: "Metrics"
    group_item_label: "Labeled Rate"
  }

  dimension: metrics__string__glean_database_size__sum {
    type: number
    sql: ${TABLE}.metrics.string.glean_database_size.sum ;;
    group_label: "Metrics String Glean Database Size"
    group_item_label: "Sum"
  }

  dimension: metrics__string__glean_database_size__values {
    hidden: yes
    sql: ${TABLE}.metrics.string.glean_database_size.values ;;
    group_label: "Metrics String Glean Database Size"
    group_item_label: "Values"
  }

  dimension: metrics__string__glean_upload_discarded_exceeding_pings_size__sum {
    type: number
    sql: ${TABLE}.metrics.string.glean_upload_discarded_exceeding_pings_size.sum ;;
    group_label: "Metrics String Glean Upload Discarded Exceeding Pings Size"
    group_item_label: "Sum"
  }

  dimension: metrics__string__glean_upload_discarded_exceeding_pings_size__values {
    hidden: yes
    sql: ${TABLE}.metrics.string.glean_upload_discarded_exceeding_pings_size.values ;;
    group_label: "Metrics String Glean Upload Discarded Exceeding Pings Size"
    group_item_label: "Values"
  }

  dimension: metrics__string__glean_upload_pending_pings_directory_size__sum {
    type: number
    sql: ${TABLE}.metrics.string.glean_upload_pending_pings_directory_size.sum ;;
    group_label: "Metrics String Glean Upload Pending Pings Directory Size"
    group_item_label: "Sum"
  }

  dimension: metrics__string__glean_upload_pending_pings_directory_size__values {
    hidden: yes
    sql: ${TABLE}.metrics.string.glean_upload_pending_pings_directory_size.values ;;
    group_label: "Metrics String Glean Upload Pending Pings Directory Size"
    group_item_label: "Values"
  }

  dimension: metrics__string__ping_reason {
    type: string
    sql: ${TABLE}.metrics.string.ping_reason ;;
    group_label: "Metrics String"
    group_item_label: "Ping Reason"
  }

  dimension: metrics__string__preferences_mail_client {
    type: string
    sql: ${TABLE}.metrics.string.preferences_mail_client ;;
    group_label: "Metrics String"
    group_item_label: "Preferences Mail Client"
  }

  dimension: metrics__string__preferences_new_tab_experience {
    type: string
    sql: ${TABLE}.metrics.string.preferences_new_tab_experience ;;
    group_label: "Metrics String"
    group_item_label: "Preferences New Tab Experience"
  }

  dimension: metrics__string__search_default_engine {
    type: string
    sql: ${TABLE}.metrics.string.search_default_engine ;;
    group_label: "Metrics String"
    group_item_label: "Search Default Engine"
  }

  dimension: metrics__string__theme_automatic_slider_value {
    type: string
    sql: ${TABLE}.metrics.string.theme_automatic_slider_value ;;
    group_label: "Metrics String"
    group_item_label: "Theme Automatic Slider Value"
  }

  dimension: metrics__string__theme_name {
    type: string
    sql: ${TABLE}.metrics.string.theme_name ;;
    group_label: "Metrics String"
    group_item_label: "Theme Name"
  }

  dimension: metrics__string__tracking_protection_strength {
    type: string
    sql: ${TABLE}.metrics.string.tracking_protection_strength ;;
    group_label: "Metrics String"
    group_item_label: "Tracking Protection Strength"
  }

  dimension: normalized_app_name {
    type: string
    sql: ${TABLE}.normalized_app_name ;;
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: normalized_os {
    type: string
    sql: ${TABLE}.normalized_os ;;
  }

  dimension: normalized_os_version {
    type: string
    sql: ${TABLE}.normalized_os_version ;;
  }

  dimension: ping_info__end_time {
    type: string
    sql: ${TABLE}.ping_info.end_time ;;
    group_label: "Ping Info"
    group_item_label: "End Time"
  }

  dimension: ping_info__experiments {
    hidden: yes
    sql: ${TABLE}.ping_info.experiments ;;
    group_label: "Ping Info"
    group_item_label: "Experiments"
  }

  dimension: ping_info__ping_type {
    type: string
    sql: ${TABLE}.ping_info.ping_type ;;
    group_label: "Ping Info"
    group_item_label: "Ping Type"
  }

  dimension: ping_info__reason {
    type: string
    sql: ${TABLE}.ping_info.reason ;;
    group_label: "Ping Info"
    group_item_label: "Reason"
  }

  dimension: ping_info__seq {
    type: number
    sql: ${TABLE}.ping_info.seq ;;
    group_label: "Ping Info"
    group_item_label: "Seq"
  }

  dimension: ping_info__start_time {
    type: string
    sql: ${TABLE}.ping_info.start_time ;;
    group_label: "Ping Info"
    group_item_label: "Start Time"
  }

  dimension: sample_id {
    type: number
    sql: ${TABLE}.sample_id ;;
  }

  dimension_group: submission_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.submission_timestamp ;;
  }

  dimension: telemetry_system {
    type: string
    sql: ${TABLE}.telemetry_system ;;
  }

  measure: count {
    type: count
    drill_fields: [normalized_app_name, metadata__isp__name, metrics__string__theme_name]
  }
}

view: unified_metrics__events {
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: extra {
    hidden: yes
    sql: ${TABLE}.extra ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }
}

view: unified_metrics__metrics__jwe {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__events__extra {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_rate {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__ping_info__experiments {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__branch {
    type: string
    sql: ${TABLE}.value.branch ;;
    group_label: "Value"
    group_item_label: "Branch"
  }

  dimension: value__extra__type {
    type: string
    sql: ${TABLE}.value.extra.type ;;
    group_label: "Value Extra"
    group_item_label: "Type"
  }
}

view: unified_metrics__metrics__labeled_rate__value {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__denominator {
    type: number
    sql: ${TABLE}.value.denominator ;;
    group_label: "Value"
    group_item_label: "Denominator"
  }

  dimension: value__numerator {
    type: number
    sql: ${TABLE}.value.numerator ;;
    group_label: "Value"
    group_item_label: "Numerator"
  }
}

view: unified_metrics__metrics__labeled_counter__tabs_open {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__tabs_close {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__bookmarks_add {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__search_counts {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: counts {
    type:  sum
    sql:  ${value} ;;
  }
}

view: unified_metrics__metrics__labeled_counter__bookmarks_open {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__tabs_close_all {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__bookmarks_delete {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__reading_list_add {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__search_in_content {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__string__glean_database_size__values {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__bookmarks_view_list {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__reading_list_delete {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__glean_error_invalid_label {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__glean_error_invalid_state {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__glean_error_invalid_value {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__glean_error_invalid_overflow {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__search_google_topsite_pressed {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__glean_validation_pings_submitted {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__labeled_counter__glean_upload_ping_upload_failure {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__string__glean_upload_pending_pings_directory_size__values {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: unified_metrics__metrics__string__glean_upload_discarded_exceeding_pings_size__values {
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}
