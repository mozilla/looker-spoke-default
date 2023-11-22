include: "//looker-hub/firefox_ios/views/app_store_funnel_table.view.lkml"

view: +app_store_funnel_table {

  dimension: first_time_downloads {
    hidden: yes
    sql: ${TABLE}.first_time_downloads ;;
    type: number
    description: "Number of first time downloads of the Firefox iOS app from the Apple Store.
    "
  }

  dimension: impressions {
    hidden: yes
    sql: ${TABLE}.impressions ;;
    type: number
    description: "Number of Firefox iOS app unique impressions in the Apple Store.
    "
  }

  dimension: new_profiles {
    hidden: yes
    sql: ${TABLE}.new_profiles ;;
    type: number
    description: "Number of new profiles on the date.
    "
  }

  dimension: redownloads {
    hidden: yes
    sql: ${TABLE}.redownloads ;;
    type: number
    description: "Number of redownloads of the Firefox iOS app from the Apple Store.
    "
  }

  dimension: total_downloads {
    hidden: yes
    sql: ${TABLE}.total_downloads ;;
    type: number
    description: "Total number of downloads of the Firefox iOS app from the Apple Store.
    "
  }

  measure: impressions_total{
    label: "Impressions"
    description: "Unique daily impressions, counted when a customer views the app on the Today, Games, Apps, or Search tabs on the App Store, or on the product page"
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: redownloads_total {
    label: "Redownloads"
    description: "Redownloads"
    type: sum
    sql: ${TABLE}.redownloads ;;
  }
  measure: first_time_downloads_total {
    label: "First time downloads"
    description: "first-time downloads"
    type: sum
    sql: ${TABLE}.first_time_downloads ;;
  }

  measure: downloads_total {
    label: "Downloads"
    description: "Total downloads, including first-time downloads and redownloads"
    type: sum
    sql: ${TABLE}.total_downloads ;;
  }

  measure: new_profiles_sum {
    label: "New profiles"
    description: "Unique Client IDs, usually generated when the app is opened for the first time"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }


  measure: impressions_ctr {
    label: "Impressions_ctr Click Through Rate"
    type: number
    value_format_name: percent_2
    sql: ${total_downloads}/ NULLIF(${impressions},0) ;;
  }

  measure: download_2_new_profiles {
    label: "Download to New profiles Rate"
    type: number
    value_format_name: percent_2
    sql: ${new_profiles}/ NULLIF(${total_downloads},0) ;;
  }

  # measure: multi_days_users_conversion {
  #   label: "MDU Conversion Rate"
  #   type: number
  #   value_format_name: percent_2
  #   sql: ${multi_days_users}/ NULLIF(${new_profiles},0) ;;
  # }

  # measure: week_4_retained_rate {
  #   label: "W4 Rentention Rate"
  #   type: number
  #   value_format_name: percent_2
  #   sql: ${week_4_retained}/ NULLIF(${new_profiles},0) ;;
  # }

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
    sql: FORMAT_DATE("%m-%d", ${first_seen_date});;
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "Funnel date axis"
    sql: FORMAT_DATE("%m-%B", ${first_seen_date});;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "Funnel date axis"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${first_seen_date}, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${first_seen_date}, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${first_seen_date}, QUARTER)) = "07" then "Q3"
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
            WHEN DATE(${TABLE}.first_seen_date) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${TABLE}.first_seen_date) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }

  measure: current_period_impressions {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.impressions ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_impressions {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.impressions ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.total_downloads ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.total_downloads ;;
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

  measure: current_period_first_time_downloads {
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


  # measure: current_period_multi_days_users {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.multi_days_users ;;
  #   filters: [period_filtered_measures: "this"]
  # }

  # measure: previous_period_multi_days_users {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.multi_days_users ;;
  #   filters: [period_filtered_measures: "last"]
  # }

  # measure: current_period_week_4_retained {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.week_4_retained ;;
  #   filters: [period_filtered_measures: "this"]
  # }

  # measure: previous_period_week_4_retained {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.week_4_retained ;;
  #   filters: [period_filtered_measures: "last"]
  # }



  # measure: current_period_multi_days_users_conversion {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.multi_days_users_conversion ;;
  #   filters: [period_filtered_measures: "this"]
  # }

  # measure: previous_period_multi_days_users_conversion {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.multi_days_users_conversion ;;
  #   filters: [period_filtered_measures: "last"]
  # }

  # measure: current_period_week_4_retained_rate {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.week_4_retained_rate ;;
  #   filters: [period_filtered_measures: "this"]
  # }

  # measure: previous_period_week_4_retained_rate {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.week_4_retained_rate ;;
  #   filters: [period_filtered_measures: "last"]
  # }

  # measure: current_period_view_ctr {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.view_ctr ;;
  #   filters: [period_filtered_measures: "this"]
  # }

  # measure: previous_period_view_ctr {
  #   view_label: "filtered metrics"
  #   type: sum
  #   sql: ${TABLE}.view_ctr ;;
  #   filters: [period_filtered_measures: "last"]
  # }


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
