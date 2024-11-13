include: "../views/macroeconomic_indices.view.lkml"

explore: macroeconomic_indices {
  always_filter: {
    filters: [
      market_date: "30 days",
    ]
  }
}
