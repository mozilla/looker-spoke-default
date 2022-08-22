# VPN Weekly Active Clients (based on Glean telemetry)
view: usage_wac {
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
          FROM mozilla_vpn.main
          WHERE
              DATE(submission_timestamp) > DATE(2021, 9, 1) AND
              client_info.app_channel = "production" AND
              NOT CONTAINS_SUBSTR(client_info.app_display_version, "~")
      ),
      wac AS (
        SELECT
          dates.submission_date,
          os,
          app_version,
          client_id as client_id,
        FROM
          dates
        INNER JOIN
          ids
        ON
            (ids.submission_date <= dates.submission_date)
            AND
            (ids.submission_date >= date_sub(dates.submission_date, interval 7 day))
    ) SELECT * FROM wac ;;
  }

  dimension: client_id {
    type: string
    primary_key: yes
    hidden: yes
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

  measure: wac {
    type: count_distinct
    label: "Weekly Active Clients"
    description: "Total number of distinct clients that have been active in the previous 7 days from the submission date"
    sql: ${TABLE}.client_id ;;
  }

}
