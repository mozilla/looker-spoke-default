include: "//looker-hub/websites/views/moz_org_page_metrics.view.lkml"

view: +moz_org_page_metrics {
  measure: pageviews {
    label: "Page View Count"
    type: sum
    sql: ${TABLE}.pageviews;;
  }

  measure: unique_pageviews {
    label: "Unique Page View Count"
    type: sum
    sql: ${TABLE}.unique_pageviews;;
  }

  measure: entrances {
    label: "Entrance Count"
    type: sum
    sql: ${TABLE}.entrances;;
  }

  measure: exits {
    label: "Exit Count"
    type: sum
    sql: ${TABLE}.exits;;
  }

  measure: non_exit_pageviews {
    label: "Non-Exit Page View Count"
    type: sum
    sql: ${TABLE}.non_exit_pageviews;;
  }

  measure: total_events {
    label: "Total Event Count"
    type: sum
    sql: ${TABLE}.total_events;;
  }

  measure: unique_events {
    label: "Unique Event Count"
    type: sum
    sql: ${TABLE}.unique_events;;
  }

  measure: total_time_on_page {
    label: "Average Total Time on Page"
    type: average
    sql: ${TABLE}.total_time_on_page;;
  }

  measure: single_page_sessions {
    label: "Single Page Session Count"
    type: sum
    sql: ${TABLE}.single_page_sessions;;
  }

  measure: bounces {
    label: "Bounce Count"
    type: sum
    sql: ${TABLE}.bounces;;
  }
}