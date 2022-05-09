include: "usage.view.lkml"

view: period_over_period_parameters {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;
    sql:
      SELECT
        submission_date,
        client_id,
        days_created_profile_bits,
        days_seen_bits,
        days_since_created_profile,
        days_since_seen,
        first_seen_date,
        country,
        locale
      FROM `telemetry.nondesktop_clients_last_seen`
      WHERE product = 'Focus Android'
      AND submission_date >= "2020-01-01";;
  }

  dimension_group: submission {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_year,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  parameter: select_timeframe {
    type: unquoted
    default_value: "month"
    allowed_value: {
      value: "year"
      label: "Years"
    }
    allowed_value: {
      value: "month"
      label: "Months"
    }
    allowed_value: {
      value: "week"
      label: "Weeks"
    }
    allowed_value: {
      value: "day"
      label: "Days"
    }
  }

  parameter: select_reference_date {
    type: date
    convert_tz: no
  }

  dimension_group: current_timestamp {
    hidden: yes
    type: time
    timeframes: [raw,date,day_of_week_index,day_of_month,day_of_year]
    convert_tz: no
    sql: CURRENT_TIMESTAMP() ;; #### BIGQUERY

  }

  dimension: current_vs_previous_period {
    description: "Use this dimension along with \"Select Timeframe\" Filter"
    type: string
    sql:
    CASE
      WHEN DATE_TRUNC(${submission_date},  {% parameter period_over_period_parameters.select_timeframe %}) = DATE_TRUNC(DATE({% if period_over_period_parameters.select_reference_date._is_filtered %}{% parameter period_over_period_parameters.select_reference_date %} {% else %} ${period_over_period_parameters.current_timestamp_date}{% endif %}), {% parameter period_over_period_parameters.select_timeframe %})
        THEN '{% if period_over_period_parameters.select_reference_date._is_filtered %}Reference {% else %}Current {% endif %} {% parameter period_over_period_parameters.select_timeframe %}'
      WHEN DATE_TRUNC(${submission_date},  {% parameter period_over_period_parameters.select_timeframe %}) = DATE_TRUNC(DATE_SUB(DATE({% if period_over_period_parameters.select_reference_date._is_filtered %}{% parameter period_over_period_parameters.select_reference_date %} {% else %} ${period_over_period_parameters.current_timestamp_date}{% endif %}), INTERVAL 1 {% parameter period_over_period_parameters.select_timeframe %}), {% parameter period_over_period_parameters.select_timeframe %})
        THEN "Previous {% parameter period_over_period_parameters.select_timeframe %}"
      ELSE NULL
    END
    ;;
  }


  dimension: days_since_seen {
    type: number
    hidden: yes
  }

  dimension: active_this_day {
    type: yesno
    sql: ${days_since_seen} < 1 ;;
    hidden: yes
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  measure: user_count_active_this_day {
    label: "Daily Active Users"
    type: count

    filters: {
      field: active_this_day
      value: "yes"
    }


    drill_fields: [country, user_count_active_this_day]
  }

}
