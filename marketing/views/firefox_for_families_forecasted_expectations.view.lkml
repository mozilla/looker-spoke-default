include: "//looker-hub/marketing/views/firefox_for_families_forecasted_expectations.view.lkml"


view: +firefox_for_families_forecasted_expectations {

  dimension: Country_Group {
    label: "Campaign Countries"
  }

  dimension: Value {
    hidden: yes
  }

  dimension_group: submission {
    sql: CAST(${TABLE}.Date AS DATE);;
    type: time
    timeframes: [
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  measure: forecasted_value {
    type: sum
    sql: CAST(${Value} AS NUMERIC) ;;
  }

}
