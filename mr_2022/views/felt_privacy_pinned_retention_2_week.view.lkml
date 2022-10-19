view: felt_privacy_pinned_retention_2_week {
  derived_table: {
    sql: WITH base AS (
        SELECT submission_date,
          client_id,
          os_environment_is_taskbar_pinned_private_any AS was_private_pinned
        FROM `mozdata.telemetry.clients_daily`
        WHERE submission_date > "2022-10-02"
      ), with_rolling AS (
        SELECT *,
          LAST_VALUE(was_private_pinned) OVER (
            PARTITION BY client_ID
            ORDER BY UNIX_DATE(submission_date)
            RANGE BETWEEN 1 FOLLOWING AND 14 FOLLOWING
            ) AS was_pinned_at_end_of_next_2_weeks,
          FIRST_VALUE(was_private_pinned) OVER (
            PARTITION BY client_ID
            ORDER BY UNIX_DATE(submission_date)
            RANGE BETWEEN 7 PRECEDING AND CURRENT ROW
            ) AS was_pinned_this_week
        FROM base
      ), filtered_to_currently_pinned AS (
        SELECT client_id,
          submission_date,
          was_private_pinned,
          CAST(was_pinned_at_end_of_next_2_weeks AS int) AS was_pinned_at_end_of_next_2_weeks,
          CAST(was_pinned_this_week AS int) AS was_pinned_this_week
        FROM with_rolling
        -- WHERE was_pinned_this_week
      )

      SELECT submission_date,
        client_id,
        COALESCE(was_pinned_at_end_of_next_2_weeks, 0) AS was_pinned_at_end_of_next_2_weeks,
        COALESCE(was_pinned_this_week, 0) AS was_pinned_this_week
      FROM filtered_to_currently_pinned
      ;;
  }

  dimension_group: submission {
    sql: DATE(${TABLE}.submission_date) ;;
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
    hidden: yes
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: was_pinned_at_end_of_next_2_weeks {
    type: number
    sql: ${TABLE}.was_pinned_at_end_of_next_2_weeks ;;
  }

  dimension: was_pinned_this_week {
    type: number
    sql: ${TABLE}.was_pinned_this_week ;;
  }


}
