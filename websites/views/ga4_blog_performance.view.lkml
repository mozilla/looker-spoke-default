include: "//looker-hub/websites/views/ga4_blog_performance.view.lkml"

view: +ga4_blog_performance {

  dimension: nbr_sessions         { hidden: yes }
  dimension: nbr_page_views       { hidden: yes }
  dimension: nbr_engaged_sessions { hidden: yes }
  dimension: nbr_key_events       { hidden: yes }

  measure: pageviews_sum {
    label: "Page Views Sum"
    type: sum
    sql: ${nbr_page_views} ;;
  }

  measure: sessions_sum {
    label: "Sessions Sum"
    type: sum
    sql: ${nbr_sessions} ;;
  }

  measure: engaged_sessions_sum {
    label: "Engaged Sessions Sum"
    type: sum
    sql: ${nbr_engaged_sessions} ;;
  }

  measure: key_events_sum {
    label: "Key Events Sum"
    type: sum
    sql: ${nbr_key_events} ;;
  }
  
  measure: page_views_per_session {
    label: "Avg Page Views per Session"
    type: number
    value_format: "#,##0.00"
    sql: ${pageviews_sum}/ ${sessions_sum} ;;
  }

  measure: engagement_rate {
    label: "Engagement Rate"
    type: number
    value_format_name: percent_2
    sql: ${engaged_sessions_sum}/ ${sessions_sum} ;;
  }

}
