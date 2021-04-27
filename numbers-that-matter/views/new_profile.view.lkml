view: new_profile {
  sql_table_name: `mozdata.telemetry.new_profile`
    ;;

  dimension_group: submission_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.submission_timestamp ;;
  }

  dimension: client_id {
    hidden: yes
    type: string
    sql:${TABLE}.client_id ;;
  }

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: succeeded {
    hidden: yes
    type: yesno
    sql: ${TABLE}.succeeded ;;
  }

  dimension: silent {
    hidden: yes
    type: yesno
    sql: ${TABLE}.silent ;;
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

  dimension: attribution_ua {
    hidden: yes
    type: string
    sql: coalesce(${TABLE}.environment.settings.attribution.ua, "")  ;;
  }

  dimension: channel {
    hidden: yes
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: build_id {
    hidden: yes
    type: string
    sql: ${TABLE}.application.build_id ;;
  }

  dimension: os {
    type: string
    sql:  ${TABLE}.normalized_os ;;
  }

  dimension: startup_profile_selection_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.payload.processes.parent.scalars.startup_profile_selection_reason  ;;
  }

  filter: date {
    type: date
  }

  parameter: date_shift {
    label: "Shift N days"
    type: number
    description: "Shift dates by N days. This parameter allows to adjust the date range, for example, activations are always 7 days behind."
    default_value: "0"
  }

  parameter: previous_time_period {
    type: yesno
    description: "Flag to determine whether data from the previous time period should be used. This is used to compare data to the previous time period."
    default_value: "no"
  }

  dimension: join_date {
    description: "Date used for joining installs from different time periods."
    type: date
    sql: IF({% parameter previous_time_period %}, DATE(DATE_SUB(${submission_timestamp_date}, INTERVAL DATE_DIFF(DATE({% date_start date %}), DATE({% date_end date %}), DAY) DAY)), ${submission_timestamp_date}) ;;
  }

  measure: new_profiles {
    type: count
    filters: [startup_profile_selection_reason: "firstrun-created-default"]
  }
}
