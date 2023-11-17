include: "//looker-hub/fenix/views/android_store_performance.view.lkml"

view: +android_store_performance {

  dimension: Store_listing_acquisitions {
    hidden: yes
    sql: ${TABLE}.Store_listing_acquisitions ;;
    type: number
  }

  dimension: Store_listing_conversion_rate {
    hidden: yes
    sql: ${TABLE}.Store_listing_conversion_rate ;;
    type: number
  }

  dimension: Store_listing_visitors {
    hidden: yes
    sql: ${TABLE}.Store_listing_visitors ;;
    type: number
  }

  measure: impressions_total{
    label: "Impressions"
    description: "The number of users who visited your store listing who didn’t already have your app installed on any of their devices."
    type: sum
    sql: ${Store_listing_visitors} ;;
  }



  measure: downloads_total {
    label: "Downloads"
    description: "The number of users who visited your store listing and installed your app, who didn’t have it installed on any other devices at the time."
    type: sum
    sql: ${Store_listing_acquisitions} ;;
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

  measure: current_period_impressions {
    view_label: "filtered metrics"
    type: sum
    sql: ${Store_listing_visitors} ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_impressions {
    view_label: "filtered metrics"
    type: sum
    sql: ${Store_listing_visitors} ;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${Store_listing_acquisitions} ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_downloads {
    view_label: "filtered metrics"
    type: sum
    sql: ${Store_listing_acquisitions} ;;
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
