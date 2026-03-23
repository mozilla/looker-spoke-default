include: "../views/openai_completions.view.lkml"

explore: openai_completions {
  label: "OpenAI Completions"
  description: "OpenAI token usage and request counts by model, project, user, and batch mode."

  conditionally_filter: {
    filters: [date_date: "30 days ago for 30 days"]
    unless: [date_week, date_month, date_quarter, date_year]
  }
}
