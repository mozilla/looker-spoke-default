include: "../views/google_search_console_by_page.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: google_search_console_by_page {
  conditionally_filter: {
    filters: [google_search_console_by_page.date_date: "30 days"]
  }

  join: localized_site_countries {
    from: countries
    view_label: "Localized Site Regions"
    sql_on: ${google_search_console_by_page.localized_site_country_code} = ${localized_site_countries.code} ;;
    type: left_outer
    relationship: many_to_one
    fields: [
      region_name,
      subregion_name,
      intermediate_region_name
    ]
  }

  join: user_countries {
    from: countries
    view_label: "User Regions"
    sql_on: ${google_search_console_by_page.user_country_code} = ${user_countries.code_3} ;;
    type: left_outer
    relationship: many_to_one
    fields: [
      region_name,
      subregion_name,
      intermediate_region_name
    ]
  }
}
