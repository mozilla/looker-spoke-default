include: "../views/openai_costs.view.lkml"

explore: openai_costs {
  label: "OpenAI Costs"
  description: "OpenAI billing costs by project and line item category."

  conditionally_filter: {
    filters: [date_date: "30 days ago for 30 days"]
    unless: [date_week, date_month, date_quarter, date_year]
  }
}
