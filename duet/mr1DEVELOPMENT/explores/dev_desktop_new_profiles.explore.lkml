include: "../views/dev_desktop_new_profiles.view.lkml"

explore: dev_desktop_new_profiles  {
  #view_name:  dev_desktop_new_profiles
  description: "New profiles of Firefox."
  sql_always_where:
      ${submission_date} > IF({% parameter dev_desktop_new_profiles.year_over_year %},
      DATE_SUB(DATE({% date_start dev_desktop_new_profiles.analysis_period %}), INTERVAL 1 YEAR),
      DATE({% date_start dev_desktop_new_profiles.analysis_period %}))
      AND
      ${submission_date} <= IF({% parameter dev_desktop_new_profiles.year_over_year %},
      DATE_SUB(DATE({% date_end dev_desktop_new_profiles.analysis_period %}), INTERVAL 1 YEAR),
      DATE({% date_end dev_desktop_new_profiles.analysis_period %}))
    AND ${submission_date} < IF({% parameter dev_desktop_new_profiles.year_over_year %},
                                DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL 1 YEAR),
                                DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
                                )
      ;;

  always_filter: {
    filters: [dev_desktop_new_profiles.join_field: "yes",
              dev_desktop_new_profiles.funnel_derived: "mozorg windows funnel"
    ]
  }

  query: example{
    dimensions: [dev_desktop_new_profiles.normalized_country_code_subset]
    measures: [dev_desktop_new_profiles.new_profiles]
    filters: [
      dev_desktop_new_profiles.analysis_period: "last 90 days",
      dev_desktop_new_profiles.year_over_year: "No",
      dev_desktop_new_profiles.join_field: "yes",
      dev_desktop_new_profiles.week4_reported_date: "yes"
    ]
    label: "Total new Firefox installs in the last 90 days"
  }
}
