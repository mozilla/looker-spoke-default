include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates.view.lkml"

view: +active_users_aggregates {

parameter: choose_breakdown {
  label: "Choose Grouping (Rows)"
  view_label: "_PoP"
  type: unquoted
  default_value: "Month"
  allowed_value: {label: "Month Number" value:"Month"}
  allowed_value: {label: "Day of Year" value: "DOY"}
  allowed_value: {label: "Day of Month" value: "DOM"}
  allowed_value: {label: "Day of Week" value: "DOW"}
  allowed_value: {value: "Date"}
}

parameter: choose_comparison {
  label: "Choose Comparison (Pivot)"
  view_label: "_PoP"
  type: unquoted
  default_value: "Year"
  allowed_value: {value: "Year" }
  allowed_value: {value: "Month"}
}

dimension_group: submission {
  type: time
  view_label: "_PoP"
  timeframes: [
    raw,
    date,
    day_of_month,
    day_of_year,
    week,
    month,
    month_name,
    month_num,
    quarter,
    year
  ]
  convert_tz: no
  datatype: date
  sql: ${TABLE}.submission_date ;;
}

dimension: pop_row  {
  view_label: "_PoP"
  label_from_parameter: choose_breakdown
  type: string
  # order_by_field: sort_hack1 # Important # WON: no dimension called sort_hack1
  order_by_field: sort_by1
  sql:
          {% if choose_breakdown._parameter_value == 'Month' %} ${submission_month_num}
          {% elsif choose_breakdown._parameter_value == 'DOY' %} ${submission_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOM' %} ${submission_day_of_month}
          {% elsif choose_breakdown._parameter_value == 'Date' %} ${submission_date}
          {% else %}NULL{% endif %} ;;
}

dimension: pop_pivot {
  view_label: "_PoP"
  label_from_parameter: choose_comparison
  type: string
  # order_by_field: sort_hack2 # Important # WON: no dimension called sort_hack2
  order_by_field: sort_by2
  sql:
          {% if choose_comparison._parameter_value == 'Year' %} ${submission_year}
          {% elsif choose_comparison._parameter_value == 'Month' %} ${submission_month}
          {% else %}NULL{% endif %} ;;
}


# These dimensions are just to make sure the dimensions sort correctly
dimension: sort_by1 {
  hidden: yes
  type: number
  sql:
          {% if choose_breakdown._parameter_value == 'Month' %} ${submission_month_num}
          {% elsif choose_breakdown._parameter_value == 'DOY' %} ${submission_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOM' %} ${submission_day_of_month}
          {% elsif choose_breakdown._parameter_value == 'Date' %} ${submission_date}
          {% else %}NULL{% endif %} ;;
}

dimension: sort_by2 {
  hidden: yes
  type: string
  sql:
          {% if choose_comparison._parameter_value == 'Year' %} ${submission_year}
          {% elsif choose_comparison._parameter_value == 'Month' %} ${submission_month_num}
          {% elsif choose_comparison._parameter_value == 'Week' %} ${submission_week}
          {% else %}NULL{% endif %} ;;

}

dimension: mtd_only {
  group_label: "To-Date Filters"
  label: "MTD"
  view_label: "_PoP"
  type: yesno
  sql:  (EXTRACT(DAY FROM ${submission_date}) < EXTRACT(DAY FROM CURRENT_DATE()));;
}

dimension: ytd_only {
  group_label: "To-Date Filters"
  label: "YTD"
  view_label: "_PoP"
  type: yesno
  sql:  (EXTRACT(DAYOFYEAR FROM ${submission_date}) < EXTRACT(DAYOFYEAR FROM CURRENT_DATE()));;
}

  measure: daily_active_users {
    label: "DAU"
    type:  max
    sql: (${TABLE}.dau) ;;
  }
}
