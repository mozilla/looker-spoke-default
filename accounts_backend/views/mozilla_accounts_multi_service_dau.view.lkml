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
    WHERE (e.metrics.string.event_name IN ('reg_complete', 'login_complete')
     OR e.metrics.string.event_name like r'access\_token%')
    AND c.id NOT IN ('c87d36d7fd9a1bcf', '00efbcb5b2dbfa0e', '6cd7216e25bc0fc0', 'b8a3bdc3790a61f6', '2a54021236022573', '1e5a77cf09e5b4b5', '7377719276ad44ee', '2963d96620413b9f', 'c40f32fd2938f0b6', 'b966b5f51190da9e', '3c32bf6654542211', '6c6c2958595c38de', '7f368c6886429f19', 'a3dbd8c5a6fd93e2', '85da77264642d6a1', '7ad9917f6c55fb77', '0d1a8469632d0f61', '565585c1745a144d', '798de7affc08df8b', 'ea3ca969f8c6bb0d', 'e7ce535d93522896', '98adfa37698f255b', '3c49430b43dfba77', '59cceb6f8c32317c')
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
