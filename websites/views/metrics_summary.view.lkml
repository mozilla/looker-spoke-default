include: "//looker-hub/websites/views/moz_org_metrics_summary.view.lkml"

view: metrics_summary {
  extends: [moz_org_metrics_summary]

  filter: date {
    type: date
    sql: {% condition date %} CAST(${TABLE}.submission_date AS DATE) {% endcondition %} ;;
  }
}
