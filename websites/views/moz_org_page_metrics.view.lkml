include: "//looker-hub/websites/views/moz_org_page_metrics.view.lkml"

view: +moz_org_page_metrics {
  measure: pageviews_sum {
    label: "Page View Sum"
    type: sum
    sql: ${pageviews} ;;
  }

  measure: unique_pageviews_sum {
    label: "Unique Page View Sum"
    type: sum
    sql: ${unique_pageviews} ;;
  }

  measure: entrances_sum {
    label: "Entrance Sum"
    type: sum
    sql: ${entrances} ;;
  }

  measure: exits_sum {
    label: "Exit Sum"
    type: sum
    sql: ${exits} ;;
  }

  measure: non_exit_pageviews_sum {
    label: "Non-Exit Page View Sum"
    type: sum
    sql: ${non_exit_pageviews} ;;
  }

  measure: total_events_sum {
    label: "Total Event Sum"
    type: sum
    sql: ${total_events} ;;
  }

  measure: unique_events_sum {
    label: "Unique Event Sum"
    type: sum
    sql: ${unique_events} ;;
  }

  measure: total_time_on_page_average {
    label: "Average Total Time on Page"
    type: average
    sql: ${total_time_on_page} ;;
  }

  measure: single_page_sessions_sum {
    label: "Single Page Session Sum"
    type: sum
    sql: ${single_page_sessions} ;;
  }

  measure: bounces_sum {
    label: "Bounce Sum"
    type: sum
    sql: ${bounces} ;;
  }
}
