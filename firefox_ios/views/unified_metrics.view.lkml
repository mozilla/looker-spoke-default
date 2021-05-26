# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: unified_metrics {
  hidden: no
  description: "Counters across core and glean ios pings"

  join: unified_metrics__ping_info__experiments {
    view_label: "Experiments"
    sql: CROSS JOIN UNNEST(${unified_metrics.ping_info__experiments}) as unified_metrics__ping_info__experiments ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__tabs_open {
    view_label: "Labeled Counter Tabs Open"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__tabs_open}) as unified_metrics__metrics__labeled_counter__tabs_open ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__tabs_close {
    view_label: "Labeled Counter Tabs Close"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__tabs_close}) as unified_metrics__metrics__labeled_counter__tabs_close ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__bookmarks_add {
    view_label: "Labeled Counter Bookmarks Add"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__bookmarks_add}) as unified_metrics__metrics__labeled_counter__bookmarks_add ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__search_counts {
    view_label: "Labeled Counter Search Counts"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__search_counts}) as unified_metrics__metrics__labeled_counter__search_counts ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__bookmarks_open {
    view_label: "Labeled Counter Bookmarks Open"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__bookmarks_open}) as unified_metrics__metrics__labeled_counter__bookmarks_open ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__bookmarks_delete {
    view_label: "Labeled Counter Bookmarks Delete"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__bookmarks_delete}) as unified_metrics__metrics__labeled_counter__bookmarks_delete ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__reading_list_add {
    view_label: "Labeled Counter Reading List Add"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__reading_list_add}) as unified_metrics__metrics__labeled_counter__reading_list_add ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__bookmarks_view_list {
    view_label: "Labeled Counter Bookmarks View List"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__bookmarks_view_list}) as unified_metrics__metrics__labeled_counter__bookmarks_view_list ;;
    relationship: one_to_many
  }

  join: unified_metrics__metrics__labeled_counter__reading_list_delete {
    view_label: "Labeled Counter Reading List Delete"
    sql: CROSS JOIN UNNEST(${unified_metrics.metrics__labeled_counter__reading_list_delete}) as unified_metrics__metrics__labeled_counter__reading_list_delete ;;
    relationship: one_to_many
  }
}

view: unified_metrics {
  derived_table: {
    sql:
    SELECT
      *
    FROM
      `moz-fx-data-shared-prod.org_mozilla_ios_firefox.unified_metrics`
    WHERE
      (DATE(submission_timestamp) < "2020-11-01" AND telemetry_system="legacy")
      OR
      (DATE(submission_timestamp) >= "2020-11-01" AND telemetry_system<>"legacy");;
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
    hidden: yes
    type: string
    sql: ${TABLE}.client_info.app_display_version ;;
    group_label: "Client Info"
    group_item_label: "App Display Version"
  }

  dimension: client_info__app_display_major_version {
    type: number
    sql: mozfun.norm.truncate_version(${client_info__app_display_version}, "major") ;;
    group_label: "Client Info"
    group_item_label: "App Display Major Version"
  }

  dimension: client_info__app_display_major_minor_version {
    type: number
    sql: mozfun.norm.truncate_version(${client_info__app_display_version}, "minor") ;;
    group_label: "Client Info"
    group_item_label: "App Display Major Minor Version"
  }

  dimension: client_info__architecture {
    type: string
    sql: ${TABLE}.client_info.architecture ;;
    group_label: "Client Info"
    group_item_label: "Architecture"
  }

  dimension: client_info__client_id {
    type: string
    description: "A UUID uniquely identifying the client."
    link: {
      label: "Glean Dictionary reference for client_id"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/client_id"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
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
    hidden: yes
    type: string
    sql: ${TABLE}.client_info.os_version ;;
    group_label: "Client Info"
    group_item_label: "OS Version"
  }

  dimension: client_info__os_major_version {
    type: number
    sql: mozfun.norm.truncate_version(${client_info__os_version}, "major") ;;
    group_label: "Client Info"
    group_item_label: "OS Major Version"
  }

  dimension: client_info__os_major_minor_version {
    type: number
    sql: mozfun.norm.truncate_version(${client_info__os_version}, "minor") ;;
    group_label: "Client Info"
    group_item_label: "OS Major Minor Version"
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

  # This is required, otherwise there will be duplicate data
  dimension: telemetry_system {
    type: string
    sql: ${TABLE}.telemetry_system ;;
  }

  dimension: metrics__counter__glean_validation_foreground_count {
    hidden: yes
    type: number
    sql: ${TABLE}.metrics.counter.glean_validation_foreground_count ;;
    group_label: "Metrics Counter"
    group_item_label: "Glean Validation Foreground Count"
  }

  measure: glean_validation_foreground_count {
    type:  sum
    sql:  ${metrics__counter__glean_validation_foreground_count} ;;
  }

  measure: glean_validation_foreground_count_client_count {
    type:  count_distinct
    sql: case when ${metrics__counter__glean_validation_foreground_count} > 0 then ${client_info__client_id} end ;;
  }

  dimension: metrics__counter__qr_code_scanned {
    hidden: yes
    type: number
    sql: ${TABLE}.metrics.counter.qr_code_scanned ;;
    group_label: "Metrics Counter"
    group_item_label: "Qr Code Scanned"
  }

  measure: qr_code_scanned {
    type:  sum
    sql:  ${metrics__counter__qr_code_scanned} ;;
    link: {
      label: "Glean Dictionary reference for qr_code_scanned"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/qr_code_scanned"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: qr_code_scanned_client_count {
    type:  count_distinct
    sql: case when ${metrics__counter__qr_code_scanned} > 0 then ${client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for qr_code_scanned"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/qr_code_scanned"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  dimension: metrics__counter__reader_mode_close {
    hidden: yes
    type: number
    sql: ${TABLE}.metrics.counter.reader_mode_close ;;
    group_label: "Metrics Counter"
    group_item_label: "Reader Mode Close"
  }

  measure: reader_mode_close {
    type:  sum
    sql:  ${metrics__counter__reader_mode_close} ;;
    link: {
      label: "Glean Dictionary reference for reader_mode_close"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reader_mode_close"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: reader_mode_close_client_count {
    type:  count_distinct
    sql: case when ${metrics__counter__reader_mode_close} > 0 then ${client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for reader_mode_close"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reader_mode_close"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  dimension: metrics__counter__reader_mode_open {
    hidden: yes
    type: number
    sql: ${TABLE}.metrics.counter.reader_mode_open ;;
    group_label: "Metrics Counter"
    group_item_label: "Reader Mode Open"
  }

  measure: reader_mode_open {
    type:  sum
    sql:  ${metrics__counter__reader_mode_open} ;;
    link: {
      label: "Glean Dictionary reference for reader_mode_open"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reader_mode_open"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: reader_mode_open_client_count {
    type:  count_distinct
    sql: case when ${metrics__counter__reader_mode_open} > 0 then ${client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for reader_mode_open"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reader_mode_open"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  dimension: metrics__counter__reading_list_mark_read {
    hidden: yes
    type: number
    sql: ${TABLE}.metrics.counter.reading_list_mark_read ;;
    group_label: "Metrics Counter"
    group_item_label: "Reading List Mark Read"
  }

  measure: reading_list_mark_read {
    type:  sum
    sql:  ${metrics__counter__reading_list_mark_read} ;;
    link: {
      label: "Glean Dictionary reference for reading_list_mark_read"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_mark_read"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: reading_list_mark_read_client_count {
    type:  count_distinct
    sql: case when ${metrics__counter__reading_list_mark_read} > 0 then ${client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for reading_list_mark_read"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_mark_read"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  dimension: metrics__counter__reading_list_mark_unread {
    hidden: yes
    type: number
    sql: ${TABLE}.metrics.counter.reading_list_mark_unread ;;
    group_label: "Metrics Counter"
    group_item_label: "Reading List Mark Unread"
  }

  measure: reading_list_mark_unread {
    type:  sum
    sql:  ${metrics__counter__reading_list_mark_unread} ;;
    link: {
      label: "Glean Dictionary reference for reading_list_mark_unread"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_mark_unread"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: reading_list_mark_unread_client_count {
    type:  count_distinct
    sql: case when ${metrics__counter__reading_list_mark_unread} > 0 then ${client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for reading_list_mark_unread"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_mark_unread"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  dimension: metrics__counter__reading_list_open {
    hidden: yes
    type: number
    sql: ${TABLE}.metrics.counter.reading_list_open ;;
    group_label: "Metrics Counter"
    group_item_label: "Reading List Open"
  }

  measure: reading_list_open {
    type:  sum
    sql:  ${metrics__counter__reading_list_open} ;;
    link: {
      label: "Glean Dictionary reference for reading_list_open"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_open"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: reading_list_open_client_count {
    type:  count_distinct
    sql: case when ${metrics__counter__reading_list_open} > 0 then ${client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for reading_list_open"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_open"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  dimension: metrics__counter__tabs_cumulative_count {
    hidden: yes
    type: number
    sql: ${TABLE}.metrics.counter.tabs_cumulative_count ;;
    group_label: "Metrics Counter"
    group_item_label: "Tabs Cumulative Count"
  }

  measure: tabs_cumulative_count {
    type:  sum
    sql:  ${metrics__counter__tabs_cumulative_count} ;;
    link: {
      label: "Glean Dictionary reference for tabs_cumulative_count"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/tabs_cumulative_count"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: tabs_cumulative_count_client_count {
    type:  count_distinct
    sql: case when ${metrics__counter__tabs_cumulative_count} > 0 then ${client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for tabs_cumulative_count"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/tabs_cumulative_count"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
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

  dimension: metrics__labeled_counter__tabs_close {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_close ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Tabs Close"
  }

  dimension: metrics__labeled_counter__tabs_open {
    hidden: yes
    sql: ${TABLE}.metrics.labeled_counter.tabs_open ;;
    group_label: "Metrics Labeled Counter"
    group_item_label: "Tabs Open"
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

  measure: count {
    description: "Count of rows."
    type:  count
  }

  measure: client_count {
    description: "Count of distinct clients."
    type:  count_distinct
    sql: ${client_info__client_id} ;;
  }

}

view: unified_metrics__ping_info__experiments {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__branch {
    type: string
    sql: ${TABLE}.value.branch ;;
    label: "Branch"
  }

  dimension: value__extra__type {
    type: string
    sql: ${TABLE}.value.extra.type ;;
    label: "Experiment Type"
  }
}

view: unified_metrics__metrics__labeled_counter__tabs_open {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for tabs_open"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/tabs_open"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for tabs_open"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/tabs_open"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}

view: unified_metrics__metrics__labeled_counter__tabs_close {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for tabs_close"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/tabs_close"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for tabs_close"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/tabs_close"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}

view: unified_metrics__metrics__labeled_counter__bookmarks_add {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for bookmarks_add"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/bookmarks_add"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for bookmarks_add"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/bookmarks_add"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}

view: unified_metrics__metrics__labeled_counter__search_counts {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for search_counts"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/search_counts"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for search_counts"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/search_counts"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}

view: unified_metrics__metrics__labeled_counter__bookmarks_open {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for bookmarks_open"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/bookmarks_open"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for bookmarks_open"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/bookmarks_open"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}


view: unified_metrics__metrics__labeled_counter__bookmarks_delete {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for bookmarks_delete"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/bookmarks_delete"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for bookmarks_delete"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/bookmarks_delete"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}

view: unified_metrics__metrics__labeled_counter__reading_list_add {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for reading_list_add"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_add"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for reading_list_add"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_add"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}


view: unified_metrics__metrics__labeled_counter__bookmarks_view_list {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for bookmarks_view_list"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/bookmarks_view_list"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for bookmarks_view_list"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/bookmarks_view_list"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}

view: unified_metrics__metrics__labeled_counter__reading_list_delete {
  dimension: key {
    label: "Label"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type:  sum
    sql:  ${value} ;;
    link: {
      label: "Glean Dictionary reference for reading_list_delete"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_delete"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }

  measure: client_count {
    type:  count_distinct
    sql: case when ${value} > 0 then ${unified_metrics.client_info__client_id} end ;;
    link: {
      label: "Glean Dictionary reference for reading_list_delete"
      url: "https://dictionary.protosaur.dev/apps/firefox_ios/metrics/reading_list_delete"
      icon_url: "https://dictionary.protosaur.dev/favicon.png"
    }
  }
}
