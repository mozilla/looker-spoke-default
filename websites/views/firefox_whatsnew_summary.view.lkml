include: "//looker-hub/websites/views/firefox_whatsnew_summary.view.lkml"

view: +firefox_whatsnew_summary {

  dimension_group: date {
    type: time
    # view_label: "Date/Period Selection"
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  measure: wnp_visits {
    description: "Unique visits to the wnp page"
    type: sum
    sql: ${TABLE}.visits ;;
  }

  measure: wnp_bounces {
    description: "Bounces on the wnp page"
    type: sum
    sql: ${TABLE}.bounces ;;
  }

}
