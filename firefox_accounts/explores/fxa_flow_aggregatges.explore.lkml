include: "../views/fxa_flow_aggregates.view.lkml"

explore: fxa_flow_aggregates {
  label: "FxA Flow Aggregates"
  description: "Summary of FxA Login and Registration Funnel Statistics"

  always_filter: {
    filters: [fxa_flow_aggregates.flow_start_date: "14 days"]
  }
}
