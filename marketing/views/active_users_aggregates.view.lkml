include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates.view.lkml"

view: +active_users_aggregates {

  filter: current_date {
    type: date
    view_label: "Current date filter"
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
    view_label: "Year over Year"
    description: "Date offset to current year for YoY charts"
    type: date
    sql: DATE_ADD(${TABLE}.submission_date, INTERVAL DATE_DIFF(${filter_end_date}, ${TABLE}.submission_date, YEAR) YEAR) ;;
  }

  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Year over Year"
    description: "Only include dates up until yesterday"
    type: yesno
    sql: ${date_yoy} <= ${filter_end_date} - 1;;
  }



  dimension: month_end {
    description: "This will help us only the month ending date for DAU"
    sql: LAST_DAY(submission_date, MONTH) = ${TABLE}.submission_date ;;
    type: yesno
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

  measure: daily_dau {
    label: "DAU"
    type: sum
    sql: ${TABLE}.dau;;
  }


}
