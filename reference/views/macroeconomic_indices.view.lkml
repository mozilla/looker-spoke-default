include: "//looker-hub/reference/views/macroeconomic_indices.view.lkml"

view: +macroeconomic_indices {

  label: "Macroeconomic indices"
  fields_hidden_by_default: yes

  dimension: symbol {
    hidden: no
    primary_key: yes
  }

  dimension_group: market {
    hidden: no
  }

  measure: open_price {
    hidden: no
    type: average
    sql: ${open};;
    description: "Opening price for symbol on market_date."
  }

  measure: close_price {
    hidden: no
    type: average
    sql: ${close};;
    description: "Closing price for symbol on market_date."
  }

  measure: adj_close_price {
    hidden: no
    type: average
    sql: ${adj_close};;
    description: "Adjusted closing price for symbol on market_date."
  }

  measure: high_price {
    type: max
    sql: ${high};;
    description: "High price for symbol on market_date."
  }

  measure: low_price {
    type: min
    sql: ${low};;
    description: "Low price for symbol on market_date."
  }

  measure: total_volume {
    type: sum
    sql: ${volume};;
    description: "Trade volume for symbol on market_date."
  }

}
