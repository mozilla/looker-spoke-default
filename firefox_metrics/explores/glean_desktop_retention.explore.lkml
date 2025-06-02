include: "../views/glean_desktop_retention.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/glean_desktop_retention_last_updated.datagroup.lkml"

explore: glean_desktop_retention {
  label: "Retention for Firefox Desktop (Glean-Based)"
  view_name: glean_desktop_retention

  always_filter: {
    filters: [
      desktop_retention.metric_date: "56 days",
      desktop_retention.is_desktop: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_retention.country} = ${countries.code} ;;
  }

  persist_with: glean_desktop_retention_last_updated
}
