view: days_since_message {
  derived_table: {
    sql: SELECT d AS days_since_message
      FROM UNNEST(generate_array(1, {% parameter time_period %})) AS d;;
  }

  parameter: time_period {
    type: unquoted
    allowed_value: {
      label: "One Day"
      value: "1"
    }
    allowed_value: {
      label: "Two Days"
      value: "2"
    }
    allowed_value: {
      label: "One Week"
      value: "7"
    }
    allowed_value: {
      label: "Two Weeks"
      value: "14"
    }
    allowed_value: {
      label: "One Month"
      value: "28"
    }
    allowed_value: {
      label: "Two Months"
      value: "56"
    }
  }

  dimension: days_since_message {
    type: number
  }
}
