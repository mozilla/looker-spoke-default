view: onboarding_v1 {
  sql_table_name: `moz-fx-data-shared-prod.firefox_desktop.onboarding`
    ;;

  dimension: additional_properties {
    type: string
    sql: ${TABLE}.additional_properties ;;
  }

  dimension: addon_version {
    type: string
    sql: ${TABLE}.addon_version ;;
  }

  dimension: attribution__campaign {
    type: string
    sql: ${TABLE}.attribution.campaign ;;
    group_label: "Attribution"
    group_item_label: "Campaign"
  }

  dimension: attribution__content {
    type: string
    sql: ${TABLE}.attribution.content ;;
    group_label: "Attribution"
    group_item_label: "Content"
  }

  dimension: attribution__experiment {
    type: string
    sql: ${TABLE}.attribution.experiment ;;
    group_label: "Attribution"
    group_item_label: "Experiment"
  }

  dimension: attribution__medium {
    type: string
    sql: ${TABLE}.attribution.medium ;;
    group_label: "Attribution"
    group_item_label: "Medium"
  }

  dimension: attribution__source {
    type: string
    sql: ${TABLE}.attribution.source ;;
    group_label: "Attribution"
    group_item_label: "Source"
  }

  dimension: attribution__ua {
    type: string
    sql: ${TABLE}.attribution.ua ;;
    group_label: "Attribution"
    group_item_label: "Ua"
  }

  dimension: attribution__variation {
    type: string
    sql: ${TABLE}.attribution.variation ;;
    group_label: "Attribution"
    group_item_label: "Variation"
  }

  dimension: browser_session_id {
    type: string
    sql: ${TABLE}.browser_session_id ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: document_id {
    type: string
    sql: ${TABLE}.document_id ;;
    hidden: yes
    primary_key: yes
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_context {
    type: string
    sql: ${TABLE}.event_context ;;
    hidden: yes
  }

  dimension: page {
    type: string
    sql: JSON_EXTRACT_SCALAR(event_context, '$.page') ;;
    group_label: "Event Context"
    group_item_label: "Page"
  }

  dimension: source {
    type: string
    sql: JSON_EXTRACT_SCALAR(event_context, '$.source') ;;
    group_label: "Event Context"
    group_item_label: "Source"
  }

  dimension: dom_state {
    type: string
    sql: JSON_EXTRACT_SCALAR(event_context, '$.dom_state') ;;
    group_label: "Event Context"
    group_item_label: "Dom State"
  }

  dimension: reason {
    type: string
    sql: JSON_EXTRACT_SCALAR(event_context, '$.reason') ;;
    group_label: "Event Context"
    group_item_label: "Reason"
  }

  dimension: display {
    type: string
    sql: JSON_EXTRACT_SCALAR(event_context, '$.display') ;;
    group_label: "Event Context"
    group_item_label: "Display"
  }

  dimension: experiments {
    hidden: yes
    sql: ${TABLE}.experiments ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: message_id {
    type: string
    sql: ${TABLE}.message_id ;;
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

  dimension: profile_creation_date {
    type: number
    sql: ${TABLE}.profile_creation_date ;;
  }

  dimension: release_channel {
    type: string
    sql: ${TABLE}.release_channel ;;
  }

  dimension: sample_id {
    type: number
    sql: ${TABLE}.sample_id ;;
  }

  dimension: shield_id {
    type: string
    sql: ${TABLE}.shield_id ;;
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

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: event_count {
    type: count
    drill_fields: [metadata__geo__country, event_count]
  }

  measure: user_count {
    type: count_distinct
    sql: ${TABLE}.client_id ;;
    drill_fields: [metadata__geo__country, user_count]
  }
}

view: message_id_ranks {
  derived_table: {
    explore_source: event_counts {
      column: event_count { field: event_counts.event_count }
      column: message_id { field: event_counts.message_id }
      derived_column: rank { sql: RANK() OVER (ORDER BY event_count DESC) ;; }
      bind_all_filters: yes
    }
  }

  dimension: message_id {  }
  dimension: rank {
    type: number
  }
}

view: onboarding_v1__experiments {
  sql_table_name: UNNEST(experiments) ;;

  dimension: experiment {
    type: string
    sql: ${TABLE}.key ;;
    description: "Experiment name"
    suggest_explore: experiment_names
    suggest_dimension: experiment_names.experiment
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.value.branch ;;
    description: "Experiment branch"
    suggest_explore: experiment_names
    suggest_dimension: experiment_names.branch
  }

  measure: count {
    type: count
    description: "Count of rows"
  }
}
