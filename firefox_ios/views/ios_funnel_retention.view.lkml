view: ios_funnel_retention {

  derived_table: {
    sql:
      SELECT first_seen_date,
             first_reported_country,
             adjust_ad_group,
            adjust_campaign,
            adjust_creative,
            adjust_network,
            adjust_network,
            first_reported_isp,
            COUNT(1) as new_profiles,
            COUNTIF(repeat_first_month_user) as repeat_user,
            COUNTIF(retained_week_4) retained_week_4
      FROM
        `moz-fx-data-shared-prod.firefox_ios.funnel_retention`
        group by 1, 2, 3, 4, 5, 6, 7, 8
      ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.first_reported_country ;;
  }

  dimension_group: date {
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_seen_date ;;
    convert_tz: no
  }

  dimension: adjust_ad_group {
    type: string
    sql: ${TABLE}.adjust_ad_group ;;
  }

  dimension: adjust_campaign {
    type: string
    sql: ${TABLE}.adjust_campaign ;;
  }

  dimension: adjust_creative {
    type: string
    sql: ${TABLE}.adjust_creative ;;
  }

  dimension: adjust_network {
    type: string
    sql: ${TABLE}.adjust_network ;;
  }

  dimension: first_reported_isp {
    type: string
    sql: ${TABLE}.first_reported_isp ;;
  }

  measure: new_profiles {
    description: "New Profile counts on a given first seen date"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: repeat_user {
    description: "Number of new profiles that visted more than once in their first 28-day window"
    type: sum
    sql: ${TABLE}.repeat_user ;;
  }

  measure: retained_week_4 {
    description: "Number of new profiles that were retained in week 4 after their first seen date"
    type: sum
    sql: ${TABLE}.retained_week_4 ;;
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
    sql: FORMAT_DATE("%m-%d", ${TABLE}.first_seen_date);;
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "Funnel date axis"
    sql: FORMAT_DATE("%m-%B", ${TABLE}.first_seen_date);;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "Funnel date axis"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.first_seen_date, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.first_seen_date, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.first_seen_date, QUARTER)) = "07" then "Q3"
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

  measure: current_period_repeat_user {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.repeat_user ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_repeat_user {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.repeat_user ;;
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

  measure: current_period_retained_week_4 {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.retained_week_4 ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_retained_week_4 {
    view_label: "filtered metrics"
    type: sum
    sql: ${TABLE}.retained_week_4 ;;
    filters: [period_filtered_measures: "last"]
  }
}
