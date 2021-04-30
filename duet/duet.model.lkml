connection: "telemetry"
label: "DUET"
include: "views/*"
include: "explores/*"
include: "dashboards/*"

explore: releases {
  always_filter: {
    filters: [
      releases.category: "major"
    ]
  }
}
