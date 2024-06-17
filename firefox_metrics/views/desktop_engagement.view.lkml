include: "//looker-hub/firefox_okrs/views/desktop_engagement.view.lkml"

view: +desktop_engagement {

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
}
