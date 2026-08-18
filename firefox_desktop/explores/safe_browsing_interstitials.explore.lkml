include: "/firefox_desktop/views/safe_browsing_interstitials.view.lkml"

explore: safe_browsing_interstitials {
  view_name: safe_browsing_interstitials
  label: "Safe Browsing Interstitials"

  description: "How often Firefox shows an about:blocked warning page, and what users do with it. All rates are LOWER BOUNDS: the denominator counts page renders, and a blocked URL is re-rendered on every reload, so the true per-encounter rate is higher by an unknown factor."

  always_filter: {
    filters: [
      safe_browsing_interstitials.submission_date: "28 days",
      safe_browsing_interstitials.normalized_channel: "release",
      safe_browsing_interstitials.scope: "Top-level page",
    ]
  }
}
