connection: "telemetry"
label: "DUET"
include: "views/ad_activation_performance_table.view.lkml"
include: "views/country_buckets.view.lkml"
include: "views/ctd_uac.view.lkml"
include: "views/kpi_dau.view.lkml"
include: "views/mobile_ios_country.view.lkml"
include: "views/releases.view.lkml"
include: "explores/*"
include: "dashboards/*"



# looker-hub explores included here
include: "//looker-hub/duet/explores/*"

##########################################################################################
# below are views saved into the mr1DEVELOPMENT directory specifically for the MR1 dashboard
# do not use those views for other projects, as they are specific to the MR1 dashboard and
# haven't been developed for general consumption
include: "mr1DEVELOPMENT/explores/*explore.lkml"
include: "mr1DEVELOPMENT/dashboards/*"

explore: releases {
  hidden: yes
  always_filter: {
    filters: [
      releases.category: "major"
    ]
  }
}


explore: kpi_dau {
  sql_always_where: ${submission_date} >= "2022-01-01" AND ${period_filtered_measures} in ("this", "last");;
}

explore: ctd_uac {}


##############################################################
# below is explores specifically for desktop funnel dashboards
##############################################################

include: "/duet/desktop_funnels/desktop_funnels_web.view.lkml"
include: "/duet/desktop_funnels/desktop_funnels_telemetry.view.lkml"
include: "/duet/desktop_funnels/desktop_funnels_dates.view.lkml"

explore: desktop_funnels_web {
  view_name:  desktop_funnels_web
  description: "Individual user visits to mozilla.org. By default, if a user is inactive for
  30 minutes or more, any future activity is attributed to a new visit.
  Users that leave mozilla.org and return within 30 minutes are counted as
  part of the original visit."
  sql_always_where:
      ${submission_date} > DATE({% date_start desktop_funnels_web.analysis_period %})
      AND
      ${submission_date} <= DATE({% date_end desktop_funnels_web.analysis_period %})
                                ;;
}


explore: desktop_funnels_telemetry {
  view_name:  desktop_funnels_telemetry
  description: "new profiles and telemetry based activity, note, based on
                clients_first_seen_28_days_later"
  sql_always_where:
      ${submission_date} > DATE({% date_start desktop_funnels_telemetry.analysis_period %})
      AND
      ${submission_date} <= DATE({% date_end desktop_funnels_telemetry.analysis_period %})
                                ;;
}


explore: desktop_funnels_dates {
  view_name:  desktop_funnels_dates
  description: "dates of clients_first_seen_28_days_later availability"
  sql_always_where:
      ${submission_date} > DATE({% date_start desktop_funnels_dates.analysis_period %})
      AND
      ${submission_date} <= DATE({% date_end desktop_funnels_dates.analysis_period %})
                                ;;
}
