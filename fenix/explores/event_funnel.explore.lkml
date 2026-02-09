include: "../views/event_funnel.view.lkml"

explore: event_funnel {
  label: "Funnel Builder (Sampled)"
  description: "Build custom funnels on 1% sampled data for fast exploration. Common filters (country, OS, channel) apply to all steps."

  always_filter: {
    filters: [event_funnel.date: "7 days", event_funnel.sample: "1"]
  }

  # sql_always_where: ${event_funnel.submission_date} >= '2025-01-01' ;;
}
