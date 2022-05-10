connection: "telemetry"

include: "views/*.view.lkml"
include: "//looker-hub/shared/views/*.view.lkml"

explore: data_incidents {
  description: "Known data incidents and analysis gotchas"
}
