view: report_content {
  sql_table_name: `moz-fx-data-shared-prod.firefox_desktop_derived.newtab_content_reported_content_v1` ;;

  dimension: card_type {
    type: string
    description: "The type of the content card (e.g., \"spoc\", \"organic\")"
    sql: ${TABLE}.card_type ;;
  }
  dimension: corpus_item_id {
    type: string
    description: "content identifier"
    sql: ${TABLE}.corpus_item_id ;;
  }
  dimension: report_reason {
    type: string
    description: "The reason selected by the user when reporting the content"
    sql: ${TABLE}.report_reason ;;
  }
  dimension: section {
    type: string
    description: "If click belongs in a section, the name of the section"
    sql: ${TABLE}.section ;;
  }
  dimension: section_position {
    type: number
    description: "If click belongs in a section, the numeric position of the section"
    sql: ${TABLE}.section_position ;;
  }
  dimension_group: submission {
    type: time
    description: "Day the event was received in the newtab content ping"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }
  dimension: title {
    type: string
    description: "Title of the recommendation."
    sql: ${TABLE}.title ;;
  }
  dimension: topic {
    type: string
    description: "The topic of the recommendation. Like \"entertainment\"."
    sql: ${TABLE}.topic ;;
  }
  dimension: url {
    type: string
    description: "URL of the recommendation."
    sql: ${TABLE}.url ;;
  }
  measure: count {
    type: count
  }
}
