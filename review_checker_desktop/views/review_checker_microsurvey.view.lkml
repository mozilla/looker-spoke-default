include: "//looker-hub/review_checker_desktop/views/microsurvey.view.lkml"

view: +microsurvey {


  dimension: client_id {
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: coded_answers {
    sql: ${TABLE}.coded_answers ;;
    type: string
  }

  dimension: coded_question {
    sql: ${TABLE}.coded_question ;;
    type: string
  }

  dimension: country_code {
    sql: ${TABLE}.country_code ;;
    type: string
  }

  dimension: event {
    sql: ${TABLE}.event ;;
    type: string
  }

  dimension: event_page {
    sql: ${TABLE}.event_page ;;
    type: string
  }

  dimension: event_reason {
    sql: ${TABLE}.event_reason ;;
    type: string
  }

  dimension: event_source {
    sql: ${TABLE}.event_source ;;
    type: string
  }

  dimension: existing_user {
    sql: ${TABLE}.existing_user ;;
    type: number
  }

  dimension: experiments {
    sql: ${TABLE}.experiments ;;
    hidden: yes
  }

  dimension: message_id {
    sql: ${TABLE}.message_id ;;
    type: string
  }

  dimension: new_user {
    sql: ${TABLE}.new_user ;;
    type: number
  }

  dimension: normalized_channel {
    sql: ${TABLE}.normalized_channel ;;
    type: string
  }

  dimension: os_version {
    sql: ${TABLE}.os_version ;;
    type: number
  }

  dimension: sample_id {
    sql: ${TABLE}.sample_id ;;
    type: number
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

  measure: client_count  {
    type: count_distinct
    sql: ${client_id} ;;
  }

  measure: percent_of_total_clients {
    type: percent_of_total
    sql: ${client_count} ;;
  }

  measure: existing_user_sum {
    type: sum_distinct
    sql_distinct_key: ${client_id} ;;
    sql: ${existing_user} ;;
  }

  measure: existing_clients_percent_of_total {
    type: number
    sql: IFNULL(SAFE_DIVIDE(${existing_user_sum} , SUM(${client_count}) OVER()) *100, 0);;
    value_format: "0\%"
  }

  measure: new_user_sum {
    type: sum_distinct
    sql_distinct_key: ${client_id} ;;
    sql: ${new_user} ;;
  }

  measure: new_clients_percent_of_total {
    type: number
    sql: IFNULL(SAFE_DIVIDE(${new_user_sum}, SUM(${client_count}) OVER()) * 100, 0) ;;
    value_format: "0\%"
  }


  sql_table_name: `mozdata.firefox_desktop.review_checker_microsurvey` ;;
}
