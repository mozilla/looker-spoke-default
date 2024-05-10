include: "../views/google_search_console_by_page.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: google_search_console_by_page {
  conditionally_filter: {
    filters: [google_search_console_by_page.date_date: "30 days"]
  }
}
