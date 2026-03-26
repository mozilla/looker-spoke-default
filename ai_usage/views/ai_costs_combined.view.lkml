include: "//looker-hub/ai_usage/views/ai_costs_combined.view.lkml"

view: +ai_costs_combined {
  measure: total_amount {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: decimal_2
    description: "Total cost in the record's currency"
  }

  measure: total_amount_usd {
    type: sum
    sql: CASE WHEN ${TABLE}.currency = 'usd' OR ${TABLE}.currency = 'USD' THEN ${TABLE}.amount ELSE NULL END ;;
    value_format_name: usd
    description: "Total cost in USD (excludes non-USD records)"
  }

  measure: count {
    type: count
    description: "Number of cost records"
  }
}
