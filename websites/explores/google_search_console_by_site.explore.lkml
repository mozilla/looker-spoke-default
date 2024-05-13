include: "../views/google_search_console_by_site.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: google_search_console_by_site {
  conditionally_filter: {
    filters: [google_search_console_by_site.date_date: "30 days"]
  }

  query: recent_popular_web_search_queries {
    dimensions: [query, site_domain_name]
    measures: [average_top_result_position, total_impressions, total_clicks, click_through_rate]
    filters: [
      google_search_console_by_site.date_date: "30 days",
      google_search_console_by_site.is_anonymized: "No",
      google_search_console_by_site.search_type: "Web"
    ]
    sorts: [total_impressions: desc]
    limit: 100
  }
}
