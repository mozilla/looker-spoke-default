view: mozilla_accounts_multi_device_dau {
  label: "Multi-Device Mozilla Accounts DAU"
  derived_table: {

    sql:
    SELECT
      DATE(e.submission_timestamp) as submission_date,
      e.metrics.string.account_user_id_sha256 AS user_id,
      ARRAY_AGG(DISTINCT CONCAT(e.metadata.user_agent.browser, ' ', e.metadata.user_agent.os, ' ', e.metadata.user_agent.version) IGNORE NULLS ORDER BY CONCAT(e.metadata.user_agent.browser, ' ', e.metadata.user_agent.os, ' ', e.metadata.user_agent.version)) as devices,
    FROM
      `mozdata.accounts_backend.accounts_events` AS e
    WHERE e.metrics.string.event_name like r'access\_token%'
    GROUP BY
      1, 2
    HAVING ARRAY_LENGTH(devices) > 1;;
  }

  measure: user_count {
    type:  count_distinct
    sql:  ${TABLE}.user_id ;;
  }

  dimension_group: date {
    type:  time
    sql:  ${TABLE}.submission_date;;
    datatype: date
    convert_tz: no
    timeframes:[
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: user_id {
    type:  string
    sql:  ${TABLE}.user_id ;;
  }

  dimension: devices_quantity {
    type: number
    sql:  ARRAY_LENGTH(${TABLE}.devices) ;;
  }

  dimension: device_names {
    type: string
    sql:  ARRAY_TO_STRING(${TABLE}.devices, ' + ') ;;
  }

}
