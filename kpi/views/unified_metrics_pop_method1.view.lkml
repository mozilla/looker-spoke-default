include: "//looker-hub/kpi/views/unified_metrics.view.lkml"

view: +unified_metrics {
  dimension: active_today {
    type: yesno
    label: "Client Sent Ping Today"
    sql:  `mozfun`.bits28.active_in_range(${TABLE}.days_seen_bits, 0, 1) ;;
    description: "Did we recieve a ping from the client today?"
  }

  dimension: client_qualifies {
    type: yesno
    label: "Client Qualifies for 2022 KPI"
    sql: CASE WHEN ${TABLE}.normalized_app_name != 'Firefox Desktop' THEN TRUE
      WHEN ${TABLE}.normalized_app_name = 'Firefox Desktop' AND ${TABLE}.active_hours_sum > 0 AND ${TABLE}.uri_count > 0 THEN TRUE
      ELSE FALSE END ;;
  }

  dimension: normalized_app_name {
    label: "App Name"
    description: "Possible Values are Firefox Desktop, Firefox iOS, Fenix, Focus Android and Focus iOS"
  }

  dimension: platform {
    label: "Platform (Firefox Desktop or Mobile)"
    sql: CASE WHEN ${TABLE}.normalized_app_name = 'Firefox Desktop' THEN 'Firefox Desktop' ELSE 'Firefox Mobile' END ;;
  }


  dimension_group: first_seen_at {
    # sql: ${TABLE}.first_seen_date ;;
    type: time
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
    sql:  (EXTRACT(DAYOFWEEK FROM ${first_seen_at_raw}) < EXTRACT(DAYOFWEEK FROM CURRENT_DATE())
                OR
            (EXTRACT(DAYOFWEEK FROM ${first_seen_at_raw}) = EXTRACT(DAYOFWEEK FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_at_raw}) < EXTRACT(HOUR FROM CURRENT_TIME()))
                OR
            (EXTRACT(DAYOFWEEK FROM ${first_seen_at_raw}) = EXTRACT(DAYOFWEEK FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_at_raw}) <= EXTRACT(HOUR FROM CURRENT_TIME()) AND
            EXTRACT(MINUTE FROM ${first_seen_at_raw}) < EXTRACT(MINUTE FROM CURRENT_TIME())))  ;;
  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${first_seen_at_raw}) < EXTRACT(DAY FROM CURRENT_DATE())
                OR
            (EXTRACT(DAY FROM ${first_seen_at_raw}) = EXTRACT(DAY FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_at_raw}) < EXTRACT(HOUR FROM CURRENT_TIME()))
                OR
            (EXTRACT(DAY FROM ${first_seen_at_raw}) = EXTRACT(DAY FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_at_raw}) <= EXTRACT(HOUR FROM CURRENT_TIME()) AND
            EXTRACT(MINUTE FROM ${first_seen_at_raw}) < EXTRACT(MINUTE FROM CURRENT_TIME())))  ;;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAYOFYEAR FROM ${first_seen_at_raw}) < EXTRACT(DAYOFYEAR FROM CURRENT_DATE())
                OR
            (EXTRACT(DAYOFYEAR FROM ${first_seen_at_raw}) = EXTRACT(DAYOFYEAR FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_at_raw}) < EXTRACT(HOUR FROM CURRENT_TIME()))
                OR
            (EXTRACT(DAYOFYEAR FROM ${first_seen_at_raw}) = EXTRACT(DAYOFYEAR FROM CURRENT_DATE()) AND
            EXTRACT(HOUR FROM ${first_seen_at_raw}) <= EXTRACT(HOUR FROM CURRENT_TIME()) AND
            EXTRACT(MINUTE FROM ${first_seen_at_raw}) < EXTRACT(MINUTE FROM CURRENT_TIME())))  ;;
  }

  # measure: total_user_count {
  #   type: count
  # }

  measure: total_user_count_sum {
    label: "Total sum of user count"
    view_label: "_PoP"
    type: sum
    sql: ${TABLE}.clients ;;
    value_format_name: usd
    drill_fields: [first_seen_date]
  }


  # measure: clients {
  #   hidden: yes
  # }
}
