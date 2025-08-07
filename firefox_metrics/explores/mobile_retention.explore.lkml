include: "../views/mobile_retention.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/mobile_retention_last_updated.datagroup.lkml"

explore: mobile_retention {
  label: "Retention for Firefox Mobile"
  view_name: mobile_retention

  always_filter: {
    filters: [
      mobile_retention.metric_date: "56 days",
      mobile_retention.is_mobile: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_retention.country} = ${countries.code} ;;
  }

  persist_with: mobile_retention_last_updated

  aggregate_table: rollup__date_yoy__days_avg__metric_year {
    query: {
      dimensions: [date_yoy, days_avg, metric_year]
      measures: [retention_rate]
      filters: [
        mobile_retention.app_name: "Fenix,Firefox iOS",
        mobile_retention.average_window: "28",
        mobile_retention.is_mobile: "Yes",
        mobile_retention.lifecycle_stage: "\"existing_user\"",
        mobile_retention.metric_date: "2 years",
        mobile_retention.ytd_filter: "Yes"
      ]
    }

    materialization: {
      datagroup_trigger: mobile_retention_last_updated
    }
  }

  aggregate_table: rollup__app_name__days_avg__metric_date {
    query: {
      dimensions: [app_name, days_avg, metric_date]
      measures: [new_profile_retention]
      filters: [
        mobile_retention.app_name: "Fenix,Firefox iOS",
        mobile_retention.average_window: "28",
        mobile_retention.is_mobile: "Yes",
        mobile_retention.metric_date: "140 days"
      ]
    }

    materialization: {
      datagroup_trigger: mobile_retention_last_updated
    }
  }

  aggregate_table: rollup__app_name__days_avg__metric_date__retention_rate {
    query: {
      dimensions: [app_name, days_avg, metric_date]
      measures: [retention_rate]
      filters: [
        mobile_retention.app_name: "Fenix,Firefox iOS",
        mobile_retention.average_window: "28",
        mobile_retention.is_mobile: "Yes",
        mobile_retention.lifecycle_stage: "\"existing_user\"",
        mobile_retention.metric_date: "140 days"
      ]
    }

    materialization: {
      datagroup_trigger: mobile_retention_last_updated
    }
  }
}
