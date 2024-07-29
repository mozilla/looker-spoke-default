view: urlbar_events_daily_engagement_by_position {

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: normalized_country_code {
    sql: ${TABLE}.normalized_country_code ;;
    type: string
  }

  dimension: normalized_channel {
    sql: ${TABLE}.normalized_channel ;;
    type: string
  }

  dimension: firefox_suggest_enabled {
    sql: ${TABLE}.firefox_suggest_enabled ;;
    type: yesno
    group_label: "User Preferences"
    description: "Whether or not the checkbox for showing Firefox Suggestions is checked in about:preferences"
  }

  dimension: sponsored_suggestions_enabled {
    sql: ${TABLE}.sponsored_suggestions_enabled ;;
    type: yesno
    group_label: "User Preferences"
    description: "Whether or not the checkbox for showing sponsored suggestions is checked in about:preferences"
  }

  dimension: selected_position {
    sql: ${TABLE}.selected_position ;;
    type: number
    group_label: "Selected Position"
    description: "The ordinal position of the selection in the urlbar"
  }

  measure: num_clicks {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on any result shown in the urlbar dropdown menu"
    sql: SUM(${TABLE}.num_clicks) ;;
    type: number
  }

  sql_table_name: `mozdata.firefox_desktop.urlbar_events_daily_engagement_by_position` ;;
}
