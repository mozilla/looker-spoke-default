include: "../views/event_funnel.view.lkml"

explore: event_funnel {
  label: "Funnel Builder"
  description: "Build custom funnels on 1% sampled data for fast exploration. Common filters (country, OS, channel) apply to all steps."

  always_filter: {
    filters: [event_funnel.date: "7 days", event_funnel.sample: "1"]
  }


}
