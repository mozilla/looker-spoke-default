connection: "telemetry"
label: "DUET"
include: "views/*"
include: "explores/*"
include: "dashboards/*"

# looker-hub explores included here
include: "//looker-hub/duet/explores/*"

##########################################################################################
# below are views saved into the mr1DEVELOPMENT directory specifically for the MR1 dashboard
# do not use those views for other projects, as they are specific to the MR1 dashboard and
# haven't been developed for general consumption
include: "mr1DEVELOPMENT/explores.explore.lkml"

explore: releases {
  hidden: yes
  always_filter: {
    filters: [
      releases.category: "major"
    ]
  }
}

explore: ctd_cohort_analysis_mobile {}

explore: ctd_cohort_analysis_desktop {}

explore: kpi_dau {
  sql_always_where: ${submission_date} >= "2022-01-01" AND ${period_filtered_measures} in ("this", "last");;
}

explore: kpi_downloads {
  sql_always_where: ${submission_date} >= "2022-01-01" AND ${period_filtered_measures} in ("this", "last") AND ${device_category} = "desktop" ;;
}

explore: kpi_installs{
  sql_always_where: ${period_filtered_measures} in ("this", "last") AND
                    ${app} = "Firefox Android and iOS" AND ${os} in ( "ios", "android")
                    AND ${network} <> "Untrusted Devices";;
}

explore: app_store_territory_source_type_report {
  label: "App Store Data Report"
}

explore: funnel_android_new {
  sql_always_where: ${period_filtered_measures} in ("this", "last");;
}

explore: funnel_ios_new {
  sql_always_where: ${period_filtered_measures} in ("this", "last");;
}

explore: ctd_uac {}
