include: "//looker-hub/fenix/views/client_counts.view.lkml"


view: clients_counts_pop_method1 {
  extends: [client_counts]
  dimension_group: first_seen_pop {
    # sql: ${TABLE}.first_seen_date ;;
    type: time
    view_label: "_PoP"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    datatype: date
    #add 1450 days as a test for shifting the old timestamp to recent timestamp
    sql: timestamp_add(${TABLE}.first_seen_date, interval 1450 day) ;;
    convert_tz: no
  }

  # (Method 1a) you may also wish to create MTD and YTD filters in LookML

  dimension: wtd_only {
    group_label: "To-Date Filters"
    label: "WTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAYOFWEEK FROM ${first_seen_pop_raw}) < EXTRACT(DAYOFWEEK FROM CURRENT_DATE())
                OR
            (EXTRACT(DAYOFWEEK FROM ${first_seen_pop_raw}) = EXTRACT(DAYOFWEEK FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_pop_raw}) < EXTRACT(HOUR FROM CURRENT_TIME()))
                OR
            (EXTRACT(DAYOFWEEK FROM ${first_seen_pop_raw}) = EXTRACT(DAYOFWEEK FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_pop_raw}) <= EXTRACT(HOUR FROM CURRENT_TIME()) AND
            EXTRACT(MINUTE FROM ${first_seen_pop_raw}) < EXTRACT(MINUTE FROM CURRENT_TIME())))  ;;
  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${first_seen_pop_raw}) < EXTRACT(DAY FROM CURRENT_DATE())
                OR
            (EXTRACT(DAY FROM ${first_seen_pop_raw}) = EXTRACT(DAY FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_pop_raw}) < EXTRACT(HOUR FROM CURRENT_TIME()))
                OR
            (EXTRACT(DAY FROM ${first_seen_pop_raw}) = EXTRACT(DAY FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_pop_raw}) <= EXTRACT(HOUR FROM CURRENT_TIME()) AND
            EXTRACT(MINUTE FROM ${first_seen_pop_raw}) < EXTRACT(MINUTE FROM CURRENT_TIME())))  ;;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAYOFYEAR FROM ${first_seen_pop_raw}) < EXTRACT(DAYOFYEAR FROM CURRENaT_DATE())
                OR
            (EXTRACT(DAYOFYEAR FROM ${first_seen_pop_raw}) = EXTRACT(DAYOFYEAR FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_pop_raw}) < EXTRACT(HOUR FROM CURRENT_TIME()))
                OR
            (EXTRACT(DAYOFYEAR FROM ${first_seen_pop_raw}) = EXTRACT(DAYOFYEAR FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_pop_raw}) <= EXTRACT(HOUR FROM CURRENT_TIME()) AND
            EXTRACT(MINUTE FROM ${first_seen_pop_raw}) < EXTRACT(MINUTE FROM CURRENT_TIME())))  ;;
  }

  # measure: total_user_count {
  #   type: count
  # }

  measure: total_client_id_count_pop {
    label: "Total count of user count"
    view_label: "_PoP"
    type: count
    sql: ${TABLE}.clients _id ;;
    drill_fields: [first_seen_pop_date]
  }

}
