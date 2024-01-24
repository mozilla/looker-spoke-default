view: event_flow_monitoring_aggregates {
  sql_table_name: `moz-fx-data-shared-prod.monitoring_derived.event_flow_monitoring_aggregates_v1` ;;

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }
  dimension: events {
    hidden: yes
    sql: ${TABLE}.events ;;
  }
  dimension: flow_id {
    type: string
    sql: ${TABLE}.flow_id ;;
    primary_key: yes
  }
  dimension: normalized_app_name {
    type: string
    sql: ${TABLE}.normalized_app_name ;;
  }
  dimension: flow {
    type:  string
    sql:${TABLE}.flow_hash ;;
  }
  measure: count {
    type: count
    drill_fields: [normalized_app_name]
  }

  parameter: event_name {
    type: string
    default_value: ""
  }

  dimension: event_flow_matching_filter {
    hidden: yes
    type: yesno
    sql: ${flow} LIKE CONCAT("%", {% parameter event_name%}, "%");;
  }
}

view: event_flow_monitoring_aggregates__events {
  dimension: event_flow_monitoring_aggregates__events {
    type: string
    hidden: yes
    sql: event_flow_monitoring_aggregates__events ;;
  }
  dimension: source__category {
    type: string
    sql: ${TABLE}.source.category ;;
    group_label: "Source"
    group_item_label: "Category"
  }
  dimension: source__name {
    type: string
    sql: ${TABLE}.source.name ;;
    group_label: "Source"
    group_item_label: "Name"
  }
  dimension: source__full_name {
    type: string
    sql: CONCAT(IF(${TABLE}.source.category IS NOT NULL, CONCAT(${TABLE}.source.category, "."), ""), ${TABLE}.source.name) ;;
    group_label: "Source"
    group_item_label: "Full Name"
  }
  dimension_group: source__timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.source.timestamp ;;
  }
  dimension: target__category {
    type: string
    sql: ${TABLE}.target.category ;;
    group_label: "Target"
    group_item_label: "Category"
  }
  dimension: target__name {
    type: string
    sql: ${TABLE}.target.name ;;
    group_label: "Target"
    group_item_label: "Name"
  }
  dimension: target__full_name {
    type: string
    sql: CONCAT(IF(${TABLE}.target.category IS NOT NULL, CONCAT(${TABLE}.target.category, "."), ""), ${TABLE}.target.name) ;;
    group_label: "Target"
    group_item_label: "Full Name"
  }
  dimension_group: target__timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.target.timestamp ;;
  }
}
