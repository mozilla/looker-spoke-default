include: "//looker-hub/websites/views/moz_org_metrics_summary.view.lkml"

view: +moz_org_metrics_summary {

  derived_table: {
    sql:
      SELECT *
      FROM `moz-fx-data-shared-prod.mozilla_org.www_site_metrics_summary`
      ;;
  }

  parameter: choose_breakdown {
    label: "Choose Grouping (Rows)"
    view_label: "Date/Period Selection"
    type: unquoted
    default_value: "Month"
    allowed_value: {label: "Month Number" value:"Month"}
    allowed_value: {label: "Month and Day" value: "Month_Day"}
    allowed_value: {label: "Week of Year" value: "WOY"}
    allowed_value: {label: "Day of Year" value: "DOY"}
    allowed_value: {label: "Day of Month" value: "DOM"}
    allowed_value: {label: "Day of Week" value: "DOW"}
    allowed_value: {value: "Date"}
  }

  parameter: choose_comparison {
    label: "Choose Comparison (Pivot)"
    view_label: "Date/Period Selection"
    type: unquoted
    default_value: "Year"
    allowed_value: {value: "Year" }
    allowed_value: {value: "Month"}
    allowed_value: {value: "Week"}
  }

  dimension_group: submission {
    type: time
    view_label: "Date/Period Selection"
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

  dimension: day_month_abbreviation {
    type:  date
    hidden: yes
    view_label: "Date/Period Selection"
    convert_tz: no
    datatype:  date
    sql: FORMAT_DATE("%b %d", ${TABLE}.date);;
  }

  dimension: day_month_number {
    type:  date
    hidden: yes
    view_label: "Date/Period Selection"
    datatype:  date
    sql: FORMAT_DATE("%m-%d", ${TABLE}.date);;
  }

  dimension: period_over_period_row  {
    view_label: "Date/Period Selection"
    label_from_parameter: choose_breakdown
    type: string

    order_by_field: sort_by1
    sql:
          {% if choose_breakdown._parameter_value == 'Month' %} ${submission_month_num}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_month_abbreviation}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOY' %} ${submission_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOM' %} ${submission_day_of_month}
          {% elsif choose_breakdown._parameter_value == 'Date' %} ${submission_date}
          {% else %}NULL{% endif %} ;;
  }

  dimension: period_over_period_pivot {
    view_label: "Date/Period Selection"
    label_from_parameter: choose_comparison
    type: string

    order_by_field: sort_by2
    sql:
          {% if choose_comparison._parameter_value == 'Year' %} ${submission_year}
          {% elsif choose_comparison._parameter_value == 'Month' %} ${submission_month}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_month_abbreviation}
          {% else %}NULL{% endif %} ;;
  }
# These dimensions are just to make sure the dimensions sort correctly
  dimension: sort_by1 {
    hidden: yes
    type: number
    sql:
          {% if choose_breakdown._parameter_value == 'Month' %} ${submission_month_num}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${submission_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
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
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${submission_day_of_year}
          {% elsif choose_comparison._parameter_value == 'Week' %} ${submission_week}
          {% else %}NULL{% endif %} ;;

  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${submission_date}) < EXTRACT(DAY FROM CURRENT_DATE()));;
  }

  dimension: wtd_only {
    group_label: "To-Date Filters"
    label: "WTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  ${submission_week_of_year} < (EXTRACT(WEEK FROM CURRENT_DATE()));;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  (EXTRACT(DAYOFYEAR FROM ${submission_date}) < EXTRACT(DAYOFYEAR FROM CURRENT_DATE()));;
  }

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

  measure: non_fx_sessions_average {
    label: "Non Fx session Average"
    type: average
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

  measure:  non_fx_downloads_average {
    label: "Non-Fx Download Average"
    type: average
    sql: ${non_fx_downloads} ;;
  }

  measure:  non_fx_downloads_rate {
    label: "Non-Fx Download Rate"
    type: average
    sql: ${TABLE}.non_fx_download_rate ;;
  }

  measure:  unique_days {
    label: "Number of unique days"
    type: count_distinct
    sql: ${TABLE}.date ;;
  }
}
