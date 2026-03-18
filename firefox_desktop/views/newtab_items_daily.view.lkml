include: "//looker-hub/firefox_desktop/views/newtab_items_daily.view.lkml"

view: +newtab_items_daily {

  measure: click_count_sum {
    type: sum
    sql: ${TABLE}.click_count*1 ;;
    label: "Clicks Count Sum"
    group_label: "Statistics"
    description: "Sum of All articles click count"
  }

  measure: dismiss_count_sum {
    type: sum
    sql: ${TABLE}.dismiss_count*1 ;;
    label: "Dismiss Count Sum"
    group_label: "Statistics"
    description: "Sum of All articles dismissed count"
  }

  measure: impression_count_sum {
    type: sum
    sql: ${TABLE}.impression_count*1 ;;
    label: "Impression Count Sum"
    group_label: "Statistics"
    description: "Sum of All articles impressed count"
  }

  measure: save_count_sum {
    type: sum
    sql: ${TABLE}.save_count*1 ;;
    label: "Save Count Sum"
    group_label: "Statistics"
    description: "Sum of All articles saved count"
  }

  measure: click_through_ratio {
    type: number
    label: "Click Through Ratio"
    sql: SAFE_DIVIDE(${click_count_sum}, ${impression_count_sum}) ;;
    group_label: "Statistics"
    description: "Ratio between click_count.sum and impression_count.sum"
  }
  measure: click_count_avg {
    type: average
    sql: ${TABLE}.click_count*1 ;;
    label: "Clicks Count Average"
    group_label: "Statistics"
    description: "Average of All articles click count"
  }

  measure: dismiss_count_avg {
    type: average
    sql: ${TABLE}.dismiss_count*1 ;;
    label: "Dismiss Count Average"
    group_label: "Statistics"
    description: "Average of All articles dismissed count"
  }

  measure: impression_count_avg {
    type: average
    sql: ${TABLE}.impression_count*1 ;;
    label: "Impression Count Average"
    group_label: "Statistics"
    description: "Average of All articles impressed count"
  }

  measure: save_count_avg {
    type: average
    sql: ${TABLE}.save_count*1 ;;
    label: "Save Count Average"
    group_label: "Statistics"
    description: "Average of All articles saved count"
  }

  set: aggregate_metrics {
    fields: [
      click_count_sum,
      dismiss_count_sum,
      impression_count_sum,
      save_count_sum,
      click_through_ratio,
      click_count_avg,
      dismiss_count_avg,
      impression_count_avg,
      save_count_avg,
    ]
  }
}
