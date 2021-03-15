view: migration {
  sql_table_name: `mozdata.org_mozilla_firefox.migration` ;;

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

  dimension: metrics__boolean__migration_addons_any_failures {
    group_item_label: "Migration Addons Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_addons_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_bookmarks_any_failures {
    group_item_label: "Migration Bookmarks Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_bookmarks_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_fxa_any_failures {
    group_item_label: "Migration Fxa Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_fxa_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_fxa_has_custom_idp_server {
    group_item_label: "Migration Fxa Has Custom Idp Server"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_fxa_has_custom_idp_server ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_fxa_has_custom_token_server {
    group_item_label: "Migration Fxa Has Custom Token Server"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_fxa_has_custom_token_server ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_gecko_any_failures {
    group_item_label: "Migration Gecko Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_gecko_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_history_any_failures {
    group_item_label: "Migration History Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_history_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_logins_any_failures {
    group_item_label: "Migration Logins Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_logins_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_open_tabs_any_failures {
    group_item_label: "Migration Open Tabs Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_open_tabs_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_pinned_sites_any_failures {
    group_item_label: "Migration Pinned Sites Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_pinned_sites_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_search_any_failures {
    group_item_label: "Migration Search Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_search_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_settings_any_failures {
    group_item_label: "Migration Settings Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_settings_any_failures ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_settings_telemetry_enabled {
    group_item_label: "Migration Settings Telemetry Enabled"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_settings_telemetry_enabled ;;
    type: yesno
  }

  dimension: metrics__boolean__migration_telemetry_identifiers_any_failures {
    group_item_label: "Migration Telemetry Identifiers Any Failures"
    group_label: "Metrics Boolean"
    sql: ${TABLE}.metrics.boolean.migration_telemetry_identifiers_any_failures ;;
    type: yesno
  }

  dimension: metrics__counter__migration_addons_failed_addons {
    group_item_label: "Migration Addons Failed Addons"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_addons_failed_addons ;;
    type: number
  }

  dimension: metrics__counter__migration_addons_failure_reason {
    group_item_label: "Migration Addons Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_addons_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_addons_migrated_addons {
    group_item_label: "Migration Addons Migrated Addons"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_addons_migrated_addons ;;
    type: number
  }

  dimension: metrics__counter__migration_addons_success_reason {
    group_item_label: "Migration Addons Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_addons_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_bookmarks_detected {
    group_item_label: "Migration Bookmarks Detected"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_bookmarks_detected ;;
    type: number
  }

  dimension: metrics__counter__migration_bookmarks_failure_reason {
    group_item_label: "Migration Bookmarks Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_bookmarks_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_bookmarks_success_reason {
    group_item_label: "Migration Bookmarks Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_bookmarks_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_fxa_failure_reason {
    group_item_label: "Migration Fxa Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_fxa_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_fxa_success_reason {
    group_item_label: "Migration Fxa Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_fxa_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_gecko_failure_reason {
    group_item_label: "Migration Gecko Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_gecko_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_gecko_success_reason {
    group_item_label: "Migration Gecko Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_gecko_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_history_detected {
    group_item_label: "Migration History Detected"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_history_detected ;;
    type: number
  }

  dimension: metrics__counter__migration_history_failure_reason {
    group_item_label: "Migration History Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_history_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_history_success_reason {
    group_item_label: "Migration History Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_history_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_logins_detected {
    group_item_label: "Migration Logins Detected"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_logins_detected ;;
    type: number
  }

  dimension: metrics__counter__migration_logins_failure_reason {
    group_item_label: "Migration Logins Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_logins_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_logins_success_reason {
    group_item_label: "Migration Logins Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_logins_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_logins_unsupported_db_version {
    group_item_label: "Migration Logins Unsupported Db Version"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_logins_unsupported_db_version ;;
    type: number
  }

  dimension: metrics__counter__migration_open_tabs_detected {
    group_item_label: "Migration Open Tabs Detected"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_open_tabs_detected ;;
    type: number
  }

  dimension: metrics__counter__migration_open_tabs_failure_reason {
    group_item_label: "Migration Open Tabs Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_open_tabs_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_open_tabs_migrated {
    group_item_label: "Migration Open Tabs Migrated"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_open_tabs_migrated ;;
    type: number
  }

  dimension: metrics__counter__migration_open_tabs_success_reason {
    group_item_label: "Migration Open Tabs Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_open_tabs_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_pinned_sites_detected_pinned_sites {
    group_item_label: "Migration Pinned Sites Detected Pinned Sites"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_pinned_sites_detected_pinned_sites ;;
    type: number
  }

  dimension: metrics__counter__migration_pinned_sites_failure_reason {
    group_item_label: "Migration Pinned Sites Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_pinned_sites_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_pinned_sites_migrated_pinned_sites {
    group_item_label: "Migration Pinned Sites Migrated Pinned Sites"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_pinned_sites_migrated_pinned_sites ;;
    type: number
  }

  dimension: metrics__counter__migration_pinned_sites_success_reason {
    group_item_label: "Migration Pinned Sites Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_pinned_sites_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_search_failure_reason {
    group_item_label: "Migration Search Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_search_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_search_success_reason {
    group_item_label: "Migration Search Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_search_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_settings_failure_reason {
    group_item_label: "Migration Settings Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_settings_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_settings_success_reason {
    group_item_label: "Migration Settings Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_settings_success_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_telemetry_identifiers_failure_reason {
    group_item_label: "Migration Telemetry Identifiers Failure Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_telemetry_identifiers_failure_reason ;;
    type: number
  }

  dimension: metrics__counter__migration_telemetry_identifiers_success_reason {
    group_item_label: "Migration Telemetry Identifiers Success Reason"
    group_label: "Metrics Counter"
    sql: ${TABLE}.metrics.counter.migration_telemetry_identifiers_success_reason ;;
    type: number
  }

  dimension: metrics__datetime__migration_telemetry_identifiers_fennec_profile_creation_date {
    group_item_label: "Migration Telemetry Identifiers Fennec Profile Creation Date"
    group_label: "Metrics Datetime"
    sql: ${TABLE}.metrics.datetime.migration_telemetry_identifiers_fennec_profile_creation_date ;;
    type: string
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

  dimension: metrics__labeled_counter__migration_bookmarks_migrated {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.migration_bookmarks_migrated ;;
  }

  dimension: metrics__labeled_counter__migration_history_migrated {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.migration_history_migrated ;;
  }

  dimension: metrics__labeled_counter__migration_logins_failure_counts {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.migration_logins_failure_counts ;;
  }

  dimension: metrics__labeled_rate {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_rate ;;
  }

  dimension: metrics__labeled_string__migration_migration_versions {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_string.migration_migration_versions ;;
  }

  dimension: metrics__string__migration_fxa_bad_auth_state {
    group_item_label: "Migration Fxa Bad Auth State"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.migration_fxa_bad_auth_state ;;
    type: string
  }

  dimension: metrics__string__migration_fxa_failure_reason_rust {
    group_item_label: "Migration Fxa Failure Reason Rust"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.migration_fxa_failure_reason_rust ;;
    type: string
  }

  dimension: metrics__string__migration_fxa_unsupported_account_version {
    group_item_label: "Migration Fxa Unsupported Account Version"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.migration_fxa_unsupported_account_version ;;
    type: string
  }

  dimension: metrics__string__migration_fxa_unsupported_pickle_version {
    group_item_label: "Migration Fxa Unsupported Pickle Version"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.migration_fxa_unsupported_pickle_version ;;
    type: string
  }

  dimension: metrics__string__migration_fxa_unsupported_state_version {
    group_item_label: "Migration Fxa Unsupported State Version"
    group_label: "Metrics String"
    sql: ${TABLE}.metrics.string.migration_fxa_unsupported_state_version ;;
    type: string
  }

  dimension: metrics__timespan__migration_addons_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Addons Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_addons_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_addons_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Addons Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_addons_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_bookmarks_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Bookmarks Duration"
    sql: ${TABLE}.metrics.timespan.migration_bookmarks_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_bookmarks_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Bookmarks Duration"
    sql: ${TABLE}.metrics.timespan.migration_bookmarks_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_bookmarks_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Bookmarks Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_bookmarks_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_bookmarks_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Bookmarks Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_bookmarks_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_fxa_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Fxa Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_fxa_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_fxa_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Fxa Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_fxa_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_gecko_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Gecko Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_gecko_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_gecko_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Gecko Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_gecko_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_history_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration History Duration"
    sql: ${TABLE}.metrics.timespan.migration_history_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_history_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration History Duration"
    sql: ${TABLE}.metrics.timespan.migration_history_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_history_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration History Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_history_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_history_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration History Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_history_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_logins_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Logins Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_logins_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_logins_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Logins Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_logins_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_open_tabs_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Open Tabs Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_open_tabs_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_open_tabs_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Open Tabs Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_open_tabs_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_pinned_sites_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Pinned Sites Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_pinned_sites_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_pinned_sites_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Pinned Sites Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_pinned_sites_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_search_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Search Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_search_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_search_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Search Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_search_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_settings_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Settings Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_settings_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_settings_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Settings Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_settings_total_duration.value ;;
    type: number
  }

  dimension: metrics__timespan__migration_telemetry_identifiers_total_duration__time_unit {
    group_item_label: "Time Unit"
    group_label: "Metrics Timespan Migration Telemetry Identifiers Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_telemetry_identifiers_total_duration.time_unit ;;
    type: string
  }

  dimension: metrics__timespan__migration_telemetry_identifiers_total_duration__value {
    group_item_label: "Value"
    group_label: "Metrics Timespan Migration Telemetry Identifiers Total Duration"
    sql: ${TABLE}.metrics.timespan.migration_telemetry_identifiers_total_duration.value ;;
    type: number
  }

  dimension: metrics__uuid__migration_telemetry_identifiers_fennec_client_id {
    group_item_label: "Migration Telemetry Identifiers Fennec Client Id"
    group_label: "Metrics Uuid"
    sql: ${TABLE}.metrics.uuid.migration_telemetry_identifiers_fennec_client_id ;;
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

  dimension_group: submission {
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
    timeframes: [
      raw,
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