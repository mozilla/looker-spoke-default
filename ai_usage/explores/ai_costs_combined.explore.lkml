include: "../views/ai_costs_combined.view.lkml"

explore: ai_costs_combined {
  label: "AI Costs (Combined)"
  description: "Daily spend across Anthropic and OpenAI. Claude costs are computed from token counts; OpenAI costs come directly from the billing API."

  conditionally_filter: {
    filters: [date_date: "30 days ago for 30 days"]
    unless: [date_week, date_month, date_quarter, date_year]
  }
}
