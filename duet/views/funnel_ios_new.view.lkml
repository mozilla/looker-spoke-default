view: funnel_ios_new {

    derived_table: {
      sql: WITH
  retention AS (
  SELECT
    client_id,
    first_seen_date,
    country,
    COALESCE(MAX(IF (submission_date = DATE_ADD(first_run_date, INTERVAL 27 DAY), mozfun.bits28.active_in_range(days_seen_bits, -6, 7), NULL) ), FALSE) AS week_4_retention,
    COUNT(DISTINCT CASE WHEN DATE_DIFF(submission_date, first_run_date, day) >= 1 AND DATE_DIFF(submission_date, first_run_date, day) <= 28 AND days_since_seen = 0 THEN submission_date END) AS first_28_days_active_days
  FROM
    `mozdata.firefox_ios.baseline_clients_last_seen`
  WHERE
    submission_date >= '2022-01-01'
    AND first_seen_date >= '2022-01-01'
    AND NOT (app_display_version = '107.2' AND submission_date >= '2023-02-01') -- incident filter
  GROUP BY
    1,
    2,
    3 ),
  ret_aggs AS (
  SELECT
    first_seen_date AS date,
    country,
    COUNT(DISTINCT CASE WHEN first_28_days_active_days > 1 THEN client_id END) multi_days_users,
    COUNT(DISTINCT CASE WHEN week_4_retention = TRUE THEN client_id END) week_4_retained
  FROM
    retention
  GROUP BY
    1,
    2 )
SELECT
  date,
  country,
  views,
  total_downloads AS downloads,
  first_time_downloads,
  redownloads,
  new_profiles,
  activations,
  multi_days_users,
  week_4_retained
FROM
  `moz-fx-data-shared-prod.firefox_ios.app_store_funnel`
JOIN ret_aggs
USING (date, country)

;;
    }

    dimension: country {
      type: string
      sql: ${TABLE}.country ;;
    }

    dimension_group: date {
      type: time
      datatype: date
      timeframes: [date, week, month, year]
      sql: ${TABLE}.date ;;
      convert_tz: no
    }

    measure: views {
      description: "Unique daily impressions, counted when a customer views the app on the Today, Games, Apps, or Search tabs on the App Store, or on the product page"
      type: sum
      sql: ${TABLE}.views ;;
    }

  measure: redownloads {
    description: "Redownloads"
    type: sum
    sql: ${TABLE}.redownloads ;;
  }
  measure: first_time_downloads {
    description: "first-time downloads"
    type: sum
    sql: ${TABLE}.first_time_downloads ;;
  }

    measure: downloads {
      description: "Total downloads, including first-time downloads and redownloads"
      type: sum
      sql: ${TABLE}.downloads ;;
    }

    measure: new_profiles {
      description: "Unique Client IDs, usually generated when the app is opened for the first time"
      type: sum
      sql: ${TABLE}.new_profiles ;;
    }

    measure: activations {
      description: "Early indicator for LTV based on days of app open and searches on the first week"
      type: sum
      sql: ${TABLE}.activations ;;
    }

  measure: multi_days_users {
    description: "Early indicator for LTV based on days of app open in first 28 days"
    type: sum
    sql: ${TABLE}.multi_days_users ;;
  }

  measure: week_4_retained {
    description: "Early indicator for LTV based on app open in week 4"
    type: sum
    sql: ${TABLE}.week_4_retained ;;
  }

    measure: view_ctr {
      label: "View Click Through Rate"
      type: number
      value_format_name: percent_2
      sql: ${new_profiles}/ NULLIF(${views},0) ;;
    }

  measure: download_2_new_profiles {
    label: "Download to New profiles Rate"
    type: number
    value_format_name: percent_2
    sql: ${new_profiles}/ NULLIF(${downloads},0) ;;
  }

    measure: activation_rate {
      label: "Activation Rate"
      type: number
      value_format_name: percent_2
      sql: ${activations}/ NULLIF(${new_profiles},0) ;;
    }

  measure: multi_days_users_conversion {
    label: "MDU Conversion Rate"
    type: number
    value_format_name: percent_2
    sql: ${multi_days_users}/ NULLIF(${new_profiles},0) ;;
  }

  measure: week_4_retained_rate {
    label: "W4 Rentention Rate"
    type: number
    value_format_name: percent_2
    sql: ${week_4_retained}/ NULLIF(${new_profiles},0) ;;
  }

  filter: current_date {
    type: date
    view_label: "Funnel date filter"
    label: "1. Current Date"
    description: "Select the last date of the period you are interested in"
    convert_tz: no
  }


  dimension: day_month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at daily granularity"
    type:  string
    hidden: no
    view_label: "Funnel date axis"
    sql: FORMAT_DATE("%m-%d", ${TABLE}.date);;
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "Funnel date axis"
    sql: FORMAT_DATE("%m-%B", ${TABLE}.date);;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "Funnel date axis"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.date, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.date, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.date, QUARTER)) = "07" then "Q3"
              ELSE "Q4" end;;
  }

  dimension: filter_end_date {
    type: date
    hidden: yes
    description: "Select the last date of the period you are interested in"
    sql: {% date_end current_date%};;
  }

  parameter: compare_to {
    view_label: "Funnel date filter"
    description: "Select the templated previous period you would like to compare to. Must be used with Current Date filter"
    label: "2. Compare To:"
    type: unquoted
    # allowed_value: {
    #   label: "Previous Period"
    #   value: "Period"
    # }
    allowed_value: {
      label: "Previous Week"
      value: "Week"
    }
    allowed_value: {
      label: "Previous Month"
      value: "Month"
    }
    allowed_value: {
      label: "Previous Quarter"
      value: "Quarter"
    }
    allowed_value: {
      label: "Previous Year"
      value: "Year"
    }
    default_value: "Year"
  }

  dimension: first_date_in_period {
    description: "For a well defined period (YoY, QoQ, MoM, WoW), we use date trunc to get the period start date, for arbitrary period modify this dimension to use date sub and number of days in period"
    type: date
    hidden: yes
    sql: DATE_TRUNC(${filter_end_date}, {% parameter compare_to %});;
  }

  dimension: period_2_start {
    hidden:  yes
    description: "Calculates the start of the previous period"
    type: date
    sql:
        DATE_SUB(${first_date_in_period}, INTERVAL 1 {% parameter compare_to %});;
    convert_tz: no
  }

  dimension: period_2_end {
    hidden:  yes
    description: "Calculates the end of the previous period"
    type: date
    sql:
        DATE_SUB(${filter_end_date}, INTERVAL 1 {% parameter compare_to %});;
    convert_tz: no
  }


  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this to create the measures for the respective periods (this = current period, last = previous period)"
    type: string
    sql:
        {% if current_date._is_filtered %}
            CASE
            WHEN DATE(${TABLE}.date) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${TABLE}.date) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }

  measure: current_period_views {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.views ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_views {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.views ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.downloads ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.downloads ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_redownloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.redownloads ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_redownloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.redownloads ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_rfirst_time_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.first_time_downloads ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_first_time_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.first_time_downloads ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_new_profiles {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.new_profiles ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_new_profiles {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.new_profiles ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_activations {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.activations ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_activations {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.activations ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_multi_days_users {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.multi_days_users ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_multi_days_users {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.multi_days_users ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_week_4_retained {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.week_4_retained ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_week_4_retained {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.week_4_retained ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_activation_rate {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.activation_rate ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_activation_rate {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.activation_rate ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_multi_days_users_conversion {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.multi_days_users_conversion ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_multi_days_users_conversion {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.multi_days_users_conversion ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_week_4_retained_rate {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.week_4_retained_rate ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_week_4_retained_rate {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.week_4_retained_rate ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_view_ctr {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.view_ctr ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_view_ctr {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.view_ctr ;;
    filters: [period_filtered_measures: "last"]
  }


  measure: current_period_download_2_new_profiles {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.download_2_new_profiles ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_download_2_new_profiles {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.download_2_new_profiles ;;
    filters: [period_filtered_measures: "last"]
  }

  measure:  unique_days_prefiltered {
    label: "Number of unique days in period"
    type: count_distinct
    sql: ${TABLE}.date ;;
    filters: [period_filtered_measures: "this"]
  }

  measure:  unique_days_prev_prefiltered {
    label: "Number of unique days previous period"
    type: count_distinct
    sql: ${TABLE}.date ;;
    filters: [period_filtered_measures: "last"]
  }

  }
