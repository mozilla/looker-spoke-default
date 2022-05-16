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

  # Hide metric columns showing as dimensions
  dimension: mau {
    hidden: yes
    sql: ${TABLE}.mau ;;
  }

  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }

  dimension: wau {
    hidden: yes
    sql: ${TABLE}.wau ;;
  }

  dimension: new_profiles {
    hidden: yes
    sql: ${TABLE}.new_profiles ;;
  }

  dimension: ad_clicks {
    hidden: yes
    sql: ${TABLE}.ad_clicks ;;
  }

  dimension: organic_search_count {
    hidden: yes
    sql: ${TABLE}.organic_search_count ;;
  }

  dimension: search_count {
    hidden: yes
    sql: ${TABLE}.search_count ;;
  }

  dimension: search_with_ads {
    hidden: yes
    sql: ${TABLE}.search_with_ads ;;
  }

  dimension: uri_count {
    hidden: yes
    sql: ${TABLE}.uri_count ;;
  }

  dimension: active_hours {
    hidden: yes
    sql: ${TABLE}.active_hours ;;
  }

  # Define measures
  measure: daily_active_users {
    label: "DAU"
    type:  sum
    sql: (${TABLE}.dau) ;;
  }

  measure: weekly_active_users {
    label: "WAU"
    type: sum
    sql:  ${TABLE}.wau ;;
  }

  measure: monthly_active_users {
    label: "MAU"
    type: sum
    sql:  ${TABLE}.mau ;;
  }

  measure: new_profile {
    label: "New Profile"
    type: sum
    sql:  ${TABLE}.new_profiles ;;
  }

  measure: ad_click {
    label: "Ad Clicks"
    type: sum
    sql:  ${TABLE}.ad_clicks ;;
  }

  measure: organic_search_counts {
    label: "Organic Search Counts"
    type: sum
    sql:  ${TABLE}.organic_search_count ;;
  }

  measure: search_counts {
    label: "Search Counts"
    type: sum
    sql:  ${TABLE}.search_count ;;
  }

  measure: search_with_ad {
    label: "Search With Ads"
    type: sum
    sql:  ${TABLE}.search_with_ads ;;
  }

  measure: uri_counts {
    label: "URI Counts"
    type: sum
    sql:  ${TABLE}.uri_count ;;
  }

  measure: active_hour {
    label: "Active Hours"
    type: sum
    sql:  ${TABLE}.active_hours ;;
  }

# Group dimensions in Explore
  dimension: os {
    sql: ${TABLE}.os ;;
    group_label: "OS"
  }
  dimension: os_version {
    sql: ${TABLE}.os_version ;;
    group_label: "OS"
  }
  dimension: os_version_major {
    sql: ${TABLE}.os_version_major ;;
    group_label: "OS"
  }
  dimension: os_version_minor {
    sql: ${TABLE}.os_version_minor ;;
    group_label: "OS"
  }

  dimension: attribution_source {
    sql: ${TABLE}.attribution_source ;;
    group_label: "Attribution"
  }
  dimension: attribution_medium {
    sql: ${TABLE}.attribution_medium ;;
    group_label: "Attribution"
  }
  dimension: attribution_campaign {
    sql: ${TABLE}.attribution_campaign ;;
    group_label: "Attribution"
  }
  dimension: attribution_content {
    sql: ${TABLE}.attribution_content ;;
    group_label: "Attribution"
  }

  dimension: attribution_experiment {
    sql: ${TABLE}.attribution_experiment ;;
    group_label: "Attribution - Experiments"
  }

  dimension: attribution_variation {
    sql: ${TABLE}.attribution_variation ;;
    group_label: "Attribution - Experiments"
  }


}
