include: "//looker-hub/telemetry_dev_cycle/views/data_review_stats.view.lkml"

view: +data_review_stats {

  # dimensions
  dimension_group: update_datetime {
    hidden: yes
  }

  dimension: bug_id {
    hidden: yes
  }

  dimension_group: update {
    sql: ${update_datetime_raw} ;;
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension: bug {
    type: string
    sql:${bug_id} ;;
    value_format: "\Bug #"
    link: {
      label: "view {{ rendered_value }} on Bugzilla"
      url: "{{'https://bugzilla.mozilla.org/show_bug.cgi?id=' }}{{ value }}"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }

  # measures
  measure: first_request {
    type: date
    datatype: datetime
    sql: MIN(IF(${action} = "request", ${update_datetime_date}, NULL)) ;;
  }

  measure: last_reaction {
    type: date
    datatype: datetime
    sql: MAX(IF(${action} IN ("approval", "rejection"), ${update_datetime_date}, NULL)) ;;
  }


  measure: closed {
    type: date
    datatype: datetime
    sql: COALESCE(${last_reaction}, CURRENT_DATE());;
  }

  measure: reaction_value {
    type: number
    sql:
      COALESCE(
        IF(${last_reaction} is NULL, 0, NULL),
        IF(
          ARRAY_AGG(
            IF(${action} in ("approval", "rejection"), ${action}, NULL)
            IGNORE NULLS
            ORDER BY ${update_datetime_date} DESC
          )[OFFSET (0)] = "approval",
          1,
          -1
        )
      )
    ;;
  }


  measure: count {
    type: count
  }


}
