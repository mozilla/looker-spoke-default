
view: dev_desktop_dates_partners {
  derived_table: {
    sql:
          SELECT
            DISTINCT first_seen_date AS submission_date
          FROM `mozdata.telemetry.clients_first_seen_28_days_later`
          WHERE first_seen_date >= '2021-01-01'
          AND DATE_DIFF(current_date(), first_seen_date, DAY) > 1
    ;;
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz:  no
    datatype:  date
    description: "Date when we recieved the first Telemetry ping from user. Is renamed from first_seen_date"
  }

  measure: min_date {
    type: date_date
    sql:  min(${TABLE}.submission_date) ;;
    description: "eariest date in the analysis range"
  }

  measure: max_date {
    type: date_date
    sql:  max(${TABLE}.submission_date) ;;
    description: "eariest date in the analysis range"
  }

  measure: days {
    type: count_distinct
    sql:  ${TABLE}.submission_date ;;
    description: "number of unique dates in the analysis range"
  }

  # parameters below

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores."
    sql: TRUE ;;
  }

  filter: analysis_period {
    type: date
    description: "the start date and end date of the window being checked. will be dashboard or user inputed, not referring to data in the table"
  }

  parameter: year_over_year {
    type: yesno
    description: "Flag to determine whether data from last year should be used"
    default_value: "no"
  }

}
