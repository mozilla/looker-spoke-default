include: "../views/dev_desktop_dates_partners.view.lkml"

explore: dev_desktop_dates_partners  {
  view_name:  dev_desktop_dates_partners
  description: "date coverage of our analysis range."
  sql_always_where:
    ${submission_date} > IF({% parameter dev_desktop_dates_partners.year_over_year %},
                               DATE_SUB(DATE({% date_start dev_desktop_dates_partners.analysis_period %}), INTERVAL 1 YEAR),
                               DATE({% date_start dev_desktop_dates_partners.analysis_period %}))
    AND
    ${submission_date} <= IF({% parameter dev_desktop_dates_partners.year_over_year %},
                                DATE_SUB(DATE({% date_end dev_desktop_dates_partners.analysis_period %}), INTERVAL 1 YEAR),
                                DATE({% date_end dev_desktop_dates_partners.analysis_period %}))
    AND ${submission_date} < IF({% parameter dev_desktop_dates_partners.year_over_year %},
                                DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL 1 YEAR),
                                DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
                                )
                                ;;
  always_filter: {
    filters: [
      dev_desktop_dates_partners.join_field: "yes"
    ]
  }
}
