include: "//looker-hub/websites/views/moz_org_landing_page_metrics.view.lkml"

view: +moz_org_landing_page_metrics {
  measure: sessions {
    label: "Session Count"
    type: sum
    sql: ${TABLE}.sessions;;
  }

  measure: non_fx_sessions {
    label: "Non Fx session Count"
    type: sum
    sql: ${TABLE}.non_fx_sessions;;
  }

  measure: downloads {
    label: "Download Count"
    type: sum
    sql: ${TABLE}.downloads;;
  }

  measure:  non_fx_downloads {
    label: "Non-Fx Download Count"
    type: sum
    sql: ${TABLE}. non_fx_downloads;;
  }

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

  measure: bounces {
    label: "Bounce Count"
    type: sum
    sql: ${TABLE}.bounces;;
  }

  measure: exits {
    label: "Exit Count"
    type: sum
    sql: ${TABLE}.exits;;
  }
}
