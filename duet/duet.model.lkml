connection: "telemetry"
label: "DUET"
include: "views/*"
include: "explores/*"
include: "dashboards/*"

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
