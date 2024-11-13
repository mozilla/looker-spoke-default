include: "../views/dev_desktop_usage_partners.view.lkml"

explore: dev_desktop_usage_partners  {
  #view_name:  dev_desktop_usage_partners
  description: "New profiles of Firefox from partners."
  sql_always_where:
      ${submission_date} > IF({% parameter dev_desktop_usage_partners.year_over_year %},
      DATE_SUB(DATE({% date_start dev_desktop_usage_partners.analysis_period %}), INTERVAL 1 YEAR),
      DATE({% date_start dev_desktop_usage_partners.analysis_period %}))
      AND
      ${submission_date} <= IF({% parameter dev_desktop_usage_partners.year_over_year %},
      DATE_SUB(DATE({% date_end dev_desktop_usage_partners.analysis_period %}), INTERVAL 1 YEAR),
      DATE({% date_end dev_desktop_usage_partners.analysis_period %}))
    AND ${submission_date} < IF({% parameter dev_desktop_usage_partners.year_over_year %},
                                DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL 1 YEAR),
                                DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
                                )
      ;;

  always_filter: {
    filters: [dev_desktop_usage_partners.join_field: "yes",
      dev_desktop_usage_partners.funnel_derived: "partner"
    ]
  }

  query: example{
    dimensions: [
      dev_desktop_usage_partners.normalized_country_code_subset,
      dev_desktop_usage_partners.os_group,
      dev_desktop_usage_partners.partner_org,
      dev_desktop_usage_partners.distribution_model
      ]
    measures: [
      dev_desktop_usage_partners.new_profiles,
      dev_desktop_usage_partners.returned_second_day,
      dev_desktop_usage_partners.retained_week4
      ]
    filters: [
      dev_desktop_usage_partners.analysis_period: "last 90 days",
      dev_desktop_usage_partners.year_over_year: "No",
      dev_desktop_usage_partners.join_field: "yes"
    ]
    label: "Total new Firefox installs in the last 90 days"
  }
}
