include: "//looker-hub/ai_usage/views/claude_costs.view.lkml"

view: +claude_costs {
  # Note: `amount` is stored in cents (lowest currency units); divide by 100 for USD.

  measure: total_cost {
    type: sum
    sql: ${TABLE}.amount / 100.0 ;;
    label: "Total Cost"
    description: "Total cost in USD (converted from cents)"
    value_format_name: usd
  }

  measure: avg_daily_cost {
    type: number
    sql: ${total_cost} / NULLIF(COUNT(DISTINCT ${TABLE}.date), 0) ;;
    label: "Avg Daily Cost"
    description: "Average cost per day in USD"
    value_format_name: usd
  }

  measure: total_cost_by_type {
    type: sum
    sql: ${TABLE}.amount / 100.0 ;;
    label: "Total Cost (by Type)"
    description: "Total cost broken down by cost_type dimension"
    value_format_name: usd
  }
}
