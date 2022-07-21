view: survey_lifecycle_28d_mobile {
  sql_table_name: `mozdata.mozilla_vpn.survey_lifecycle_28d_mobile`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: response_time {
    type: number
    sql: ${TABLE}.response_time ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: submission {
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
    sql: ${TABLE}.submission_date ;;
  }

  dimension: survey_data {
    hidden: yes
    sql: ${TABLE}.survey_data ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

view: survey_lifecycle_28d_mobile__survey_data {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: answer {
    type: string
    sql: answer ;;
  }

  dimension: answer_id {
    type: number
    sql: answer_id ;;
  }

  dimension: options {
    hidden: yes
    sql: options ;;
  }

  dimension: original_answer {
    type: string
    sql: original_answer ;;
  }

  dimension: question {
    type: string
    sql: question ;;
  }

  dimension: section_id {
    type: number
    sql: section_id ;;
  }

  dimension: shown {
    type: yesno
    sql: shown ;;
  }

  dimension: subquestions {
    type: string
    sql: subquestions ;;
  }

  dimension: survey_lifecycle_28d_mobile__survey_data {
    type: string
    hidden: yes
    sql: survey_lifecycle_28d_mobile__survey_data ;;
  }

  dimension: type {
    type: string
    sql: type ;;
  }

  measure: non_null_count {
    type: count
    label: "Count - Not Null"
    filters: [answer: "-NULL"]
  }

  measure: satisfied_very_satisfied_count {
    type: count
    label: "Count - Satisfied or Very Satisfied"
    filters: [answer: "Satisfied, Very Satisfied"]
  }

  measure: agree_strongly_agree_count {
    type: count
    label: "Count - Agree or Strongly Agree"
    filters: [answer: "Agree, Strongly Agree"]
  }
}

view: survey_lifecycle_28d_mobile__survey_data__options {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: answer {
    type: string
    sql: ${TABLE}.answer ;;
  }

  dimension: option {
    type: string
    sql: ${TABLE}.option ;;
  }
}
