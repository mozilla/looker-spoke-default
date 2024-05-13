include: "//looker-hub/firefox_okrs/views/desktop_engagement.view.lkml"

view: +desktop_engagement {

  parameter: average_window {
    type: string
    allowed_value: {
      label: "7-day"
      value: "6"
    }
    allowed_value: {
      label: "28-day"
      value: "27"
    }
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
    label: "(non-official) DAU"
    type: sum
    sql: ${TABLE}.dau ;;
    description: "Daily Active Users, but historical values underestimated due to shredder"
  }
  measure: wau_sum {
    label: "(non-official) WAU"
    type: sum
    sql: ${TABLE}.wau ;;
    description: "Weekly Active Users, but historical values underestimated due to shredder"
  }
  measure: mau_sum {
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
    label: "Experimen ID"
    type: string
    sql: ${TABLE}.attribution_experiment ;;
  }
  dimension: attribution_variation {
    group_label: "Attribution"
    label: "Experiment Variation ID"
    type: string
    sql: ${TABLE}.attribution_variation ;;
  }
}
