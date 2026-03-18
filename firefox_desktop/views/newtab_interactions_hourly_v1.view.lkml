view: newtab_interactions_hourly_v1 {
  sql_table_name: `moz-fx-data-shared-prod.telemetry_derived.newtab_interactions_hourly_v1` ;;

  dimension: click_count {
    type: number
    description: "The number of clicks on this piece of content on this day in this position."
    sql: ${TABLE}.click_count ;;
  }
  dimension: dismiss_count {
    type: number
    description: "The number of dismisses of this piece of content on this day in this position via the \"...\" menu on the tile."
    sql: ${TABLE}.dismiss_count ;;
  }
  dimension: impression_count {
    type: number
    description: "The number of impressions of this piece of content on this day in this position."
    sql: ${TABLE}.impression_count ;;
  }
  dimension: position {
    type: number
    description: "0-indexed position of the content in the grid of content."
    sql: ${TABLE}.position ;;
  }
  dimension: recommendation_id {
    type: string
    sql: ${TABLE}.recommendation_id ;;
  }
  dimension: save_count {
    type: number
    description: "The number of saves of this piece of content on this day in this position via the \"...\" menu on the tile."
    sql: ${TABLE}.save_count ;;
  }
  dimension_group: submission {
    type: time
    description: "Client-side date in Firefox for when the indicated engagement happened."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }
  dimension: tile_id {
    type: number
    description: "A content identifier specific to the Firefox Newtab. May not uniquely identify the same piece of content if it is run multiple times."
    sql: ${TABLE}.tile_id ;;
  }
  measure: count {
    type: count
  }
}
