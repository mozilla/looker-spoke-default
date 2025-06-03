include: "../views/glean_desktop_engagement.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/glean_desktop_engagement_last_updated.datagroup.lkml"

explore: glean_desktop_engagement {
  label: "Engagement for Firefox Desktop (Glean-based)"
  view_name: glean_desktop_engagement

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

  persist_with: glean_desktop_engagement_last_updated
}
