include: "../views/limited_historical_google_search_console_by_page.view.lkml"

explore: limited_historical_google_search_console_by_page {
  description: "The data has the following limitations:
    * For each site only data for specific historical dates is included.
    * For each site only the top ~50,000 rows of data per day per search type is included (prioritized by number of clicks).
    * Anonymized search queries aren't included."

  conditionally_filter: {
    filters: [limited_historical_google_search_console_by_page.date_date: "2023"]
  }

  query: popular_web_search_queries_in_2022 {
    dimensions: [query, site_domain_name]
    measures: [distinct_page_url_count, average_result_position, total_impressions, total_clicks, click_through_rate]
    filters: [
      limited_historical_google_search_console_by_page.date_date: "2022",
      limited_historical_google_search_console_by_page.search_type: "Web"
    ]
    sorts: [total_impressions: desc]
    limit: 100
  }

  query: popular_web_search_pages_in_2022 {
    dimensions: [page_url, site_domain_name]
    measures: [distinct_query_count, average_result_position, total_impressions, total_clicks, click_through_rate]
    filters: [
      limited_historical_google_search_console_by_page.date_date: "2022",
      limited_historical_google_search_console_by_page.search_type: "Web"
    ]
    sorts: [total_clicks: desc]
    limit: 100
  }
}
