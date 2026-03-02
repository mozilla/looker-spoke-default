include: "../views/cohort_daily_statistics.view.lkml"

view: growth_activation {

  extends: [cohort_daily_statistics]

  parameter: average_window {
    label: "Moving average"
    type: string
    allowed_value: {
      label: "Single Day"
      value: "1"
    }
    allowed_value: {
      label: "7-day"
      value: "7"
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
    view_label: "Year over Year"
    description: "Date offset to current year for YoY charts"
    type: date
    sql: DATE_ADD(${TABLE}.cohort_date, INTERVAL DATE_DIFF(CURRENT_DATE(), ${TABLE}.cohort_date, YEAR) YEAR) ;;
  }

  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Year over Year"
    description: "Only include dates up until yesterday"
    type: yesno
    sql: ${date_yoy} <= CURRENT_DATE() - 1;;
  }

  filter: current_date {
    type: date
    view_label: "KPI date filter"
    label: "1. Current Date"
    description: "Select the last date of the period you are interested in"
    convert_tz: no
  }

  dimension: day_month {
    description: "this dimension will help us trend well period over period analysis for YoY, MoM and QoQ at daily granularity"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: FORMAT_DATE("%m-%d", ${cohort_date});;
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: FORMAT_DATE("%m-%B", ${cohort_date});;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${cohort_date}, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${cohort_date}, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${cohort_date}, QUARTER)) = "07" then "Q3"
              ELSE "Q4" end;;
  }

  dimension: filter_end_date {
    type: date
    hidden: yes
    description: "Select the last date of the period you are interested in"
    sql: {% date_end current_date%};;
  }

  parameter: compare_to {
    view_label: "KPI date filter"
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
            WHEN DATE(${cohort_date}) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${cohort_date}) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }



  measure: current_period_num_clients_in_cohort {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.num_clients_in_cohort;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_num_clients_in_cohort {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.num_clients_in_cohort;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_clients_active_on_day {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.num_clients_active_on_day;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_clients_active_on_day {
    view_label: "KPI filtered metrics"
    type: sum
    sql:  ${TABLE}.num_clients_active_on_day;;
    filters: [period_filtered_measures: "last"]
  }

  dimension: normalized_country {
    description: "Normalizing country name to focus on major markets"
    type: string
    hidden: no
    sql: CASE WHEN ${country} in ('US','CA','GB','DE','FR','ES','IT','BR','MX','IN','ID','CN','RU') THEN ${country} ELSE "ROW" END ;;
  }

  dimension: cleaned_os {
    description: "Recategorizing OS to match all tables that will be used in the dashboard"
    type: string
    hidden: no
    sql: CASE WHEN lower(${normalized_os}) like 'windows%' THEN 'Windows'
          WHEN ${normalized_os} = 'Darwin' THEN 'Mac'
          WHEN ${normalized_os}  = 'Linux' THEN ${normalized_os}
          ELSE "Other" END ;;
  }

  dimension: windows_10_flag {
    description: "windows 10 flag"
    type: string
    hidden: no
    sql: CASE WHEN ${normalized_os} = 'Windows_NT' AND ${os_version_major} = 10 THEN 'Yes'
          ELSE "No" END ;;
  }


}
