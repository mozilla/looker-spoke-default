include: "//looker-hub/duet/views/fenix_marketing_metrics.view.lkml"

view: +fenix_marketing_metrics {

  dimension: new_profiles {
    hidden: yes
    sql: ${TABLE}.new_profiles ;;
  }

  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }

  dimension: search_count {
    hidden: yes
    sql: ${TABLE}.search_count ;;
  }

  dimension: ad_clicks {
    hidden: yes
    sql: ${TABLE}.ad_clicks ;;
  }

  dimension: adjust_network {
    group_label: "Adjust parameters"
    sql: ${TABLE}.adjust_network ;;
    type: string
  }

  dimension: adjust_campaign {
    group_label: "Adjust parameters"
    sql: ${TABLE}.adjust_campaign ;;
    type: string
  }

  dimension: adjust_adgroup {
    group_label: "Adjust parameters"
    sql: ${TABLE}.adjust_adgroup ;;
    type: string
  }

  dimension: adjust_creative {
    group_label: "Adjust parameters"
    sql: ${TABLE}.adjust_creative ;;
    type: string
  }

  measure: new_profiles_sum {
    label: "New Profiles"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: dau_sum {
    label: "DAU"
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: search_count_sum {
    label: "Search Count"
    type: sum
    sql: ${TABLE}.search_count ;;
  }

  measure: ad_clicks_sum {
    label: "Ad Clicks"
    type: sum
    sql: ${TABLE}.ad_clicks ;;
  }
}
