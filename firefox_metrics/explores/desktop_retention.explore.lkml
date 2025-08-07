include: "../views/desktop_retention.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/desktop_retention_last_updated.datagroup.lkml"

explore: desktop_retention {
  label: "Retention for Firefox Desktop"
  view_name: desktop_retention

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

  persist_with: desktop_retention_last_updated

  aggregate_table: rollup__date_yoy__days_avg__metric_year {
    query: {
      dimensions: [date_yoy, days_avg, metric_year]
      measures: [new_profile_retention]
      filters: [
        desktop_retention.average_window: "28",
        desktop_retention.is_desktop: "Yes",
        desktop_retention.metric_date: "2 years",
        desktop_retention.ytd_filter: "Yes"
      ]
    }

    materialization: {
      datagroup_trigger: desktop_retention_last_updated
    }
  }

  aggregate_table: rollup__date_yoy__days_avg__metric_year__existing_user {
    query: {
      dimensions: [date_yoy, days_avg, metric_year]
      measures: [retention_rate]
      filters: [
        desktop_retention.average_window: "28",
        desktop_retention.is_desktop: "Yes",
        desktop_retention.lifecycle_stage: "\"existing_user\"",
        desktop_retention.metric_date: "2 years",
        desktop_retention.ytd_filter: "Yes"
      ]
    }

    materialization: {
      datagroup_trigger: desktop_retention_last_updated
    }
  }
}
