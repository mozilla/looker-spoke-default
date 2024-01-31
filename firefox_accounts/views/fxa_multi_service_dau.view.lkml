view: fxa_multi_service_dau {

  derived_table: {

    sql:
    SELECT
      DATE(timestamp) as submission_date,
      user_id,
      ARRAY_AGG(DISTINCT service IGNORE NULLS ORDER BY service) as services,
      MAX_BY(country_code, timestamp) as country_code
    FROM
      `mozdata.firefox_accounts.fxa_all_events`
    WHERE service IN ('sync', 'mdn-plus', 'guardian-vpn', 'fx-monitor', 'fx-private-relay', 'pocket-web', 'amo-web', 'thunderbird-addons', 'mozilla-iam', 'moz-social', 'mozilla-support', 'pontoon', 'mozilla-hubs-dev')
    AND event_type like r'fxa\_activity%'
    GROUP BY
      1, 2
    HAVING ARRAY_LENGTH(services) > 1;;
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

  dimension: services_quantity {
    type: number
    sql:  ARRAY_LENGTH(${TABLE}.services) ;;
  }

  dimension: service_list {
    type: string
    sql:  ARRAY_TO_STRING(${TABLE}.services, ' + ') ;;
  }

  dimension: country_code {
    type:  string
    sql:  ${TABLE}.country_code ;;
  }
}
