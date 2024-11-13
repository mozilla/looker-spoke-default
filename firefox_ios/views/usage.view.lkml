include: "//looker-hub/firefox_ios/views/baseline_clients_last_seen.view.lkml"

view: usage {
  extends: [baseline_clients_last_seen]

  dimension: days_since_seen {
    hidden: yes
  }

  dimension: days_since_seen_session_end {
    hidden: yes
  }

  dimension: days_since_seen_session_start {
    hidden: yes
  }

  dimension_group: first_run {
    type: time
    timeframes: [
      date,
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_run_date ;;
  }

  dimension: active_this_day {
    type: yesno
    sql: ${days_since_seen} < 1 ;;
    hidden: yes
  }

  dimension: active_in_last_5_days {
    type: yesno
    sql:  mozudf.bits_28.active_in_5(${days_seen_bits}) ;;
    hidden: yes
  }

  dimension: active_last_7_days {
    type: yesno
    sql: ${days_since_seen} < 7 ;;
    hidden: yes
  }

  dimension: active_two_weeks_ago {
    type: number
    sql: mozfun.bits28.active_in_range(${days_seen_bits}, -14, 7) ;;
    hidden: yes
  }

  dimension: active_last_week_and_two_weeks_ago {
    type: number
    sql: ${active_last_7_days} AND ${active_two_weeks_ago} ;;
    hidden: yes
  }

  dimension: active_today {
    type: yesno
    sql: mozfun.bits28.active_in_range(${days_seen_bits}, 0, 1) ;;
    hidden: yes
  }

  dimension: active_yesterday {
    type: number
    sql: mozfun.bits28.active_in_range(${days_seen_bits}, -1, 1) ;;
    hidden: yes
  }

  dimension: active_today_and_yesterday {
    type: number
    sql: ${active_today} AND ${active_yesterday} ;;
    hidden: yes
  }

  measure: wow_retention {
    label: "WoW Retention"
    type: number
    sql: SAFE_DIVIDE(COUNTIF(${active_last_week_and_two_weeks_ago}), COUNTIF(${active_two_weeks_ago})) ;;
    drill_fields: [country, wow_retention]
  }

  measure: dod_retention {
    label: "DoD Retention"
    type: number
    sql: SAFE_DIVIDE(COUNTIF(${active_today_and_yesterday}), COUNTIF(${active_yesterday})) ;;
    drill_fields: [country, dod_retention]
  }

  measure: user_count_active_28_days {
    label: "Monthly Active Users"
    type: count

    drill_fields: [country, user_count_active_28_days]
  }

  measure: user_count_active_this_day {
    label: "Daily Active Users"
    type: count

    filters: {
      field: active_this_day
      value: "yes"
    }

    drill_fields: [country, user_count_active_this_day]
  }

  measure: user_count_active_7_days {
    label: "Weekly Active Users"
    type: count

    filters: {
      field: active_last_7_days
      value: "yes"
    }

    drill_fields: [country, user_count_active_7_days]
  }

  dimension: intensity {
    type: number
    sql: BIT_COUNT(mozfun.bits28.range(${TABLE}.days_seen_bits, -13 + 0, 7)) ;;
  }

  measure: average_intensity {
    label: "Average Intensity"
    type: average
    sql: ${intensity} ;;
    drill_fields: [country, average_intensity]
  }
}
