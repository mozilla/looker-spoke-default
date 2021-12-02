view: desktop_activation_aggregates {
  derived_table: {
    sql:
      SELECT * FROM `moz-fx-data-shared-prod.telemetry_derived.desktop_funnel_activation_v1`
      LEFT JOIN
        mozdata.static.country_names_v1 cn
      ON country_name = cn.name
    ;;
  }

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
    sql: ${TABLE}.date ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: attribution_source {
    hidden: yes
    type: string
    sql: ${TABLE}.attribution_source ;;
  }

  dimension: distribution_id {
    hidden: yes
    type: number
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: attribution_ua {
    hidden: yes
    type: string
    sql: ${TABLE}.attribution_ua ;;
  }

  dimension: channel {
    hidden: yes
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: build_id {
    hidden: yes
    type: string
    sql: ${TABLE}.build_id ;;
  }

  dimension: os {
    hidden: yes
    type: string
    sql:  ${TABLE}.os ;;
  }

  dimension: os_version {
    hidden: yes
    type: string
    sql:  ${TABLE}.os_version ;;
  }

  measure: activations {
    type: number
    sql: SUM(${TABLE}.num_activated) ;;
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
    default_value: "yes"
  }
}
