connection: "telemetry"
label: "DUET"
include: "views/*"
include: "explores/*"
include: "dashboards/*"

##########################################################################################
# below are views saved into the shong-dev directory specifically for the MR1 dashboard
# do not use those views for other projects, as they are specific to the MR1 dashboard and
# haven't been developed for general consumption
include: "/shong-dev/views/version_uplift.view.lkml"
include: "/shong-dev/views/surveys.view.lkml"
include: "/shong-dev/views/feature_usage.view.lkml"
include: "/shong-dev/views/gplay_downloads.view.lkml"
include: "/shong-dev/views/mozorg_ga.view.lkml"
include: "/shong-dev/views/mozblogs_ga.view.lkml"


explore: releases {
  hidden: yes
  always_filter: {
    filters: [
      releases.category: "major"
    ]
  }
}

##########################################################################################
# below are explores defined for the MR1 dashboard
# please hide these explores, as they've been developed specifially for the MR1 dashboard
# and haven't been developed for general consumption
explore: version_uplift {
  from: version_uplift
  hidden: yes
}

explore: surveys {
  from: surveys
  hidden: yes
}

explore: feature_usage {
  from: feature_usage
  hidden: yes
}

explore: gplay_downloads {
  from: gplay_downloads
  hidden: yes
}

explore: mozorg_ga {
  from: mozorg_ga
  hidden: yes
}

explore: mozblogs_ga {
  from: mozblogs_ga
  hidden: yes
}
