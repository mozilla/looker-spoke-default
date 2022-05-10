include: "usage.view.lkml"

view: pop_method_1 {
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
      WHERE product = 'Focus Android'
      AND submission_date >= "2020-01-01";;
  }


  dimension_group: submission {
    type: time
    view_label: "_PoP"
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_year,
      day_of_week,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }


#(Method 1a) you may also wish to create MTD and YTD filters in LookML


  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${submission_date}) < EXTRACT(DAY FROM CURRENT_DATE())
                OR
            (EXTRACT(DAY FROM ${submission_date}) = EXTRACT(DAY FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${submission_raw}) < EXTRACT(HOUR FROM CURRENT_TIME()))
                OR
            (EXTRACT(DAY FROM ${submission_date}) = EXTRACT(DAY FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${submission_raw}) <= EXTRACT(HOUR FROM CURRENT_TIME()) AND
            EXTRACT(MINUTE FROM ${submission_raw}) < EXTRACT(MINUTE FROM CURRENT_TIME())))  ;;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAYOFYEAR FROM ${submission_date}) < EXTRACT(DAYOFYEAR FROM CURRENT_DATE())
                OR
            (EXTRACT(DAYOFYEAR FROM ${submission_date}) = EXTRACT(DAYOFYEAR FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${submission_raw}) < EXTRACT(HOUR FROM CURRENT_TIME()))
                OR
            (EXTRACT(DAYOFYEAR FROM ${submission_date}) = EXTRACT(DAYOFYEAR FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${submission_raw}) <= EXTRACT(HOUR FROM CURRENT_TIME()) AND
            EXTRACT(MINUTE FROM ${submission_raw}) < EXTRACT(MINUTE FROM CURRENT_TIME())))  ;;
  }

  dimension: days_since_seen {
    type: number
    hidden: yes
  }

  dimension: active_this_day {
    type: yesno
    sql: ${days_since_seen} < 1 ;;
    hidden: yes
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
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
}
