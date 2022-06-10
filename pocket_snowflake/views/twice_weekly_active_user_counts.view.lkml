view: twice_weekly_active_user_counts {
  sql_table_name: "DBT_SHARED_WITH_MOZILLA"."TWICE_WEEKLY_ACTIVE_USER_COUNTS"
    ;;

  dimension_group: active {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACTIVE_AT" ;;
  }

  dimension: user_count_dim {
    type: number
    hidden:  yes
    sql: ${TABLE}."USER_COUNT" ;;
  }

  dimension: yearly_cumulative_user_count_dim {
    type: number
    sql: ${TABLE}."YEARLY_CUMULATIVE_USER_COUNT" ;;
  }

  dimension: current_year_only {
    label: "current_year_only"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  (  (${active_date} < CURRENT_DATE())
              AND (${active_year} = EXTRACT(YEAR FROM CURRENT_DATE()))
    );;
  }
  measure: count {
    type: count
    drill_fields: []
  }

  measure: user_count {
    type: max
    sql: ${TABLE}."USER_COUNT" ;;
  }

  measure: yearly_cumulative_user_count {
    type: max
    sql: ${TABLE}."YEARLY_CUMULATIVE_USER_COUNT" ;;
  }
  }
