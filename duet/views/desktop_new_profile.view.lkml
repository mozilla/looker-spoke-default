include: "//looker-hub/duet/views/new_profile.view.lkml"

view: desktop_new_profile {
  extends: [new_profile]

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores."
    sql: TRUE ;;
  }

  filter: date {
    type: date
  }

  parameter: previous_time_period {
    type: yesno
    description: "Flag to determine whether data from the previous time period should be used. For example, if the date filter is set to the previous 7 days, then the 7 days before that will be used instead."
    default_value: "no"
  }

  parameter: ignore_most_recent_week {
    label: "Ignore Most Recent Week"
    type: yesno
    description: "Ignore data from the most recent week. For example, activations are always a week behind."
    default_value: "no"
  }

  measure: new_profiles {
    type: count
    filters: [payload__processes__parent__scalars__startup_profile_selection_reason: "firstrun-created-default"]
  }
}
