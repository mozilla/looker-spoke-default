
###  Period over Period Method 7: Compare any period with the previous preceding period of the same length

# Like Method 2, but here we define any date filter (not just current) and
# compare it to the previous period of the same length - great for single value visualization comparisons

view: pop_method7 {
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

#######################################
  filter: date_filter {
    view_label: "_PoP"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  dimension_group: filter_start_date {
    hidden: yes
    type: time
    timeframes: [raw,date]
    #You can replace the '2013-01-01' with the first date in your database
    sql: CASE WHEN {% date_start date_filter %} IS NULL THEN '2021-01-01' ELSE CAST({% date_start date_filter %} AS DATE) END;;
  }


#######################################
  dimension_group: submission {
    type: time
    view_label: "_PoP"
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_year,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

#######################################

  dimension_group: filter_end_date {
    hidden: yes
    type: time
    timeframes: [raw,date]
    sql: CASE WHEN {% date_end date_filter %} IS NULL THEN CURRENT_DATE ELSE CAST({% date_end date_filter %} AS DATE) END;;
  }

  dimension: interval {
    hidden: yes
    type: number
    sql: DATE_DIFF(${filter_end_date_raw}, ${filter_start_date_raw}, DAY) ;;
  }

#start date of the previous period
  dimension: previous_start_date {
    hidden: yes
    type: string
    sql: DATE_ADD(${filter_start_date_raw}, INTERVAL- ${interval} DAY);;
  }


  dimension: timeframes {
    view_label: "_PoP"
    type: string
    case: {
      when: {
        sql: ${is_current_period} = true;;
        label: "Selected Period"
      }
      when: {
        sql: ${is_previous_period} = true;;
        label: "Previous Period"
      }
      else: "Not in time period"
    }
  }

## For filtered measures


  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${submission_date} >= ${filter_start_date_date} AND ${submission_date} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${submission_date} >= ${previous_start_date} AND ${submission_date} < ${filter_start_date_date} ;;
  }




#######################################

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

  measure: selected_period_user_count_active_this_day{
    view_label: "_PoP"
    type: count
    # sql: ${sale_price} ;;
    filters: [is_current_period: "yes", active_this_day: "yes"]

  }
  measure: previous_period_user_count_active_this_day {
    view_label: "_PoP"
    type: count
    # sql: ${sale_price} ;;
    filters: [is_previous_period: "yes",active_this_day: "yes"]

  }

}
