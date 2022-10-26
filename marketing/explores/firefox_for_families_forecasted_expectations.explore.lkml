include: "//looker-hub/marketing/views/firefox_for_families_forecasted_expectations.view.lkml"

explore: firefox_for_families_forecasted_expectations {
  view_name: firefox_for_families_forecasted_expectations

  always_filter: {
    filters: [Country_Group: "-EMPTY",
              Metric: "-EMPTY"]
  }
}
