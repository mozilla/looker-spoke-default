include: "../views/google_search_console_by_page.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: google_search_console_by_page {
  conditionally_filter: {
    filters: [google_search_console_by_page.date_date: "30 days"]
  }

  query: recent_popular_web_search_queries {
    dimensions: [query, site_domain_name]
    measures: [distinct_page_url_count, average_result_position, total_impressions, total_clicks, click_through_rate]
    filters: [
      google_search_console_by_page.date_date: "30 days",
      google_search_console_by_page.is_anonymized: "No",
      google_search_console_by_page.search_type: "Web"
    ]
    sorts: [total_impressions: desc]
    limit: 100
  }

  query: recent_popular_web_search_pages {
    dimensions: [page_url, site_domain_name]
    measures: [distinct_query_count, average_result_position, total_impressions, total_clicks, click_through_rate]
    filters: [
      google_search_console_by_page.date_date: "30 days",
      google_search_console_by_page.is_anonymized: "No",
      google_search_console_by_page.search_type: "Web"
    ]
    sorts: [total_clicks: desc]
    limit: 100
  }
}
