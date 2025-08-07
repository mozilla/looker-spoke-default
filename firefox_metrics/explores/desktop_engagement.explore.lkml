include: "../views/desktop_engagement.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/desktop_engagement_last_updated.datagroup.lkml"

explore: desktop_engagement {
  label: "Engagement for Firefox Desktop"
  view_name: desktop_engagement

  always_filter: {
    filters: [
      desktop_engagement.submission_date: "28 days",
      desktop_engagement.is_desktop: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_engagement.country} = ${countries.code} ;;
  }

  persist_with: desktop_engagement_last_updated

  aggregate_table: rollup__date_yoy__days_avg__submission_year {
    query: {
      dimensions: [date_yoy, days_avg, submission_year]
      measures: [engagement_rate]
      filters: [
        desktop_engagement.average_window: "28",
        desktop_engagement.is_desktop: "Yes",
        desktop_engagement.lifecycle_stage: "\"existing_user\"",
        desktop_engagement.submission_date: "2 years",
        desktop_engagement.ytd_filter: "Yes"
      ]
    }

    materialization: {
      datagroup_trigger: desktop_engagement_last_updated
    }
  }
}
