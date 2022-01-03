view: column_size_differences{
  dimension: byte_size {
    sql: ${TABLE}.byte_size ;;
    type: number
  }

  dimension: column_name {
    primary_key: yes
    sql: ${TABLE}.column_name ;;
    type: string
  }

  dimension: dataset_id {
    sql: ${TABLE}.dataset_id ;;
    type: string
  }

  dimension: table_id {
    sql: ${TABLE}.table_id ;;
    type: string
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
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension_group: submission_previous_week {
    sql: add_date(${TABLE}.submission_date_previous_week, -7) ;;
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
  }

  sql_table_name: `mozdata.monitoring.column_size_previous_week` ;;
}
