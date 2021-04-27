view: session {
  sql_table_name: `moz-fx-data-marketing-prod.ga_derived.www_site_metrics_summary_v1`
    ;;

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: downloads {
    hidden: yes
    type: number
    sql: ${TABLE}.downloads ;;
  }

  dimension: non_fx_downloads {
    hidden: yes
    type: number
    sql: ${TABLE}.non_fx_downloads ;;
  }

  dimension: non_fx_sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.non_fx_sessions ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: standardized_country_name {
    type: string
    sql: ${TABLE}.standardized_country_name ;;
  }

  parameter: previous_time_period {
    type: yesno
    description: "Flag to determine whether data from the previous time period should be used. This is used for comparing different time periods."
    default_value: "no"
  }

  filter: date {
    type: date
  }

  parameter: date_shift {
    label: "Shift N days"
    type: number
    description: "Shift dates by N days. This parameter allows to adjust the date range, for example, activations are always 8 days behind."
    default_value: "0"
  }

  dimension: join_date {
    description: "Date used for joining installs from different time periods."
    type: date
    sql: IF({% parameter previous_time_period %}, DATE(DATE_SUB(${date_date}, INTERVAL DATE_DIFF(DATE({% date_start date %}), DATE({% date_end date %}), DAY) DAY)), ${date_date}) ;;
  }

  measure: total_non_fx_sessions {
    type: sum
    sql: ${TABLE}.non_fx_sessions ;;
  }

  measure: total_non_fx_downloads {
    type: sum
    sql: ${TABLE}.non_fx_downloads ;;
  }
}
