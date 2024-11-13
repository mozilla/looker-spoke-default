connection: "telemetry"

include: "//looker-hub/shared/views/data_incidents.view.lkml"

explore: data_incidents {
  description: "Known data incidents and analysis gotchas"
}
