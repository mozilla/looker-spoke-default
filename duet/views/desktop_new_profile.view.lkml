include: "//looker-hub/duet/views/*.view.lkml"

view: desktop_new_profile {
  extends: [new_profile]

  dimension: submission_timestamp_date {}

  dimension: startup_profile_selection_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.payload.processes.parent.scalars.startup_profile_selection_reason  ;;
  }

  dimension: attribution_ua {
    hidden: yes
    type: string
    sql: coalesce(${TABLE}.environment.settings.attribution.ua, "")  ;;
  }

  dimension: attribution_source {
    hidden: yes
    type: string
    sql: ${TABLE}.environment.settings.attribution.source ;;
  }

  dimension: distribution_id {
    hidden: yes
    type: number
    sql: ${TABLE}.environment.partner.distribution_id ;;
  }

  filter: date {
    type: date
  }

  parameter: date_shift {
    label: "Shift N days"
    type: number
    description: "Shift dates by n days. This parameter allows to adjust the date range, for example, activations are always 7 days behind."
    default_value: "0"
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

  dimension: join_date {
    description: "Date used for joining new profiles from different time periods."
    type: date
    sql: IF({% parameter previous_time_period %}, DATE(DATE_SUB(${submission_timestamp_date}, INTERVAL DATE_DIFF(DATE({% date_start date %}), DATE({% date_end date %}), DAY) DAY)), ${submission_timestamp_date}) ;;
  }

  measure: new_profiles {
    type: count
    filters: [startup_profile_selection_reason: "firstrun-created-default"]
  }
}
