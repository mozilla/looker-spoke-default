include: "//looker-hub/firefox_desktop/views/urlbar_events_daily_table.view.lkml"

view: +urlbar_events_daily_table {

  dimension: product_result_type {
    sql: ${TABLE}.product_result_type ;;
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

  dimension: urlbar_impressions {
    hidden: yes
  }

  dimension: urlbar_annoyances {
    hidden: yes
  }

  dimension: urlbar_clicks {
    hidden: yes
  }

  dimension: urlbar_sessions {
    hidden: yes
  }

  measure: total_urlbar_impressions {
    group_label: "Urlbar Metrics"
    description: "The number of times a user exits the urlbar dropdown menu, either by abandoning the urlbar, engaging with a urlbar result, or selecting an annoyance signal that closes the urlbar dropdown menu"
    sql: SUM(${TABLE}.urlbar_impressions) ;;
    type: number
  }

  measure: total_urlbar_annoyances {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on annoyance signals across all results shown in the urlbar dropdown menu"
    sql: SUM(${TABLE}.urlbar_annoyances) ;;
    type: number
  }

  measure: total_urlbar_clicks {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on any result shown in the urlbar dropdown menu"
    sql: SUM(${TABLE}.urlbar_clicks) ;;
    type: number
  }

}
