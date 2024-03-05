include: "../views/google_search_impressions_by_page.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: google_search_impressions_by_page {
  conditionally_filter: {
    filters: [google_search_impressions_by_page.date_date: "30 days"]
  }

  join: countries {
    sql_on: ${google_search_impressions_by_page.country_code} = ${countries.code_3} ;;
    type: left_outer
    relationship: many_to_one
  }
}
