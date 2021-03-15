view: event_types {
  sql_table_name: `mozdata.org_mozilla_firefox.event_types` ;;

  dimension: category {
    sql: ${TABLE}.category ;;
    type: string
  }

  dimension: event {
    sql: ${TABLE}.event ;;
    type: string
  }

  dimension: event_properties {
    hidden: yes
    sql: ${TABLE}.event_properties ;;
  }

  dimension: index {
    sql: ${TABLE}.index ;;
    type: string
  }

  dimension: numeric_index {
    sql: ${TABLE}.numeric_index ;;
    type: number
  }

  dimension_group: first {
    sql: ${TABLE}.first_timestamp ;;
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    type: time
  }

  measure: ping_count {
    type: count
  }
}