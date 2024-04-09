include: "//looker-hub/duet/views/install.view.lkml"

view: desktop_install {
  extends: [install]

  dimension: attribution {
    hidden: yes
    type: string
    sql: IF(${TABLE}.attribution IS NULL, "Unknown", SPLIT(SPLIT(${TABLE}.attribution, '26ua%3D')[SAFE_OFFSET(1)], '%')[SAFE_OFFSET(0)]) ;;
  }

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

  measure: new_installs {
    type: count
    description: "Total number of installs."
    filters: [had_old_install: "no"]
  }

  measure: paveovers {
    type: count
    description: "Total number of re-installs."
    filters: [had_old_install: "yes"]
  }
}
