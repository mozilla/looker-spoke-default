view: surveys {
  derived_table: {
    sql: SELECT
          count(distinct CASE when payload.offered_ts is not null then client_id else null end) as offered,
          count(distinct CASE when payload.engaged_ts is not null then client_id else null end) as engaged
        FROM
          `moz-fx-data-shared-prod.telemetry.heartbeat`
        WHERE
          date(submission_timestamp) >= '2021-05-18' -- change this to real release date
          and SPLIT(payload.survey_id, '::')[OFFSET(0)] like r'%visual\_perception\_89%'
          and normalized_channel = 'release'
         ;;
  }

  dimension: offered {
    type: number
    sql: ${TABLE}.offered ;;
  }

  dimension: engaged {
    type: number
    sql: ${TABLE}.engaged ;;
  }

}
