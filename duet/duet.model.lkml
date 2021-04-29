connection: "telemetry"
label: "DUET"
include: "views/*"
include: "explores/*"
# include: "dashboards/*"

explore: country_buckets {
  hidden: yes
}

explore: releases {
  always_filter: {
    filters: [
      releases.category: "major"
    ]
  }
}
