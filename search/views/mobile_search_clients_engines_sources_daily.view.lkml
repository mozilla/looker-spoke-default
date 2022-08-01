include: "//looker-hub/search/views/mobile_search_clients_engines_sources_daily.view.lkml"

view: +mobile_search_clients_engines_sources_daily {
  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      day_of_year,
      day_of_month,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
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
  dimension: day_month_abbreviation {
    type:  date
    hidden: yes
    view_label: "Date/Period Selection"
    convert_tz: no
    datatype:  date
    sql: FORMAT_DATE("%b %d", ${TABLE}.submission_date);;
  }
  dimension: day_month_number {
    type:  date
    hidden: yes
    view_label: "Date/Period Selection"
    datatype:  date
    sql: FORMAT_DATE("%m-%d", ${TABLE}.submission_date);;
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

  measure: total_searches {
    label: "SAP Searches"
    type: sum
    sql: ${sap} ;;
    description: "Total searches from all Search Access Points (SAPs), not including follow-ons.
    These may or may not be tagged."
  }

  measure: total_tagged_sap_searches {
    label: "Tagged SAP Searches"
    type: sum
    sql: ${tagged_sap} ;;
    description: "Total tagged searches from all Search Access Points (SAPs)."
  }

  measure: total_tagged_searches {
    label: "Tagged Searches"
    type: sum
    sql: ${tagged_sap} + ${tagged_follow_on} ;;
    description: "Total tagged searches from all Search Access Points (SAPs) and follow-ons."
  }

  measure: total_tagged_follow_on_searches {
    label: "Tagged Follow-on Searches"
    type: sum
    sql: ${tagged_follow_on} ;;
    description: "Total follow-on searches, which occur after a search from a Search Access Point (SAP)."
  }

  measure: total_organic_searches {
    label: "Organic Searches"
    type: sum
    sql: ${organic} ;;
    description: "Total organic searches, made directly at the engine's website."
  }

  measure: total_searches_with_ads {
    label: "Searches With Ads"
    type: sum
    sql: ${search_with_ads} ;;
    description: "Total searches with ads. Does not include organic searches."
  }

  measure: total_ad_clicks {
    label: "Ad Clicks"
    type: sum
    sql: ${ad_click} ;;
    description: "Total ad clicks. Does not include ad clicks resulting from organic searches."
  }

  measure: total_organic_ad_clicks {
    label: "Organic Ad Clicks"
    type: sum
    sql: ${ad_click_organic} ;;
    description: "Total organic ad clicks."
  }
}
