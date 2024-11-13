# this view and downstream explore exist to make it easier to calculate
# what days and dates are covered in the dashboard
# however it's assuming that the clients_first_seen_v2 dataset is
# current, and has blinds spots for the session and install dashboards
# if those datasources diverge in converage from clients_first_seen_v2
# then we wouldn't really know
view: dev_desktop_dates {
  derived_table: {
    sql:
        WITH full_dates AS
          (SELECT
            DISTINCT first_seen_date AS submission_date
          FROM `moz-fx-data-shared-prod.telemetry_derived.clients_first_seen_v2`
          WHERE first_seen_date >= '2021-01-01'
          AND DATE_DIFF(current_date(), first_seen_date, DAY) > 1
          ),
        lagged_dates AS
          (SELECT
            DISTINCT first_seen_date AS submission_date
          FROM `mozdata.telemetry.clients_first_seen_28_days_later`
          WHERE first_seen_date >= '2021-01-01'
          AND DATE_DIFF(current_date(), first_seen_date, DAY) > 1
          AND DATE_DIFF(current_date(),
                        DATE(first_seen_date),
                        DAY) NOT BETWEEN 0 and 28
          )
        SELECT
          a.submission_date,
          CASE WHEN b.submission_date IS NULL THEN 1 ELSE 0 END AS waiting_results,
          COALESCE(DATE_DIFF(current_date(), a.submission_date, DAY) > 28, FALSE) AS week4_reported_date
        FROM full_dates a
        LEFT JOIN lagged_dates b
        ON (a.submission_date = b.submission_date)
    ;;
  }

  dimension: week4_reported_date_described {
    type: string
    sql: CASE WHEN ${TABLE}.week4_reported_date = TRUE THEN 'data complete'
         WHEN ${TABLE}.week4_reported_date = FALSE THEN 'awaiting wk4 results'
         ELSE 'data complete'
        END
      ;;
    description: "field as string"
  }

  dimension: week4_reported_date{
    sql:  ${TABLE}.week4_reported_date;;
    type: yesno
    description: "check if date has week 4 metrics reported"
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

  measure: days_waiting_results {
    type: sum
    sql:  ${TABLE}.waiting_results ;;
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
