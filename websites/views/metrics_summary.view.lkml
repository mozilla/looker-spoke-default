include: "//looker-hub/websites/views/moz_org_page_metrics.view.lkml"

view: page_metrics {
  extends: [moz_org_page_metrics]

  filter: date {
    type: date
    sql: {% condition date %} CAST(${TABLE}.submission_date AS DATE) {% endcondition %} ;;
  }
}
