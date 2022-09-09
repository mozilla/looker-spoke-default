include: "//looker-hub/websites/views/moz_org_landing_page_metrics.view.lkml"

view: +moz_org_landing_page_metrics {
  measure: sessions_sum {
    label: "Session Sum"
    type: sum
    sql: ${sessions} ;;
  }

  measure: non_fx_sessions_sum {
    label: "Non Fx session Sum"
    type: sum
    sql: ${non_fx_sessions} ;;
  }

  measure: downloads_sum {
    label: "Download Sum"
    type: sum
    sql: ${downloads} ;;
  }

  measure:  non_fx_downloads_sum {
    label: "Non-Fx Download Sum"
    type: sum
    sql: ${non_fx_downloads} ;;
  }

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

  measure: bounces_sum {
    label: "Bounce Sum"
    type: sum
    sql: ${bounces} ;;
  }

  measure: exits_sum {
    label: "Exit Sum"
    type: sum
    sql: ${exits} ;;
  }
}
