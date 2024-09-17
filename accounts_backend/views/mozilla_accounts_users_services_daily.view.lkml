view: mozilla_accounts_users_services_daily {
  derived_table: {

    sql:
    SELECT
      submission_date,
      user_id_sha256 AS user_id_sha256,
      country,
      service,
      c.name AS service_name
    FROM
      `mozdata.accounts_backend.users_services_daily` AS e
    JOIN
      `mozdata.accounts_db.fxa_oauth_clients` AS c
    ON service = c.id
    ;;
  }

  measure: user_count {
    type:  count_distinct
    sql:  ${TABLE}.user_id_sha256 ;;
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

  dimension: user_id_sha256 {
    type:  string
    hidden: yes
    sql:  ${TABLE}.user_id_sha256 ;;
  }

  dimension: country {
    type: string
    sql:  ${TABLE}.country ;;
  }

  dimension: service {
    type: string
    sql:  ${TABLE}.service ;;
  }

  dimension: service_name {
    type: string
    sql:  ${TABLE}.service_name ;;
  }
}
