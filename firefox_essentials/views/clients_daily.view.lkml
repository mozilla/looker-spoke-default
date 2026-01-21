
view: clients_daily {
  derived_table: {
    sql: select
      client_id
      ,submission_date
      ,first_seen_date
      ,days_since_first_seen
      ,BIT_COUNT(days_seen_bits) as dou
      ,country
      ,case when lower(os) like '%windows%' then 'Windows'
              when lower(os) like '%linux%' then 'Linux'
              when lower(os) like '%darwin%' then 'Mac'
              else 'Other' end as normalized_os
      ,is_regular_user_v3 as is_regular_user
      ,normalized_channel
      from telemetry.clients_last_seen c
      where submission_date >= date_add(date_trunc(current_date, year), interval -2 year)
      and sample_id <= 4
      and days_since_seen = 0 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: first_seen_date {
    type: date
    datatype: date
    sql: ${TABLE}.first_seen_date ;;
  }

  dimension: days_since_first_seen {
    type: number
    sql: ${TABLE}.days_since_first_seen ;;
  }

  dimension: dou {
    type: number
    sql: ${TABLE}.dou ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: normalized_os {
    type: string
    sql: ${TABLE}.normalized_os ;;
  }

  dimension: is_regular_user {
    type: yesno
    sql: ${TABLE}.is_regular_user ;;
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  set: detail {
    fields: [
        client_id,
  submission_date,
  first_seen_date,
  days_since_first_seen,
  dou,
  country,
  normalized_os,
  is_regular_user,
  normalized_channel
    ]
  }
}
