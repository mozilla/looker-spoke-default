include: "//looker-hub/websites/views/moz_org_metrics_summary.view.lkml"

view: +moz_org_metrics_summary {
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
}
