include: "//looker-hub/ai_usage/views/openai_costs.view.lkml"

view: +openai_costs {
  measure: total_cost {
    type: sum
    sql: ${TABLE}.amount_value ;;
    label: "Total Cost"
    description: "Total cost in USD"
    value_format_name: usd
  }

  measure: avg_daily_cost {
    type: average
    sql: ${TABLE}.amount_value ;;
    label: "Avg Daily Cost"
    description: "Average cost per day in USD"
    value_format_name: usd
  }
}
