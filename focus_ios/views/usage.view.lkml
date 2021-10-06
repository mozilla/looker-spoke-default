view: usage {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    sql:
      SELECT
        submission_date,
        client_id,
        days_created_profile_bits,
        days_seen_bits,
        days_since_created_profile,
        days_since_seen,
        first_seen_date,
        country,
        locale
      FROM `telemetry.nondesktop_clients_last_seen`
      WHERE product = 'Focus iOS'
      AND submission_date >= "2020-01-01";;
  }

  dimension_group: submission {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: is_new_profile {
    type: yesno
    sql: ${days_since_created_profile} = 0 ;;
  }

  dimension: days_since_created_profile {
    type: number
    sql: ${TABLE}.days_since_created_profile ;;
  }

  dimension: days_seen_bits {
    type: number
    sql: ${TABLE}.days_seen_bits ;;
    hidden: yes
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: days_active_last_28 {
    type: number
    label: "Number of Days Active in Last 28"
    sql: BIT_COUNT(${days_seen_bits}) ;;
  }

  dimension: active_8_days_active_last_28 {
    type: yesno
    label: "Active at Least 8 Days in Last 28"
    sql: BIT_COUNT(${days_seen_bits}) >= 8 ;;
  }

  dimension: new_profile_activated {
    type: yesno
    sql: ${days_since_created_profile} = 7 AND BIT_COUNT(mozfun.bits28.range(${days_seen_bits}, -6, 7)) > 1;;
  }

  dimension: new_profile_7days_ago {
    type: yesno
    sql: ${days_since_created_profile} = 7;;
  }

  dimension: days_since_seen {
    type: number
    hidden: yes
  }

  dimension_group: first_run {
    type: time
    timeframes: [
      date,
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_seen_date ;;
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
