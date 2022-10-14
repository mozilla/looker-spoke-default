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
        WHERE was_pinned_this_week
      )

      SELECT submission_date,
      ROUND(AVG(was_pinned_at_end_of_next_2_weeks) * 100,2) AS remained_pinned_rate
      FROM filtered_to_currently_pinned
      GROUP BY submission_date
      ORDER BY submission_date
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
  }

  measure: remained_pinned_rate {
    type: number
    sql: avg(${TABLE}.remained_pinned_rate) ;;
    description: "Out of the users pinned during the previous 7 days, what fraction remained pinned at the end of the next 14 days"
  }

}
