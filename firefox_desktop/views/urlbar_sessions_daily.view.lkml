view: urlbar_sessions_daily {
  derived_table: {
    sql: SELECT
        submission_date,
        normalized_country_code,
        normalized_channel,
        firefox_suggest_enabled,
        sponsored_suggestions_enabled,
        ANY_VALUE(urlbar_sessions) as total_urlbar_sessions,
        SUM(urlbar_clicks) as total_urlbar_clicks,
        SUM(urlbar_annoyances) as total_urlbar_annoyances
      FROM
        `mozdata.firefox_desktop.urlbar_events_daily`
      GROUP BY
        submission_date,
        normalized_country_code,
        normalized_channel,
        firefox_suggest_enabled,
        sponsored_suggestions_enabled
            ;;

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

  measure: total_urlbar_sessions {
    group_label: "Urlbar Metrics"
    description: "The number of times a user initiates an interaction with the urlbar"
    sql: SUM(${TABLE}.total_urlbar_sessions) ;;
    type: number
  }

  measure: total_urlbar_clicks {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on any result shown in the urlbar dropdown menu"
    sql: SUM(${TABLE}.total_urlbar_clicks) ;;
    type: number
  }

  measure: total_urlbar_annoyances {
    group_label: "Urlbar Metrics"
    description: "Count of clicks on annoyance signals across all results shown in the urlbar dropdown menu"
    sql: SUM(${TABLE}.total_urlbar_annoyances) ;;
    type: number
  }

}
