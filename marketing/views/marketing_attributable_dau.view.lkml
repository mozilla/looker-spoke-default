include: "//looker-hub/growth/views/rolling_28_day_dau.view.lkml"

view: marketing_attributable_dau{
  extends: [rolling_28_day_dau]

  filter: current_date {
    type: date
    view_label: "Period over Period"
    label: "1. Current Date"
    description: "Select the last date of the period you are interested in"
    convert_tz: no
  }

  dimension: filter_end_date {
    type: date
    hidden: yes
    description: "Select the last date of the period you are interested in"
    sql: {% date_end current_date%};;
  }

  parameter: average_window {
    label: "Moving average"
    type: string
    allowed_value: {
      label: "Single Day"
      value: "1"
    }
    allowed_value: {
      label: "28-day"
      value: "28"
    }
  }

  dimension: days_avg {
    label: "# of Days average"
    description: "Value selected on Moving average filter"
    type: number
    sql: {% parameter average_window %} ;;
  }

  dimension: date_yoy {
    label: "Date (YoY)"
    view_label: "Period over Period"
    description: "Date offset to current year for YoY charts"
    type: date
    sql: DATE_ADD(${TABLE}.submission_date, INTERVAL DATE_DIFF(${filter_end_date}, ${TABLE}.submission_date, YEAR) YEAR) ;;
  }

  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Period over Period"
    description: "Only include dates up until yesterday"
    type: yesno
    sql: ${date_yoy} <= ${filter_end_date} - 1;;
  }



  dimension: month_end {
    description: "This will help us only the month ending date for DAU"
    sql: LAST_DAY(submission_date, MONTH) = ${TABLE}.submission_date ;;
    type: yesno
  }

  dimension: quarter_end {
    description: "This will help us only the month ending date for DAU"
    sql: LAST_DAY(submission_date, QUARTER) = ${TABLE}.submission_date ;;
    type: yesno
  }

  dimension: first_seen_year {
    sql: ${TABLE}.first_seen_year ;;
    type: number
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "Period over Period"
    sql: FORMAT_DATE("%m-%B", ${TABLE}.submission_date);;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "Period over Period"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.submission_date, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.submission_date, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.submission_date, QUARTER)) = "07" then "Q3"
              ELSE "Q4" end;;
  }


  parameter: compare_to {
    view_label: "Period over Period"
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
        CASE WHEN DATE_SUB(${filter_end_date}, INTERVAL 1 {% parameter compare_to %}) != LAST_DAY(DATE_SUB(${filter_end_date}, INTERVAL 1 {% parameter compare_to %}), MONTH)
            THEN LAST_DAY(DATE_SUB(${filter_end_date}, INTERVAL 1 {% parameter compare_to %}), MONTH)
            ELSE DATE_SUB(${filter_end_date}, INTERVAL 1 {% parameter compare_to %}) END;;
    convert_tz: no
  }


  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this to create the measures for the respective periods (this = current period, last = previous period)"
    type: string
    sql:
        {% if current_date._is_filtered %}
            CASE
            WHEN DATE(${TABLE}.submission_date) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${TABLE}.submission_date) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }

  dimension: app_name {
    description: "This will help us only the month ending date for DAU"
    sql: ${TABLE}.app_name ;;
    type: string
  }

  dimension: country {
    description: "This will help us only the month ending date for DAU"
    sql: ${TABLE}.country ;;
    type: string
  }


  dimension: paid_vs_organic {
    description: " This field helps us isolate paid clients"
    sql: CASE WHEN (LOWER(${TABLE}.attribution_medium) IN ('paidsearch','paiddisplay','cpc',
                                                             'display','paidsocial','paidvideo','ppc')
                  OR LOWER(${TABLE}.adjust_network ) IN ('google ads aci', 'apple search ads')) THEN "Paid"
                ELSE "Organic" END;;
    type: string
  }

  # Hide metric columns showing as dimensions
  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }

  dimension: ma_28_dau {
    hidden: yes
    sql: ${TABLE}.ma_28_dau ;;
  }

  measure: daily_dau {
    label: "DAU"
    type: sum
    sql: ${TABLE}.dau;;
  }

  measure: kpi_dau {
    label: "KPI DAU"
    type: sum
    sql: ${TABLE}.ma_28_dau;;
  }

  measure: current_period_dau {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.dau;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_dau{
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.dau;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_kpi_dau {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.ma_28_dau;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_kpi_dau{
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.ma_28_dau;;
    filters: [period_filtered_measures: "last"]
  }

}
