include: "/combined_browser_metrics/views/active_users_aggregates.view.lkml"

view: kpi_dau {

  extends: [active_users_aggregates]

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

  measure: current_period_dau {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.dau;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_dau {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.dau;;
    filters: [period_filtered_measures: "last"]
  }

  measure: dau_goal {
    view_label: "KPI filtered metrics"
    type: sum
    sql: CASE WHEN ${country} = "CA" AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .9679
              WHEN ${country} = "IT" AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .9565
              WHEN ${country} = "PL" AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .9576
              WHEN ${country} = "US" AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .9703
              WHEN ${country} = "DE" AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .9549
              WHEN ${country} = "ES" AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .98
              WHEN ${country} = "FR" AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .9685
              WHEN ${country} = "GB" AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .9679
              WHEN ${country} NOT IN   ("US", "GB", "DE", "FR", "CA", "PL", "IT", "ES") AND ${app_name} = "Firefox Desktop" THEN ${TABLE}.dau * .9661
              ELSE ${TABLE}.dau * 1.1 END;;
    filters: [period_filtered_measures: "last"]
  }

  measure:  unique_days_prefiltered {
    label: "Number of unique days in period"
    type: count_distinct
    sql: ${submission_date};;
    filters: [period_filtered_measures: "this"]
  }

  measure:  unique_days_prev_prefiltered {
    label: "Number of unique days previous period"
    type: count_distinct
    sql: ${submission_date};;
    filters: [period_filtered_measures: "last"]
  }

  measure:  unique_days {
    label: "Number of unique days"
    type: count_distinct
    sql: ${submission_date};;
    # filters: [period_filtered_measures: "this"]
  }

  measure: current_period_new_profiles {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.new_profiles;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_new_profiles {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${TABLE}.new_profiles;;
    filters: [period_filtered_measures: "last"]
  }

  dimension: country_filter {
    description: "Normalizing country name to the names we want"
    type: string
    hidden: no
    sql: CASE WHEN ${country} in ("US", "GB", "DE", "FR", "CA", "PL", "IT", "ES") THEN ${country} ELSE "Other" END ;;
  }

  dimension: Platform {
    description: "desktop vs mobile"
    type: string
    hidden: no
    sql: CASE WHEN ${app_name} = "Firefox Desktop" THEN "Desktop"
              WHEN  ${app_name} IN ("Fenix", "Firefox iOS", "Focus iOS", "Focus Android", "Klar iOS") THEN "Mobile"
              ELSE "Other" END ;;
  }

  dimension: os_filter {
    description: "desktop vs mobile"
    type: string
    hidden: no
    sql: CASE WHEN ${os} LIKE "%Darwin%" THEN "Mac OS"
              WHEN  ${os} LIKE "%Windows%" OR  ${os} LIKE 'WINNT%' THEN "Windows"
              WHEN ${os} LIKE "%Linux%" OR ${os} LIKE '%BSD%' OR ${os} LIKE '%SunOS%' OR ${os} LIKE '%Solaris%' THEN "Linux"
              WHEN ${os} LIKE "%Android%" THEN "Android"
              WHEN ${os} LIKE "%iOS%" THEN "iOS"
              ELSE "Other" END ;;
  }

}
