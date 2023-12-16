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
  ;;
  always_filter: {
    filters: [
      dev_desktop_usage.analysis_period: "last 90 days",
      dev_desktop_usage.join_field: "yes",
      dev_desktop_usage.funnel_derived: "mozorg windows funnel",
      dev_desktop_usage.week4_reported_date: "yes"
    ]
  }

  query: total_returned_second_day_90days {
    dimensions: [dev_desktop_usage.normalized_country_code_subset]
    measures: [dev_desktop_usage.returned_second_day]
    filters: [
      dev_desktop_usage.analysis_period: "last 90 days",
      dev_desktop_usage.year_over_year: "No",
      dev_desktop_usage.join_field: "yes",
      dev_desktop_usage.week4_reported_date: "yes"
    ]
    label: "Total new Firefox installs who returned for second day in last 90 days"
  }

  query: total_wk4_retained_last_90days {
    dimensions: [dev_desktop_usage.normalized_country_code_subset]
    measures: [dev_desktop_usage.retained_week4]
    filters: [
      dev_desktop_usage.analysis_period: "last 90 days",
      dev_desktop_usage.year_over_year: "No",
      dev_desktop_usage.join_field: "yes",
      dev_desktop_usage.week4_reported_date: "yes"
    ]
    label:  "Total new Firefox installs who week 4 retained in last 90 days"
  }
}
