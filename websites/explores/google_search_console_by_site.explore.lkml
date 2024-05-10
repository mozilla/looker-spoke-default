include: "../views/google_search_console_by_site.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: google_search_console_by_site {
  conditionally_filter: {
    filters: [google_search_console_by_site.date_date: "30 days"]
  }
}
