include: "../views/desktop_engagement.view.lkml"

view: growth_engagement{

  extends: [desktop_engagement]

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
    sql: FORMAT_DATE("%m-%d", ${submission_date});;
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: FORMAT_DATE("%m-%B", ${submission_date});;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${submission_date}, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${submission_date}, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${submission_date}, QUARTER)) = "07" then "Q3"
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
            WHEN DATE(${submission_date}) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${submission_date}) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }



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

  dimension: is_desktop {
    label: "Included in KPI"
    description: "Filter that define if record is included in the DAU KPI"
    sql: ${TABLE}.is_desktop ;;
  }

  dimension: date_yoy {
    label: "Date (YoY)"
    view_label: "Year over Year"
    description: "Date offset to current year for YoY charts"
    type: date
    sql: DATE_ADD(${TABLE}.submission_date, INTERVAL DATE_DIFF(CURRENT_DATE(), ${TABLE}.submission_date, YEAR) YEAR) ;;
  }
  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Year over Year"
    description: "Only include dates up until yesterday"
    type: yesno
    sql: ${date_yoy} < CURRENT_DATE() ;;
  }

  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }
  dimension: wau {
    hidden: yes
    sql: ${TABLE}.wau ;;
  }
  dimension: mau {
    hidden: yes
    sql: ${TABLE}.mau ;;
  }

  measure: dau_sum {
    group_label: "Client Counts"
    label: "(non-official) DAU"
    type: sum
    sql: ${TABLE}.dau ;;
    description: "Daily Active Users, but historical values underestimated due to shredder"
  }
  measure: wau_sum {
    group_label: "Client Counts"
    label: "(non-official) WAU"
    type: sum
    sql: ${TABLE}.wau ;;
    description: "Weekly Active Users, but historical values underestimated due to shredder"
  }
  measure: mau_sum {
    group_label: "Client Counts"
    label: "(non-official) MAU"
    type: sum
    sql: ${TABLE}.mau ;;
    description: "Monthly Active Users, but historical values underestimated due to shredder"
  }

  measure: engagement_rate {
    label: "Engagement Rate"
    type: number
    value_format_name: percent_2
    sql: ${dau_sum}/ NULLIF(${mau_sum},0) ;;
  }

  dimension: attribution_campaign {
    group_label: "Attribution"
    label: "Campaign"
    type: string
    sql: ${TABLE}.attribution_campaign ;;
  }
  dimension: attribution_medium {
    group_label: "Attribution"
    label: "Medium"
    type: string
    sql: ${TABLE}.attribution_medium ;;
  }
  dimension: attribution_content {
    group_label: "Attribution"
    label: "Content"
    type: string
    sql: ${TABLE}.attribution_content ;;
  }
  dimension: attribution_dlsource {
    group_label: "Attribution"
    label: "Download Source"
    type: string
    sql: ${TABLE}.attribution_dlsource ;;
  }
  dimension: attribution_ua {
    group_label: "Attribution"
    label: "User Agent"
    type: string
    sql: ${TABLE}.attribution_ua ;;
  }
  dimension: attribution_experiment {
    group_label: "Attribution"
    label: "Experiment ID"
    type: string
    sql: ${TABLE}.attribution_experiment ;;
  }
  dimension: attribution_variation {
    group_label: "Attribution"
    label: "Experiment Variation ID"
    type: string
    sql: ${TABLE}.attribution_variation ;;
  }
  dimension: lifecycle_stage {
    label: "Lifecycle Stage"
    description: "Based on time elapsed between first seen date and submission date. new_profile for 0 days, repeat_user for 1 to 27 days, and existing_user for 28 days or more"
    type: string
    sql: ${TABLE}.lifecycle_stage ;;
  }


  measure: current_period_dau {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.dau ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_dau {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.dau ;;
    filters: [period_filtered_measures: "last"]
  }
  measure: current_period_mau {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.mau ;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_mau {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.mau ;;
    filters: [period_filtered_measures: "last"]
  }

  dimension: windows_10_flag {
    description: "windows 10 flag"
    type: string
    hidden: no
    sql: CASE WHEN (${normalized_os} = 'Windows' AND  ${normalized_os_version} = 'Windows 10') THEN 'Yes'
      ELSE "No" END ;;
  }

}
