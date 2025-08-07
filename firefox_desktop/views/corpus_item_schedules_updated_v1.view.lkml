view: corpus_item_schedules_updated_v1 {
  sql_table_name: `moz-fx-data-shared-prod.snowflake_migration_derived.corpus_item_schedules_updated_v1` ;;

  dimension: approved_corpus_item_external_id {
    type: string
    description: "Backend identifier for reviewed_corpus_item’s approved_corpus_item_external_id"
    sql: ${TABLE}.approved_corpus_item_external_id ;;
  }
  dimension: authors {
    type: string
    description: "The list of authors of the reviewed_corpus_item"
    sql: ${TABLE}.authors ;;
  }
  dimension: corpus_item_id_scheduled_surface_id_scheduled_at_key {
    type: string
    description: "A combination of the approved_corpus_item_external_id and scheduled_surface_id columns to create a unique event identifier. Note: A Corpus item could be scheduled across multiple surfaces."
    sql: ${TABLE}.corpus_item_id_scheduled_surface_id_scheduled_at_key ;;
  }
  dimension: corpus_item_loaded_from {
    type: string
    description: "Indicates the source for an approved corpus item PROSPECT: From a prospect feed MANUAL: Manually added by curators ML: Added by an ML generated process BACKFILL: Backfilled from legacy curation process"
    sql: ${TABLE}.corpus_item_loaded_from ;;
  }
  dimension: corpus_review_status {
    type: string
    description: "The curator's decision on the item’s validity for the curated corpus (values are 'recommendation', 'corpus')."
    sql: ${TABLE}.corpus_review_status ;;
  }
  dimension: curator_created_by {
    type: string
    description: "The curator who created the scheduled_corpus_item"
    sql: ${TABLE}.curator_created_by ;;
  }
  dimension: curator_updated_by {
    type: string
    description: "The curator who updated the scheduled_corpus_item"
    sql: ${TABLE}.curator_updated_by ;;
  }
  dimension: excerpt {
    type: string
    description: "The excerpt for the reviewed corpus item"
    sql: ${TABLE}.excerpt ;;
  }
  dimension_group: happened {
    type: time
    description: "Timestamp making allowance for inaccurate device clock"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.happened_at ;;
  }
  dimension: image_url {
    type: string
    description: "The url of the main image of the reviewed corpus item"
    sql: ${TABLE}.image_url ;;
  }
  dimension: is_collection {
    type: yesno
    description: "Indicates whether the reviewed_corpus_item is a collection"
    sql: ${TABLE}.is_collection ;;
  }
  dimension: is_syndicated {
    type: yesno
    description: "Indicates whether the reviewed_corpus_item is a syndicated article"
    sql: ${TABLE}.is_syndicated ;;
  }
  dimension: is_time_sensitive {
    type: yesno
    description: "Indicates whether the reviewed_corpus_item is only relevant for a short period of time (e.g. news)"
    sql: ${TABLE}.is_time_sensitive ;;
  }
  dimension: language {
    type: string
    description: "The language of the reviewed_corpus_item"
    sql: ${TABLE}.language ;;
  }
  dimension: predicted_topic {
    type: string
    description: "Topic categorization based on content predictions (examples TECHNOLOGY, TRAVEL, SPORTS, BUSINESS, EDUCATION)"
    sql: ${TABLE}.predicted_topic ;;
  }
  dimension_group: prospect_expires {
    type: time
    description: "The date at which this candidate set is no longer \"fresh\"."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.prospect_expires_at ;;
  }
  dimension: prospect_flow {
    type: string
    description: "Name of the metaflow script generating this candidate set from dl-meatflow-jobs."
    sql: ${TABLE}.prospect_flow ;;
  }
  dimension: prospect_id {
    type: string
    description: "The id of the item as a prospect (potential corporeal candidate)"
    sql: ${TABLE}.prospect_id ;;
  }
  dimension: prospect_scheduled_surface_id {
    type: string
    description: "The curated rec destination where the corpus item is expected to appear (NEW_TAB_EN_INTL, NEW_TAB_EN_US, NEW_TAB_DE_DE, NEW_TAB_EN_GB)."
    sql: ${TABLE}.prospect_scheduled_surface_id ;;
  }
  dimension: prospect_source {
    type: string
    description: "Source identified by the ML process for the prospect (SYNDICATED, ORGANIC_TIMESPENT, GLOBAL)."
    sql: ${TABLE}.prospect_source ;;
  }
  dimension: publisher {
    type: string
    description: "The name of the online publication that published this story."
    sql: ${TABLE}.publisher ;;
  }
  dimension_group: reviewed_corpus_item_created {
    type: time
    description: "timestamp when the reviewed_corpus_item was created"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.reviewed_corpus_item_created_at ;;
  }
  dimension_group: reviewed_corpus_item_updated {
    type: time
    description: "timestamp when the reviewed_corpus_item was updated"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.reviewed_corpus_item_updated_at ;;
  }
  dimension: reviewed_corpus_update_status {
    type: string
    description: "The most recent update status for a corpus item added: when a new corpus item is added updated: when a corpus item metadata is updated removed: when a previously added corpus item is removed"
    sql: ${TABLE}.reviewed_corpus_update_status ;;
  }
  dimension: schedule_generated_by {
    type: string
    description: "The method by which this schedule was generated. Algorithmically generated by an ML process (ML) or Manually created by curators (MANUAL)"
    sql: ${TABLE}.schedule_generated_by ;;
  }
  dimension: scheduled_action_ui_page {
    type: string
    description: "Indicates where in the Curation Tools UI the action took place Null if the action was performed by a backend ML process"
    sql: ${TABLE}.scheduled_action_ui_page ;;
  }
  dimension_group: scheduled_corpus_item_created {
    type: time
    description: "timestamp when the scheduled_corpus_item was created"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.scheduled_corpus_item_created_at ;;
  }
  dimension: scheduled_corpus_item_external_id {
    type: string
    description: "scheduled corpus item’s external_id"
    sql: ${TABLE}.scheduled_corpus_item_external_id ;;
  }
  dimension_group: scheduled_corpus_item_scheduled {
    type: time
    description: "timestamp when the scheduled_corpus_item item is scheduled to run"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.scheduled_corpus_item_scheduled_at ;;
  }
  dimension_group: scheduled_corpus_item_updated {
    type: time
    description: "timestamp when the scheduled_corpus_item was updated"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.scheduled_corpus_item_updated_at ;;
  }
  dimension: scheduled_corpus_status {
    type: string
    description: "Schedule status of the corpus item added: when a new schedule is added for a corpus item removed: when a corpus item schedule is removed rescheduled: when a corpus item is rescheduled"
    sql: ${TABLE}.scheduled_corpus_status ;;
  }
  dimension: scheduled_status {
    type: string
    description: "The status of the scheduled_corpus_item, as decided by a curator"
    sql: ${TABLE}.scheduled_status ;;
  }
  dimension: scheduled_status_reason_comment {
    type: string
    description: "An optional text field for the curator to provide more information about a change in status"
    sql: ${TABLE}.scheduled_status_reason_comment ;;
  }
  dimension: scheduled_status_reasons {
    type: string
    description: "The list (CSV) of reasons why the curator set the current status for the scheduled_corpus_item"
    sql: ${TABLE}.scheduled_status_reasons ;;
  }
  dimension: scheduled_surface_iana_timezone {
    type: string
    description: "The iana.org timezone of the scheduled surface."
    sql: ${TABLE}.scheduled_surface_iana_timezone ;;
  }
  dimension: scheduled_surface_id {
    type: string
    description: "The curated rec destination where the corpus item is expected to appear (NEW_TAB_EN_INTL, NEW_TAB_EN_US, NEW_TAB_DE_DE, NEW_TAB_EN_GB)"
    sql: ${TABLE}.scheduled_surface_id ;;
  }
  dimension: scheduled_surface_name {
    type: string
    description: "The name of the scheduled surface"
    sql: ${TABLE}.scheduled_surface_name ;;
  }
  dimension: title {
    type: string
    description: "The title of the reviewed corpus item"
    sql: ${TABLE}.title ;;
  }
  dimension: topic {
    type: string
    description: "The topic of the reviewed_corpus_item"
    sql: ${TABLE}.topic ;;
  }
  dimension: url {
    type: string
    description: "The url of the reviewed corpus_item"
    sql: ${TABLE}.url ;;
  }
  measure: count {
    type: count
    drill_fields: [scheduled_surface_name]
  }
}
