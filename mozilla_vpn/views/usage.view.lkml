# VPN usage over time based on Glean metrics
view: usage {
  # We have to write a custom SQL statement here since, we'll need
  # to aggregating over distinct client_ids
  derived_table: {
    sql:
      WITH dates AS (
          SELECT *
          FROM UNNEST(GENERATE_DATE_ARRAY('2021-09-01', DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY))) AS date
      ), ids AS (
          SELECT
              DATE(submission_timestamp) as date,
              client_info.client_id as id
          FROM mozillavpn.main
          WHERE
              DATE(submission_timestamp) > DATE(2020, 6, 1) AND
              client_info.app_channel = "production" AND
              NOT CONTAINS_SUBSTR(client_info.app_display_version, "~")
      ), mau AS (
          SELECT
              dates.date as date,
              COUNT(distinct id) as glean_mau,
          FROM dates
          INNER JOIN ids
          ON
              (ids.date <= dates.date)
              AND
              (ids.date >= date_sub(dates.date, interval 30 day))
          GROUP by date
      ), dau AS (
        SELECT
          date as date,
          COUNT(distinct id) as glean_dau
        FROM ids
        GROUP by date
      ), wau AS (
          SELECT
              dates.date as date,
              COUNT(distinct id) as glean_wau,
          FROM dates
          INNER JOIN ids
          ON
              (ids.date <= dates.date)
              AND
              (ids.date >= date_sub(dates.date, interval 7 day))
          GROUP by date
      )
      SELECT
        date,
        glean_dau AS dau,
        glean_mau AS mau,
        glean_wau AS wau
      FROM
        dau
        LEFT JOIN
        wau
        USING (date)
        LEFT JOIN
        mau
        USING (date);;
  }

  dimension: date {
    type: date
    datatype: datetime
    sql: ${TABLE}.date ;;
  }

  # Measures can be thought of as the aggregations in a GROUP BY
  # Using ANY_VALUE for these measures since they have already been aggregated inside the derived table SQL
  measure: distinct_dau {
    type: number
    label: "Daily Active Users"
    description: "Total number of distinct clients that have been active a give day"
    sql: ANY_VALUE(${TABLE}.dau) ;;
  }

  measure: distinct_wau {
    type: number
    label: "Weekly Active Users"
    description: "Total number of distinct clients that have been active in the previous 7 days from the current date"
    sql: ANY_VALUE(${TABLE}.wau) ;;
  }

  measure: distinct_mau {
    type: number
    label: "Monthly Active Users"
    description: "Total number of distinct clients that have been active in the previous 30 days from the current date"
    sql: ANY_VALUE(${TABLE}.mau) ;;
  }

}
