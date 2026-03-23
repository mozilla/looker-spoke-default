include: "../views/ai_costs_combined.view.lkml"

explore: ai_costs_combined {
  label: "AI Costs (Combined)"
  description: "Daily spend across Anthropic and OpenAI. Claude costs are computed from token counts; OpenAI costs come directly from the billing API."

}
