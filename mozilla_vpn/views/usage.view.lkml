# VPN MAU usage over time based on Glean metrics
view: usage {
  # We have to write a custom SQL statement here since, we'll need
  # to aggregating over distinct client_ids
  derived_table: {
    sql:
      WITH dates AS (
          SELECT submission_date
          FROM
            UNNEST(
              GENERATE_DATE_ARRAY(
                -- This is the earliest we have good telemetry
                '2021-09-01',
                DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY)
              )
          ) AS submission_date
      ),
      ids AS (
          SELECT
              DATE(submission_timestamp) as submission_date,
              normalized_os as os,
              client_info.app_display_version as app_version,
              client_info.client_id as client_id
          FROM mozillavpn.main
          WHERE
              DATE(submission_timestamp) > DATE(2021, 9, 1) AND
              client_info.app_channel = "production" AND
              NOT CONTAINS_SUBSTR(client_info.app_display_version, "~")
      ),
      mau AS (
        SELECT
          dates.submission_date,
          os,
          app_version,
          COUNT(distinct id) as mau,
        FROM
          dates
        INNER JOIN
          ids
        ON
            (ids.submission_date <= dates.submission_date)
            AND
            (ids.submission_date >= date_sub(dates.submission_date, interval 30 day))
      GROUP BY
        submission_date, os, app_version
    ) SELECT * FROM mau ;;
}

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.app_version ;;
  }

  measure: mau {
    type: number
    label: "Monthly Active Users"
    description: "Total number of distinct clients that have been active in the previous 30 days from the current date"
    sql: ANY_VALUE(${TABLE}.mau) ;;
  }

}
