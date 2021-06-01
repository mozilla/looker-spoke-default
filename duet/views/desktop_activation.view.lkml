view: desktop_activation {
  derived_table: {
    sql:
      WITH clients_last_seen AS (
        SELECT client_id, submission_date, days_seen_bits
        FROM `mozdata.telemetry.clients_last_seen`
        WHERE
          submission_date <= DATE_ADD(
            DATE_SUB(
              IF({% parameter previous_time_period %},
                DATE(DATE_ADD(DATE({% date_end date %}), INTERVAL DATE_DIFF(DATE({% date_start date %}), DATE({% date_end date %}), DAY) DAY)),
                DATE({% date_end date %})
          ), INTERVAL IF({% parameter ignore_most_recent_week %}, 9, 0) DAY), INTERVAL 6 DAY)
          AND
          submission_date >= DATE_ADD(
            DATE_SUB(
              IF({% parameter previous_time_period %},
                DATE(DATE_ADD(DATE({% date_start date %}), INTERVAL DATE_DIFF(DATE({% date_start date %}), DATE({% date_end date %}), DAY) DAY)),
                DATE({% date_start date %})
          ), INTERVAL IF({% parameter ignore_most_recent_week %}, 9, 0) DAY), INTERVAL 6 DAY)
      ),
      pop AS (
        SELECT
          ROW_NUMBER() OVER (PARTITION BY new_profile.client_id) AS rn,
          new_profile.client_id,
          normalized_country_code,
          normalized_channel AS channel,
          application.build_id AS build_id,
          normalized_os AS os,
          mozfun.norm.truncate_version(normalized_os_version, "minor") AS os_version,
          environment.settings.attribution.source AS attribution_source,
          environment.partner.distribution_id AS distribution_id,
          coalesce(environment.settings.attribution.ua, '') AS attribution_ua,
          payload.processes.parent.scalars.startup_profile_selection_reason AS startup_profile_selection_reason,
          submission_timestamp,
          coalesce(BIT_COUNT(clients_last_seen.days_seen_bits & 0x7F), 0) >= 5 AS activated
        FROM `mozdata.telemetry.new_profile` AS new_profile
        LEFT JOIN clients_last_seen
        ON clients_last_seen.client_id = new_profile.client_id AND
          DATE_ADD(DATE(new_profile.submission_timestamp), INTERVAL 6 DAY) = clients_last_seen.submission_date
        WHERE
            payload.processes.parent.scalars.startup_profile_selection_reason = 'firstrun-created-default'  AND
            DATE(submission_timestamp) <= DATE_SUB(
              IF({% parameter desktop_activation.previous_time_period %},
                -- if the data for the previous time period is requested,
                -- shift dates by the date range provided via the 'date' filter
                DATE(DATE_ADD(
                  DATE({% date_end desktop_activation.date %}),
                  INTERVAL DATE_DIFF(DATE({% date_start desktop_activation.date %}), DATE({% date_end desktop_activation.date %}), DAY) DAY)),
                DATE({% date_end desktop_activation.date %})),
              -- if the most recent week is to be ignored, shift date range by 9 days
              INTERVAL IF({% parameter desktop_activation.ignore_most_recent_week %}, 9, 0) DAY)
            AND
            DATE(submission_timestamp) > DATE_SUB(
              IF({% parameter desktop_activation.previous_time_period %},
                -- if the data for the previous time period is requested,
                -- shift dates by the date range provided via the 'date' filter
                DATE(DATE_ADD(
                  DATE({% date_start desktop_activation.date %}),
                  INTERVAL DATE_DIFF(DATE({% date_start desktop_activation.date %}), DATE({% date_end desktop_activation.date %}), DAY) DAY)),
                DATE({% date_start desktop_activation.date %})),
              -- if the most recent week is to be ignored, shift date range by 9 days
              INTERVAL IF({% parameter desktop_activation.ignore_most_recent_week %}, 9, 0) DAY)
      )
      -- make sure that we only get one entry per client
      SELECT
        * EXCEPT (rn)
      FROM
        pop
      WHERE
        rn = 1
      ;;
  }

  dimension_group: submission_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.submission_timestamp ;;
  }

  dimension: client_id {
    hidden: yes
    type: string
    sql:${TABLE}.client_id ;;
  }

  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }

  dimension: attribution_source {
    hidden: yes
    type: string
    sql: ${TABLE}.attribution_source ;;
  }

  dimension: distribution_id {
    hidden: yes
    type: number
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: attribution_ua {
    hidden: yes
    type: string
    sql: ${TABLE}.attribution_ua ;;
  }

  dimension: channel {
    hidden: yes
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: build_id {
    hidden: yes
    type: string
    sql: ${TABLE}.build_id ;;
  }

  dimension: os {
    hidden: yes
    type: string
    sql:  ${TABLE}.os ;;
  }

  dimension: startup_profile_selection_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.startup_profile_selection_reason  ;;
  }

  dimension: activated {
    hidden: yes
    type: yesno
    sql: ${TABLE}.activated ;;
  }

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores."
    sql: TRUE ;;
  }

  filter: date {
    type: date
  }

  parameter: previous_time_period {
    type: yesno
    description: "Flag to determine whether data from the previous time period should be used. For example, if the date filter is set to the previous 7 days, then the 7 days before that will be used instead."
    default_value: "no"
  }

  parameter: ignore_most_recent_week {
    label: "Ignore Most Recent Week"
    type: yesno
    description: "Ignore data from the most recent week. For example, activations are always a week behind."
    default_value: "yes"
  }

  measure: activations {
    type: count
    filters: [startup_profile_selection_reason: "firstrun-created-default", activated: "yes"]
  }
}
