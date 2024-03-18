
view: clients_daily_telemetry {
  derived_table: {
    sql: select
      date(submission_timestamp) as submission_date
      ,client_id
      ,sum(m1.payload.info.subsession_length/1000.00) as subsession_length_sec
      ,sum(m1.payload.processes.parent.scalars.browser_engagement_session_time_excluding_suspend)/1000.00 as engagement_time_sec
      /* Video Consumption */
      ,coalesce(SUM(SAFE_CAST(JSON_EXTRACT_SCALAR(payload.processes.content.histograms.video_play_time_ms, "$.sum") AS int64)) / 1000.00,0) AS video_playtime_sec
      ,coalesce(SUM(SAFE_CAST(JSON_EXTRACT_SCALAR(payload.processes.content.histograms.video_hdr_play_time_ms, "$.sum") AS int64)) / 1000.00,0) AS video_hdr_playtime_sec
      ,coalesce(SUM(SAFE_CAST(JSON_EXTRACT_SCALAR(payload.processes.content.histograms.video_widevine_play_time_ms, "$.sum") AS int64)) / 1000.00,0) AS video_widevine_playtime_sec
      ,coalesce(SUM(SAFE_CAST(JSON_EXTRACT_SCALAR(payload.processes.content.histograms.video_encrypted_play_time_ms, "$.sum") AS int64)) / 1000.00,0) AS video_encrypted_playtime_sec
      ,coalesce(SUM(SAFE_CAST(JSON_EXTRACT_SCALAR(payload.processes.content.histograms.video_clearkey_play_time_ms, "$.sum") AS int64)) / 1000.00,0) AS video_clearkey_playtime_sec
      /* Power Usage */
      ,coalesce(SUM(payload.processes.content.scalars.power_total_cpu_time_ms) / 1000.00,0) AS power_total_cpu_time_sec
      from telemetry.main m1
      where sample_id <= 4
      and date(submission_timestamp) >= date_add(date_trunc(current_date, year), interval -2 year)
      and normalized_channel = 'release'
      group by 1,2;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: subsession_length_sec {
    type: number
    sql: ${TABLE}.subsession_length_sec ;;
  }

  dimension: engagement_time_sec {
    type: number
    sql: ${TABLE}.engagement_time_sec ;;
  }

  dimension: video_playtime_sec {
    type: number
    sql: ${TABLE}.video_playtime_sec ;;
  }

  dimension: video_hdr_playtime_sec {
    type: number
    sql: ${TABLE}.video_hdr_playtime_sec ;;
  }

  dimension: video_widevine_playtime_sec {
    type: number
    sql: ${TABLE}.video_widevine_playtime_sec ;;
  }

  dimension: video_encrypted_playtime_sec {
    type: number
    sql: ${TABLE}.video_encrypted_playtime_sec ;;
  }

  dimension: video_clearkey_playtime_sec {
    type: number
    sql: ${TABLE}.video_clearkey_playtime_sec ;;
  }

  dimension: power_total_cpu_time_sec {
    type: number
    sql: ${TABLE}.power_total_cpu_time_sec ;;
  }

  set: detail {
    fields: [
        submission_date,
  client_id,
  subsession_length_sec,
  engagement_time_sec,
  video_playtime_sec,
  video_hdr_playtime_sec,
  video_widevine_playtime_sec,
  video_encrypted_playtime_sec,
  video_clearkey_playtime_sec,
  power_total_cpu_time_sec
    ]
  }
}
