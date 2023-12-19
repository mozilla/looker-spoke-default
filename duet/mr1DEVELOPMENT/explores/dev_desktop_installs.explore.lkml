include: "../views/dev_desktop_install.view.lkml"

explore: dev_desktop_install  {
  view_name:  dev_desktop_install
  description: "New Installs and re-installation of Firefox."
  sql_always_where:
    ${submission_date} > IF({% parameter dev_desktop_install.year_over_year %},
                               DATE_SUB(DATE({% date_start dev_desktop_install.analysis_period %}), INTERVAL 1 YEAR),
                               DATE({% date_start dev_desktop_install.analysis_period %}))
    AND
    ${submission_date} <= IF({% parameter dev_desktop_install.year_over_year %},
                                DATE_SUB(DATE({% date_end dev_desktop_install.analysis_period %}), INTERVAL 1 YEAR),
                                DATE({% date_end dev_desktop_install.analysis_period %}))
    AND ${submission_date} < IF({% parameter dev_desktop_install.year_over_year %},
                                DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL 1 YEAR),
                                DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
                                )
                                ;;

  always_filter: {
    filters: [
      dev_desktop_install.join_field: "yes",
      dev_desktop_install.funnel_derived: "mozorg windows funnel"
    ]
  }

  query: example {
    dimensions: [dev_desktop_install.normalized_country_code_subset]
    measures: [dev_desktop_install.new_installs]
    filters: [
      dev_desktop_install.analysis_period: "last 90 days",
      dev_desktop_install.year_over_year: "No",
      dev_desktop_install.join_field: "yes",
      dev_desktop_install.week4_reported_date: "yes"
    ]
    label: "Total new Firefox installs in the last 90 days"
    }
  }
