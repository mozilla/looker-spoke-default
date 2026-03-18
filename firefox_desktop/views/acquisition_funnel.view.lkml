include: "//looker-hub/firefox_desktop/views/desktop_acquisition_funnel_table.view.lkml"

view: +desktop_acquisition_funnel_table {

  # Hide metric columns showing as dimensions
  dimension: cohort {
    hidden: yes
    sql: ${TABLE}.cohort ;;
  }

  dimension: activated {
    hidden: yes
    sql: ${TABLE}.activated ;;
  }

  dimension: returned_second_day {
    hidden: yes
    sql: ${TABLE}.returned_second_day ;;
  }

  dimension: qualified_second_day {
    hidden: yes
    sql: ${TABLE}.qualified_second_day ;;
  }


  dimension: retained_week4 {
    hidden: yes
    sql: ${TABLE}.retained_week4 ;;
  }

  dimension: qualified_week_4 {
    hidden: yes
    sql: ${TABLE}.qualified_week4 ;;
  }

  # Define measures
  measure: cohort_measure {
    label: "New Profiles (cohort)"
    type:  sum
    sql: (${TABLE}.cohort) ;;
  }

  measure: activated_measure {
    label: "clients - activated"
    type: sum
    sql:  ${TABLE}.activated ;;
  }

  measure: returned_second_day_measure {
    label: "clients - repeat first month"
    type: sum
    sql:  ${TABLE}.returned_second_day ;;
  }

  measure: qualified_second_day_measure {
    label: "clients - repeat first month (DAU qualified)"
    type: sum
    sql:  ${TABLE}.qualified_second_day ;;
  }

  measure: retained_week_4_measure {
    label: "clients - retained in week 4"
    type: sum
    sql:  ${TABLE}.retained_week4 ;;
  }

  measure: qualified_week_4_measure {
    label: "clients - retained in week 4 (DAU qualified)"
    type: sum
    sql:  ${TABLE}.qualified_week4 ;;
  }

  measure: activation_rate_measure{
    label: "activation rate"
    type: number
    sql: SAFE_DIVIDE(${activated_measure}, ${cohort_measure}) ;;
    value_format: "0.00%"
  }

  measure: repeat_first_month_user_rate_measure{
    label: "repeat first month user rate"
    type: number
    sql: SAFE_DIVIDE(${returned_second_day_measure}, ${cohort_measure}) ;;
    value_format: "0.00%"
  }

  measure: qualified_repeat_first_month_user_rate_measure{
    label: "repeat first month user rate (DAU qualified)"
    type: number
    sql: SAFE_DIVIDE(${qualified_second_day_measure}, ${cohort_measure}) ;;
    value_format: "0.00%"
  }

  measure: retention_week_4_measure{
    label: "retention week 4"
    type: number
    sql: SAFE_DIVIDE(${retained_week_4_measure}, ${cohort_measure}) ;;
    value_format: "0.00%"
  }

  measure: qualified_retention_week_4_measure{
    label: "retention week 4 (DAU qualified)"
    type: number
    sql: SAFE_DIVIDE(${qualified_week_4_measure}, ${cohort_measure}) ;;
    value_format: "0.00%"
  }

# Group Dimensions
  dimension: attribution_campaign {
    label: "Campaign"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_campaign ;;
  }

  dimension: attribution_content {
    label: "Content"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_content ;;
  }

  dimension: attribution_dlsource {
    label: "Download Source"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_dlsource ;;
  }

  dimension: attribution_experiment {
    label: "Experiment"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_experiment ;;
  }

  dimension: attribution_medium {
    label: "Medium"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_medium ;;
  }

  dimension: attribution_source {
    label: "Source"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_source ;;
  }

  dimension: attribution_ua {
    label: "User Agent"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_ua ;;
  }


# Dates Setup

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

  dimension_group: first_seen {
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
    sql: ${TABLE}.first_seen_date ;;
  }

  dimension: day_month_abbreviation {
    type:  date
    hidden: yes
    view_label: "Date/Period Selection"
    convert_tz: no
    datatype:  date
    sql: FORMAT_DATE("%b %d", ${TABLE}.first_seen_date);;
  }

  dimension: day_month_number {
    type:  date
    hidden: yes
    view_label: "Date/Period Selection"
    datatype:  date
    sql: FORMAT_DATE("%m-%d", ${TABLE}.first_seen_date);;
  }

  dimension: period_over_period_row  {
    view_label: "Date/Period Selection"
    label_from_parameter: choose_breakdown
    type: string

    order_by_field: sort_by1
    sql:
          {% if choose_breakdown._parameter_value == 'Month' %} ${first_seen_month_num}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_month_abbreviation}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${first_seen_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOY' %} ${first_seen_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOM' %} ${first_seen_day_of_month}
          {% elsif choose_breakdown._parameter_value == 'Date' %} ${first_seen_date}
          {% else %}NULL{% endif %} ;;
  }

  dimension: period_over_period_pivot {
    view_label: "Date/Period Selection"
    label_from_parameter: choose_comparison
    type: string

    order_by_field: sort_by2
    sql:
          {% if choose_comparison._parameter_value == 'Year' %} ${first_seen_year}
          {% elsif choose_comparison._parameter_value == 'Month' %} ${first_seen_month}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${first_seen_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_month_abbreviation}
          {% else %}NULL{% endif %} ;;
    }

# These dimensions are just to make sure the dimensions sort correctly
  dimension: sort_by1 {
    hidden: yes
    type: number
    sql:
          {% if choose_breakdown._parameter_value == 'Month' %} ${first_seen_month_num}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${first_seen_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${first_seen_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOY' %} ${first_seen_day_of_year}
          {% elsif choose_breakdown._parameter_value == 'DOM' %} ${first_seen_day_of_month}
          {% elsif choose_breakdown._parameter_value == 'Date' %} ${first_seen_date}
          {% else %}NULL{% endif %} ;;
  }

  dimension: sort_by2 {
    hidden: yes
    type: string
    sql:
          {% if choose_comparison._parameter_value == 'Year' %} ${first_seen_year}
          {% elsif choose_comparison._parameter_value == 'Month' %} ${first_seen_month_num}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${first_seen_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${first_seen_day_of_year}
          {% elsif choose_comparison._parameter_value == 'Week' %} ${first_seen_week}
          {% else %}NULL{% endif %} ;;

  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${first_seen_date}) < EXTRACT(DAY FROM CURRENT_DATE()));;
  }

  dimension: wtd_only {
    group_label: "To-Date Filters"
    label: "WTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  ${first_seen_week_of_year} < (EXTRACT(WEEK FROM CURRENT_DATE()));;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  (EXTRACT(DAYOFYEAR FROM ${first_seen_date}) < EXTRACT(DAYOFYEAR FROM CURRENT_DATE()));;
  }
}
