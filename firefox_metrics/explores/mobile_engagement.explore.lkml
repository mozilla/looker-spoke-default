include: "../views/mobile_engagement.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/mobile_engagement_last_updated.datagroup.lkml"

explore: mobile_engagement {
  label: "Engagement for Firefox Mobile"
  view_name: mobile_engagement

  always_filter: {
    filters: [
      mobile_engagement.submission_date: "28 days",
      mobile_engagement.is_mobile: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_engagement.country} = ${countries.code} ;;
  }

  persist_with: mobile_engagement_last_updated

  aggregate_table: rollup__date_yoy__days_avg__submission_year {
    query: {
      dimensions: [date_yoy, days_avg, submission_year]
      measures: [engagement_rate]
      filters: [
        mobile_engagement.app_name: "Fenix,Firefox iOS",
        mobile_engagement.average_window: "28",
        mobile_engagement.is_mobile: "Yes",
        mobile_engagement.lifecycle_stage: "\"existing_user\"",
        mobile_engagement.submission_date: "2 years",
        mobile_engagement.ytd_filter: "Yes"
      ]
    }

    materialization: {
      datagroup_trigger: mobile_engagement_last_updated
    }
  }

  aggregate_table: rollup__app_name__days_avg__submission_date {
    query: {
      dimensions: [app_name, days_avg, submission_date]
      measures: [engagement_rate]
      filters: [
        mobile_engagement.app_name: "Fenix,Firefox iOS",
        mobile_engagement.average_window: "28",
        mobile_engagement.is_mobile: "Yes",
        mobile_engagement.lifecycle_stage: "\"existing_user\"",
        mobile_engagement.submission_date: "112 days"
      ]
    }

    materialization: {
      datagroup_trigger: mobile_engagement_last_updated
    }
  }
}
