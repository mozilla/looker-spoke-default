include: "//looker-hub/firefox_desktop/views/desktop_cohort_daily_retention.view.lkml"

view: +desktop_cohort_daily_retention {

  # Hide metric columns showing as dimensions
  dimension: cohort {
    hidden: yes
  }

  dimension: num_clients_active_atleastonce_in_last_28_days {
    hidden: yes
  }

  dimension: num_clients_active_atleastonce_in_last_7_days {
    hidden: yes
  }

  dimension: num_clients_active_on_day {
    hidden: yes
  }

  dimension: num_clients_dau_active_atleastonce_in_last_28_days {
    hidden: yes
  }

  dimension: num_clients_dau_active_atleastonce_in_last_7_days {
    hidden: yes
  }

  dimension: num_clients_dau_on_day {
    hidden: yes
  }

  dimension: country {
    hidden: yes
  }

  dimension: num_clients_in_cohort {
    hidden: yes
  }

  dimension: num_clients_repeat_first_month_users {
    hidden: yes
  }

  dimension: num_clients_repeat_first_month_users {
    hidden: yes
  }


  # Custom

  # Define measures
  measure: cohort_measure {
    label: "New Profiles (cohort)"
    type:  sum
    sql: (${TABLE}.num_clients_in_cohort) ;;
    description: "Total number of clients present in this cohort. Will always be greater than or equal to 'Num Clients Active In Period'."
  }

  measure: num_clients_active_on_day_measure {
    label: "clients - sent ping on day"
    type: sum
    sql:  ${TABLE}.num_clients_active_on_day ;;
    hidden: yes
  }

  measure: num_clients_dau_on_day_measure {
    label: "clients - qualified as DAU on day"
    type: sum
    sql:  ${TABLE}.num_clients_dau_on_day ;;
    hidden: yes
  }

  measure: num_clients_active_atleastonce_in_last_7_days_measure {
    label: "clients - sent ping at least once in last 7 days"
    type: sum
    sql:  ${TABLE}.num_clients_active_atleastonce_in_last_7_days ;;
    hidden: yes
  }

  measure: num_clients_dau_active_atleastonce_in_last_7_days_measure {
    label: "clients - DAU at least once in last 7 days"
    type: sum
    sql:  ${TABLE}.num_clients_dau_active_atleastonce_in_last_7_days ;;
    hidden: yes
  }

  measure: num_clients_active_atleastonce_in_last_28_days_measure {
    label: "clients - sent ping at least once in last 28 days"
    type: sum
    sql:  ${TABLE}.num_clients_active_atleastonce_in_last_28_days ;;
    hidden: yes
  }

  measure: num_clients_dau_active_atleastonce_in_last_28_days_measure {
    label: "clients - DAU at least once in last 28 days"
    type: sum
    sql:  ${TABLE}.num_clients_dau_active_atleastonce_in_last_28_days ;;
    hidden: yes
  }

  measure: num_clients_active_in_period_pings {
    label: "clients - sent a ping during the retention period "
    type: sum
    sql:  CASE WHEN {% parameter retention_period_picker %} = 1 THEN ${TABLE}.num_clients_active_on_day WHEN {% parameter retention_period_picker %} = 7 THEN ${TABLE}.num_clients_active_atleastonce_in_last_7_days WHEN {% parameter retention_period_picker %} = 28 THEN ${TABLE}.num_clients_active_atleastonce_in_last_28_days ELSE 0 END;;
    hidden: yes
  }

  measure: num_clients_dau_in_period {
    label: "clients - qualified as DAU during the retention period "
    type: sum
    sql:  CASE WHEN {% parameter retention_period_picker %} = 1 THEN ${TABLE}.num_clients_dau_on_day WHEN {% parameter retention_period_picker %} = 7 THEN ${TABLE}.num_clients_dau_active_atleastonce_in_last_7_days WHEN {% parameter retention_period_picker %} = 28 THEN ${TABLE}.num_clients_dau_active_atleastonce_in_last_28_days ELSE 0 END;;
    description: "A client qualifies as DAU if they browse at least 1 URL and have greater than 0 active hours."
  }

  measure: retention_ping_rate {
    label: "Retention Rate"
    type: number
    sql: SAFE_DIVIDE(${num_clients_active_in_period_pings}, ${cohort_measure}) ;;
    value_format: "0.00%"
    description: "The percentage of clients in the cohort who sent a ping during the selected period."
    hidden: yes
  }

  measure: retention_rate {
    label: "Retention Rate"
    type: number
    sql: SAFE_DIVIDE(${num_clients_dau_in_period}, ${cohort_measure}) ;;
    value_format: "0.00%"
    description: "A client is retained if they qualify as DAU during the retention period. A client qualifies as DAU if they browse at least 1 URL and have greater than 0 active hours."
  }

# Retention Dimensions

  parameter: retention_period_picker {
    description: "The length of the retention period. If daily is selected, the second period for a cohort that was new on Jan 1st will be Jan 2nd. If weekly is selected, the first period will cover Jan 2-7, and the second period Jan 8-14. Monthly is 28 day periods. In all cases, we ignore a cohort's first day."
    type: unquoted
    allowed_value: {
      label: "Daily"
      value: "1"
    }
    allowed_value: {
      label: "Weekly"
      value: "7"
    }
    allowed_value: {
      label: "Monthly"
      value: "28"
    }
  }

  dimension: retention_period {
    label: "Retention Period"
    type:  number
    description: "Only Works if Selection is Made in Retention Period Picker"
    sql: IF(MOD(DATE_DIFF(${TABLE}.submission_date, ${TABLE}.first_seen_date, DAY) + 1, {% parameter retention_period_picker %}) = 0, SAFE_DIVIDE(DATE_DIFF(${TABLE}.submission_date, ${TABLE}.first_seen_date, DAY) + 1, {% parameter retention_period_picker %}), NULL) ;;
  }


# Group Dimensions
  dimension: attribution_campaign {
    label: "Campaign"
    description: "The campaign the user was acquired from. This is pulled using last non-direct click attribution from Google Analytics, and is only available for Windows. For details, see https://support.google.com/analytics/answer/1662518"
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
    description: "Attribution Source of the Firefox Download. Will be non-null for all attributed clients."
  }

  dimension: attribution_ua {
    label: "User Agent"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_ua ;;
    description: "User Agent of Client that Downloaded Firefox"
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
