include: "//looker-hub/revenue/views/fenix_ltv.view.lkml"

view: +fenix_ltv {
  label: "Lifetime Value"

  dimension: sample_id {
    hidden: yes
  }

  dimension: future_value {
    description: "Predicted future value of this client, in US dollars."
  }

  dimension: historic_value {
    description: "Total historic value of this client, in US dollars."
  }

  dimension: lifetime_value {
    description: "Total predicted lifetime value (LTV) for this client, in US dollars. Use this field to filter (e.g. find high-value clients), and use the ltv measure otherwise."
  }

  measure: total_users {
    type: count_distinct
    sql: ${client_id} ;;
    hidden: yes
  }

  measure: ltv {
    label: "Total Value"
    type: sum
    sql: ${lifetime_value} ;;
    description: "Total value of these users, in US dollars."
  }

  measure: average_ltv {
    type: number
    value_format: "$0.000"
    label: "Average LTV"
    sql: SAFE_DIVIDE(${ltv},  ${total_users});;
    description: "The predicted LTV of a single user, in US dollars."
  }
}
