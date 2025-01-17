# The name of this view in Looker is "Key Tentpole Dates"
view: key_tentpole_dates {

  sql_table_name: `mozdata.static.key_tentpole_dates`;;

  dimension_group: end {
    type: time
    description: "The end of the time period."
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: key_tentpole {
    type: string
    description: "The name of the Key Tentpole Event."
    sql: ${TABLE}.key_tentpole ;;
  }

  dimension_group: start {
    type: time
    description: "The beginning of the time period"
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
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    type: count
  }

}
