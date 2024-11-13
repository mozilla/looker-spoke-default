include: "../views/dev_desktop_session.view.lkml"

explore: dev_desktop_session {
  view_name:  dev_desktop_session
  description: "Individual user visits to mozilla.org. By default, if a user is inactive for 30 minutes or more, any future activity is attributed to a new visit. Users that leave mozilla.org and return within 30 minutes are counted as part of the original visit."
  sql_always_where:
      ${submission_date} > IF({% parameter dev_desktop_session.year_over_year %},
                               DATE_SUB(DATE({% date_start dev_desktop_session.analysis_period %}), INTERVAL 1 YEAR),
                               DATE({% date_start dev_desktop_session.analysis_period %}))
      AND
      ${submission_date} <= IF({% parameter dev_desktop_session.year_over_year %},
                                DATE_SUB(DATE({% date_end dev_desktop_session.analysis_period %}), INTERVAL 1 YEAR),
                                DATE({% date_end dev_desktop_session.analysis_period %}))
    AND ${submission_date} < IF({% parameter dev_desktop_session.year_over_year %},
                                DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL 1 YEAR),
                                DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
                                )
                                ;;

  always_filter: {
    filters: [
      dev_desktop_session.join_field: "yes",
      dev_desktop_session.funnel_derived: "mozorg windows funnel"
    ]
  }

  query: example {
    dimensions: [dev_desktop_session.normalized_country_code_subset]
    measures: [dev_desktop_session.non_fx_sessions,
               dev_desktop_session.non_fx_downloads]
    filters: [
      dev_desktop_session.analysis_period: "last 90 days",
      dev_desktop_session.year_over_year: "No",
      dev_desktop_session.join_field: "yes",
      dev_desktop_session.week4_reported_date: "yes"
    ]
    label: "Total sessoins and downloads from non-Firefox browsers in the last 90 days"
  }

}
