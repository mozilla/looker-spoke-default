include: "//looker-hub/fivetran/views/daily_connector_costs.view.lkml"

view: +daily_connector_costs {

  # Dimensions
  dimension: active_rows {
    hidden: yes
  }

  dimension: cost_in_usd {
    hidden: yes
  }

  dimension: connector_group {
    sql: SPLIT(${connector}, "_")[offset (0)] ;;
  }

  # Measures
  measure: total_active_rows {
    type: sum
    sql: ${active_rows};;
  }

  measure: paid_active_rows {
    type: sum
    sql: IF(${billing_type} = "paid", ${active_rows}, 0) ;;
  }

  measure: count {
    hidden: yes
  }

  measure: cost_in_USD {
    type: sum
    sql: ${cost_in_usd} ;;
    value_format_name: usd
  }

  measure: spent_rate {
    label: "Cost per Million Active Rows"
    type: number
    sql: ${cost_in_USD} / NULLIF(${paid_active_rows}, 0) * 1000000 ;;
    value_format_name: usd
  }

  measure: percentage_of_paid_active_rows {
    type: percent_of_total
    sql: ${paid_active_rows} ;;
  }

  measure: min_date {
    hidden: yes
    type: date
    sql: MIN(${measured_date}) ;;
  }

  measure: max_date {
    hidden: yes
    type: date
    sql: MAX(${measured_date}) ;;
  }

  measure: time_frame {
    type: string
    sql:
    CASE
      WHEN DATE_DIFF(${max_date}, ${min_date}, day) = 0 THEN FORMAT_DATE("%b %-d, %Y", ${max_date})
      ELSE CONCAT(FORMAT_DATE("%b %-d, %Y", ${min_date}), " - ", FORMAT_DATE("%b %-d, %Y", ${max_date}))
    END
    ;;
  }

}
