include: "../views/dev_desktop_dates.view.lkml"

explore: dev_desktop_dates  {
  view_name:  dev_desktop_dates
  description: "date coverage of our analysis range."
  sql_always_where:
    ${submission_date} > IF({% parameter dev_desktop_dates.year_over_year %},
                               DATE_SUB(DATE({% date_start dev_desktop_dates.analysis_period %}), INTERVAL 1 YEAR),
                               DATE({% date_start dev_desktop_dates.analysis_period %}))
    AND
    ${submission_date} <= IF({% parameter dev_desktop_dates.year_over_year %},
                                DATE_SUB(DATE({% date_end dev_desktop_dates.analysis_period %}), INTERVAL 1 YEAR),
                                DATE({% date_end dev_desktop_dates.analysis_period %}))
                                ;;
  always_filter: {
    filters: [
      dev_desktop_dates.analysis_period: "last 90 days",
      dev_desktop_dates.join_field: "yes",
      dev_desktop_dates.week4_reported_date: "yes"
    ]
  }
}
