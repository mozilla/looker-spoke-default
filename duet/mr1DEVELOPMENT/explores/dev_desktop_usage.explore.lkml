include: "../views/dev_desktop_usage.view.lkml"

explore: dev_desktop_usage  {
  view_name:  dev_desktop_usage
  description: "New profiles of Firefox who returned second day and retained week 4"
  sql_always_where:
  ${submission_date} > IF({% parameter dev_desktop_usage.year_over_year %},
  DATE_SUB(DATE({% date_start dev_desktop_usage.analysis_period %}), INTERVAL 1 YEAR),
  DATE({% date_start dev_desktop_usage.analysis_period %}))
  AND
  ${submission_date} <= IF({% parameter dev_desktop_usage.year_over_year %},
  DATE_SUB(DATE({% date_end dev_desktop_usage.analysis_period %}), INTERVAL 1 YEAR),
  DATE({% date_end dev_desktop_usage.analysis_period %}))
    AND ${submission_date} < IF({% parameter dev_desktop_usage.year_over_year %},
                                DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL 1 YEAR),
                                DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
                                )
  ;;
  always_filter: {
    filters: [
      dev_desktop_usage.join_field: "yes",
      dev_desktop_usage.funnel_derived: "mozorg windows funnel"
    ]
  }

  query: example {
    dimensions: [dev_desktop_usage.normalized_country_code_subset]
    measures: [dev_desktop_usage.returned_second_day,
               dev_desktop_usage.retained_week4]
    filters: [
      dev_desktop_usage.analysis_period: "last 90 days",
      dev_desktop_usage.year_over_year: "No",
      dev_desktop_usage.join_field: "yes",
      dev_desktop_usage.week4_reported_date: "yes"
    ]
    label: "Total new Firefox installs who returned for second day, and week 4 reten in last 90 days"
  }
}
