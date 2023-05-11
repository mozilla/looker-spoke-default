include: "//looker-hub/duet/views/firefox_mobile_installs.view.lkml"
view: kpi_installs {

  extends: [firefox_mobile_installs]

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
    sql: FORMAT_DATE("%m-%d", ${date_date});;
  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: FORMAT_DATE("%m-%B", ${date_date});;
  }

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "KPI date axis"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${date_date}, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${date_date}, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${date_date}, QUARTER)) = "07" then "Q3"
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
            WHEN DATE(${date_date}) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${date_date}) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }

  measure: current_period_installs {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${installs};;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_installs {
    view_label: "KPI filtered metrics"
    type: sum
    sql: ${installs};;
    filters: [period_filtered_measures: "last"]
  }

  measure:  unique_days_prefiltered {
    label: "Number of unique days in period"
    type: count_distinct
    sql: ${date_date};;
    filters: [period_filtered_measures: "this"]
  }

  measure:  unique_days_prev_prefiltered {
    label: "Number of unique days previous period"
    type: count_distinct
    sql: ${date_date};;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_installs_nu {
    view_label: "KPI filtered metrics"
    label: "Total Current Period installs no UD"
    type: sum
    sql: CASE WHEN ${network} <> "Untrusted Devices" THEN ${installs} END;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_installs_nu {
    view_label: "KPI filtered metrics"
    label: "Total Prev Period installs no UD"
    type: sum
    sql: CASE WHEN ${network} <> "Untrusted Devices" THEN ${installs} END;;
    filters: [period_filtered_measures: "last"]
  }

  measure: installs_goal {
    view_label: "KPI filtered metrics"
    type: sum
    sql: CASE WHEN ${country} = "CA" THEN ${installs}  * 1.105
              WHEN ${country} = "DE" THEN ${installs} * 1.103
              WHEN ${country} = "FR" THEN ${installs} * 1.105
              WHEN ${country} = "PL" THEN ${installs} * 1.077
              WHEN ${country} = "IT" THEN ${installs} * 1.111
              WHEN ${country} = "ES" THEN ${installs} * 1.118
              WHEN ${country} = "GB" THEN ${installs} * 1.103
              WHEN ${country} = "US" THEN ${installs} * 1.099
              ELSE ${installs} * 1.112 END;;
    filters: [period_filtered_measures: "last"]
  }

  dimension: country_filter {
    description: "Normalizing country name to the names we want"
    type: string
    hidden: no
    sql: CASE WHEN ${country} IN ("US","DE", "FR","PL", "IT", "ES", "GB", "CA") THEN ${country}
              ELSE "Other" END ;;
  }

}
