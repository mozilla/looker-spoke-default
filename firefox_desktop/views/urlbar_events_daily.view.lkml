include: "//looker-hub/firefox_desktop/views/*"

view: +urlbar_events_daily {

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
    sql: ${TABLE}.pref_fx_suggestions ;;
    type: yesno
    group_label: "User Preferences"
    description: "Whether or not the checkbox for showing Firefox Suggestions is checked in about:preferences"
  }

  dimension: sponsored_suggestions_enabled {
    sql: ${TABLE}.pref_sponsored_suggestions ;;
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

  measure: urlbar_clicks {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on any result shown in the urlbar dropdown menu"
    sql: ${TABLE}.urlbar_clicks ;;
    type: number
  }

  measure: urlbar_impressions {
    group_label: "Urlbar Metrics"
    description: "The number of times a user exits the urlbar dropdown menu, either by abandoning the urlbar, engaging with a urlbar result, or selecting an annoyance signal that closes the urlbar dropdown menu"
    sql: ${TABLE}.urlbar_impressions ;;
    type: number
  }

  measure: urlbar_CTR {
    group_label: "Urlbar Metrics"
    description: "Clicks / Impressions"
    sql: safe_divide(${urlbar_clicks}, ${urlbar_impressions});;
    type: number
  }

  measure: urlbar_annoyances {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on annoyance signals across all results shown in the urlbar dropdown menu"
    sql: ${TABLE}.urlbar_annoyances ;;
    type: number
  }

}
