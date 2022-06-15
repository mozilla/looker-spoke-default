include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates.view.lkml"

view: active_users_aggregates_mv {
  derived_table: {
    create_process: {
      sql_step:
        CREATE MATERIALIZED VIEW ${SQL_TABLE_NAME} AS
        SELECT
          segment,
          app_version,
          attribution_medium,
          attribution_source,
          city,
          country,
          distribution_id,
          is_default_browser,
          app_name,
          channel,
          os,
          os_version,
          os_version_major,
          os_version_minor,
          submission_date,
          first_seen_year,
          attributed,
          language_name,
          SUM(new_profiles) AS new_profiles,
          SUM(mau) AS mau,
          SUM(dau) AS dau,
          SUM(wau) AS wau,
          SUM(ad_clicks) AS ad_clicks,
          SUM(active_hours) AS active_hours,
          SUM(organic_search_count) AS organic_search_count,
          SUM(search_count) AS search_count,
          SUM(search_with_ads) AS search_with_ads,
          SUM(uri_count) AS uri_count
        FROM `moz-fx-data-shared-prod.telemetry_derived.active_users_aggregates_v1`
        WHERE submission_date >= '2021-01-01'
        GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18;;
    }
    sql_trigger_value: 1 ;;
    publish_as_db_view: yes
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
    sql: ${TABLE}.submission_date ;;
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
    # order_by_field: sort_hack1 # Important # WON: no dimension called sort_hack1
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
    # order_by_field: sort_hack2 # Important # WON: no dimension called sort_hack2
    order_by_field: sort_by2
    sql:
          {% if choose_comparison._parameter_value == 'Year' %} ${submission_year}
          {% elsif choose_comparison._parameter_value == 'Month' %} ${submission_month}
          {% elsif choose_breakdown._parameter_value == 'WOY' %} ${submission_week_of_year}
          {% elsif choose_breakdown._parameter_value == 'Month_Day' %} ${day_month_abbreviation}
          {% else %}NULL{% endif %} ;;
  }

  dimension: app_name {
    label: "Browser Name"
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: app_version{
    label: "Browser Version"
    type: string
    sql: ${TABLE}.app_version ;;
  }

  dimension: attribution_medium {
    label: "Attribution Medium"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_medium ;;
  }

  dimension: attribution_source {
    label: "Attribution Source"
    type:  string
    group_label: "Attribution"
    sql: ${TABLE}.attribution_source ;;
  }

  dimension: segment {
    label: "Segment"
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension: city {
    label: "City"
    type: string
    sql: ${TABLE}.city;;
  }

  dimension: country {
    label: "Country"
    type: string
    sql: ${TABLE}.country;;
  }

  dimension: distribution_id {
    label: "Distribution ID"
    type: string
    sql: ${TABLE}.distribution_id;;
  }

  dimension: channel {
    label: "Channel"
    type: string
    sql: ${TABLE}.channel;;
  }

  dimension: first_seen_year {
    label: "First Seen Year"
    type: string
    sql: ${TABLE}.first_seen_year;;
  }

  dimension: attributed {
    label: "Is Attributed"
    type: string
    sql: ${TABLE}.attributed;;
  }

  dimension: language_name {
    label: "Language"
    type: string
    sql: ${TABLE}.language_name;;
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
    label: "New Profiles"
    type: sum
    sql:  ${TABLE}.new_profiles ;;
  }

  measure: ad_click {
    label: "Ad clicks"
    type: sum
    sql:  ${TABLE}.ad_clicks ;;
  }

  measure: organic_search_counts {
    label: "Organic Search counts"
    type: sum
    sql:  ${TABLE}.organic_search_count ;;
  }

  measure: search_counts {
    label: "Search counts"
    type: sum
    sql:  ${TABLE}.search_count ;;
  }

  measure: search_with_ads {
    label: "Search with Ads"
    type: sum
    sql:  ${TABLE}.search_with_ads ;;
  }

  measure: uri_counts {
    label: "URI counts"
    type: sum
    sql:  ${TABLE}.uri_count;;
  }

  measure: active_hour {
    label: "Active Hours"
    type: sum
    sql:  ${TABLE}.active_hours ;;
  }

  dimension: is_default_browser {
    type:  string
    case: {
      when: {
        sql: ${TABLE}.is_default_browser = true ;;
        label: "yes"
      }

      when: {
        sql: ${TABLE}.is_default_browser = false ;;
        label: "no"
      }

      when: {
        sql: ${TABLE}.is_default_browser is NULL ;;
        label: "unknown"
      }
    }
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
}
