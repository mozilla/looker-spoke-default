
view: clients_daily_crashes {
  derived_table: {
    sql: select
      cd.client_id
      ,cd.submission_date
      ,sum(cd.content_crash_count) as content_crash_count
      ,sum(cd.gpu_crash_count) as gpu_crash_count
      ,sum(cd.main_crash_count) as main_crash_count
      ,sum(cd.rdd_crash_count) as rdd_crash_count
      ,sum(cd.socket_crash_count) as socket_crash_count
      ,sum(cd.utility_crash_count) as utility_crash_count
      ,sum(cd.vr_crash_count) as vr_crash_count
      ,sum(ifnull(cd.content_crash_count,0)
          +ifnull(cd.gpu_crash_count,0)
          +ifnull(cd.main_crash_count,0)
          +ifnull(cd.rdd_crash_count,0)
          +ifnull(cd.socket_crash_count,0)
          +ifnull(cd.utility_crash_count,0)
          +ifnull(cd.vr_crash_count,0)) as total_crashes
      from telemetry.crashes_daily cd
      where cd.submission_date >= date_add(date_trunc(current_date, year), interval -2 year)
      and cd.sample_id <= 4
      group by 1,2;;
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

  dimension: content_crash_count {
    type: number
    sql: ${TABLE}.content_crash_count ;;
  }

  dimension: gpu_crash_count {
    type: number
    sql: ${TABLE}.gpu_crash_count ;;
  }

  dimension: main_crash_count {
    type: number
    sql: ${TABLE}.main_crash_count ;;
  }

  dimension: rdd_crash_count {
    type: number
    sql: ${TABLE}.rdd_crash_count ;;
  }

  dimension: socket_crash_count {
    type: number
    sql: ${TABLE}.socket_crash_count ;;
  }

  dimension: utility_crash_count {
    type: number
    sql: ${TABLE}.utility_crash_count ;;
  }

  dimension: vr_crash_count {
    type: number
    sql: ${TABLE}.vr_crash_count ;;
  }

  dimension: total_crashes {
    type: number
    sql: ${TABLE}.total_crashes ;;
  }

  set: detail {
    fields: [
        client_id,
  submission_date,
  content_crash_count,
  gpu_crash_count,
  main_crash_count,
  rdd_crash_count,
  socket_crash_count,
  utility_crash_count,
  vr_crash_count,
  total_crashes
    ]
  }
}
