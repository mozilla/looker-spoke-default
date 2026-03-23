include: "../views/claude_costs.view.lkml"

explore: claude_costs {
  label: "Claude Costs"
  description: "Anthropic Claude billing costs by model, workspace, cost type, and token type"

  always_filter: {
    filters: [claude_costs.date_date: "30 days ago for 30 days"]
  }
}
