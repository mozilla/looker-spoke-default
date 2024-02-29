include: "../views/google_search_impressions_by_site.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: google_search_impressions_by_site {
  conditionally_filter: {
    filters: [google_search_impressions_by_site.date_date: "30 days"]
  }

  join: countries {
    sql_on: ${google_search_impressions_by_site.country_code} = ${countries.code_3} ;;
    type: left_outer
    relationship: many_to_one
  }
}
