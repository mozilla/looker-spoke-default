include: "//looker-hub/websites/views/blogs_daily_summary.view.lkml"

view: blogs_summary {
  extends: [blogs_daily_summary]

  filter: date {
    type: date
    sql: {% condition date %} CAST(${TABLE}.submission_date AS DATE) {% endcondition %} ;;
  }
}
