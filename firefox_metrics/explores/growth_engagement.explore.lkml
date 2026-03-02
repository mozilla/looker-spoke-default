include: "../views/growth_engagement.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/desktop_engagement_last_updated.datagroup.lkml"

explore: desktop_engagement {
  label: "Engagement for Firefox Desktop"
  view_name: growth_engagement

  sql_always_where: ${submission_date} >= "2025-01-01"
  AND ${period_filtered_measures} in ("this", "last")
  AND ${is_desktop};;


  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${growth_engagement.country} = ${countries.code} ;;
  }

  persist_with: desktop_engagement_last_updated

  aggregate_table: rollup__date_yoy__days_avg__submission_year {
    query: {
      dimensions: [date_yoy, days_avg, submission_year]
      measures: [engagement_rate]
      filters: [
        growth_engagement.average_window: "28",
        growth_engagement.is_desktop: "Yes",
        growth_engagement.lifecycle_stage: "\"existing_user\"",
        growth_engagement.submission_date: "2 years",
        growth_engagement.ytd_filter: "Yes"
      ]
    }

    materialization: {
      datagroup_trigger: desktop_engagement_last_updated
    }
  }
}
