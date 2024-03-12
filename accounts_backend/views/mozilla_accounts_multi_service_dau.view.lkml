view: mozilla_accounts_multi_service_dau {

  derived_table: {

    sql:
    SELECT
      DATE(e.submission_timestamp) as submission_date,
      e.metrics.string.account_user_id_sha256 AS user_id,
      ARRAY_AGG(DISTINCT c.name IGNORE NULLS ORDER BY c.name) as service_names,
    FROM
      `mozdata.accounts_backend.accounts_events` AS e
    JOIN
      `mozdata.accounts_db.fxa_oauth_clients` AS c
    ON e.metrics.string.relying_party_oauth_client_id = c.id
    WHERE c.name IN
        (
        'Add-ons',
        'Firefox',
        'Firefox iOS',
        'Firefox for Android',
        'Firefox Relay',
        'MDN Plus',
        'MDN Plus App',
        'Mozilla VPN',
        'Mozilla Monitor',
        'Mozilla IAM',
        'Mozilla Social',
        'Mozilla Support',
        'Mozilla Hubs',
        'Pontoon',
        'Pocket',
        'Thunderbird Add-ons'
        )
    AND e.metrics.string.event_name like r'access\_token%'
    GROUP BY
      1, 2
    HAVING ARRAY_LENGTH(service_names) > 1;;
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
    sql:  ARRAY_LENGTH(${TABLE}.service_names) ;;
  }

  dimension: service_names {
    type: string
    sql:  ARRAY_TO_STRING(${TABLE}.service_names, ' + ') ;;
  }

}

view:  mozilla_accounts_multi_service_dau__service_names{
  dimension: service_name {
    type: string
    sql: ${TABLE} ;;
  }
}
