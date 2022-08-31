view: crash_usage {
  sql_table_name: mozdata.telemetry.clients_daily ;;

  # We use a Looker Filter so we can apply it directly to both crash_usage and crash views.
  # Date filter predicate pushdown doesn't seem to be applied through the join (i.e.
  # when we filter on submission_date here, because we join on submission_date with
  # the crashes view, we would expect the predicate filter to apply there as well.
  # But BQ doesn't realize it's a predicate filter through the join, and fails the query
  # since we require one on these tables)
  filter: date {
    type: date
    default_value: "28 days"
    description: "Submission date (date that we received the associated crash or usage data from the client)."
  }

  filter: sample_id {
    type: number
    description: "Sample ID to filter on. Use this to speed up iterative analysis."
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: sample_id_dim {
    type: number
    sql: ${TABLE}.sample_id ;;
    hidden: yes
  }

  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
    description: "Submission date of the crash"
  }

  dimension_group: since_build_published   {
    type: duration
    sql_start: TIMESTAMP(${buildhub.publish_date}) ;;
    sql_end: TIMESTAMP(${submission_date}) ;;
    intervals: [day, week, month, quarter, year]
  }

  dimension: application_name {
    type: string
    sql: ${TABLE}.app_name ;;
    description: "Name of the application. Usually Firefox."
  }

  dimension: version {
    type: string
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).version ;;
    description: "The full version of the application, as a string."
    group_label: "Browser Version"
  }

  dimension: major_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).major_version ;;
    description: "The major version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: minor_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).minor_version ;;
    description: "The minor version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: patch_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).patch_version ;;
    description: "The patch version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: is_major_release {
    type: yesno
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).is_major_release ;;
    description: "Whether this was a major version release (*.*.0)."
    group_label: "Browser Version"
  }

  dimension: build_id {
    type: string
    sql: ${TABLE}.app_build_id ;;
    description: "Build ID."
  }

  dimension: os_name {
    type: string
    sql: CASE ${TABLE}.os
          WHEN "Darwin" THEN "Darwin"
          WHEN "Linux" THEN "Linux"
          WHEN "Windows_NT" THEN "Windows_NT"
          ELSE "Other" END;;
    description: "OS name, normalized to the top three (Windows_NT, Linux, or Darwin)."
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.normalized_os_version ;;
    description: "OS version."
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
    description: "Release channel for the associated installation."
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country ;;
    hidden: yes
  }

  dimension: active_hours_sum {
    type: number
    sql: LEAST(${TABLE}.active_hours_sum, 24) ;;  # Filter out too-large values for active hours
    description: "Total active hours for this client on this day, derived from active tickets (see the probe dictionary for details)."
  }

  measure: client_count {
    type: count_distinct
    sql: ${client_id} ;;
    description: "Count of unique profiles."
  }

  measure: active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    description: "Total active hours, derived from active ticks (see the probe dictionary for details)."
  }

  measure: main_crashes {
    type: sum
    sql: ${crashes_daily.main_crash_count} ;;
    group_label: "Crash Count"
    group_item_label: "Main Process"
    description: "Total count of Main crashes."
  }

  measure: main_crash_active_hours {
    type: number
    sql: SUM(IF(crashes_daily.main_crash_count > 0, ${active_hours}, 0)) ;;
    hidden: yes
  }

  measure: main_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${main_crashes}, ${active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Main Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: main_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(COUNTIF(${crashes_daily.main_crash_count} > 0), COUNT(${client_id})) ;;
    group_label: "Crash Incidence"
    group_item_label: "Main Process"
    description: "Proportion of DAU that experience a main crash."
  }

  measure: content_crashes {
    type: sum
    sql: ${crashes_daily.content_crash_count} ;;
    group_label: "Crash Count"
    group_item_label: "Content Process"
    description: "Total count of content crashes."
  }

  measure: content_crash_active_hours {
    type: number
    sql: SUM(IF(crashes_daily.content_crash_count > 0, ${active_hours}, 0)) ;;
    hidden: yes
  }

  measure: content_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${content_crashes}, ${active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Content Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: content_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(COUNTIF(${crashes_daily.content_crash_count} > 0), COUNT(${client_id})) ;;
    group_label: "Crash Incidence"
    group_item_label: "Content Process"
    description: "Proportion of DAU that experience a content crash."
  }

  measure: gpu_crashes {
    type: sum
    sql: ${crashes_daily.gpu_crash_count} ;;
    group_label: "Crash Count"
    group_item_label: "Gpu Process"
    description: "Total count of gpu crashes."
  }

  measure: gpu_crash_active_hours {
    type: number
    sql: SUM(IF(crashes_daily.gpu_crash_count > 0, ${active_hours}, 0)) ;;
    hidden: yes
  }

  measure: gpu_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${gpu_crashes}, ${active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Gpu Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: gpu_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(COUNTIF(${crashes_daily.gpu_crash_count} > 0), COUNT(${client_id})) ;;
    group_label: "Crash Incidence"
    group_item_label: "Gpu Process"
    description: "Proportion of DAU that experience a gpu crash."
  }

  measure: socket_crashes {
    type: sum
    sql: ${crashes_daily.socket_crash_count} ;;
    group_label: "Crash Count"
    group_item_label: "Socket Process"
    description: "Total count of socket crashes."
  }

  measure: socket_crash_active_hours {
    type: number
    sql: SUM(IF(crashes_daily.socket_crash_count > 0, ${active_hours}, 0)) ;;
    hidden: yes
  }

  measure: socket_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${socket_crashes}, ${active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Socket Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: rdd_crashes {
    type: sum
    sql: ${crashes_daily.rdd_crash_count} ;;
    group_label: "Crash Count"
    group_item_label: "Rdd Process"
    description: "Total count of rdd crashes."
  }

  measure: rdd_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(COUNTIF(${crashes_daily.rdd_crash_count} > 0), COUNT(${client_id})) ;;
    group_label: "Crash Incidence"
    group_item_label: "Rdd Process"
    description: "Proportion of DAU that experience a rdd crash."
  }

  measure: rdd_crash_active_hours {
    type: number
    sql: SUM(IF(crashes_daily.rdd_crash_count > 0, ${active_hours}, 0)) ;;
    hidden: yes
  }

  measure: rdd_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${rdd_crashes}, ${active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Rdd Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: utility_crashes {
    type: sum
    sql: ${crashes_daily.utility_crash_count} ;;
    group_label: "Crash Count"
    group_item_label: "Utility Process"
    description: "Total count of utility crashes."
  }

  measure: utility_crash_active_hours {
    type: number
    sql: SUM(IF(crashes_daily.utility_crash_count > 0, ${active_hours}, 0)) ;;
    hidden: yes
  }

  measure: utility_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${utility_crashes}, ${active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Utility Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: utility_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(COUNTIF(${crashes_daily.utility_crash_count} > 0), COUNT(${client_id})) ;;
    group_label: "Crash Incidence"
    group_item_label: "Utility Process"
    description: "Proportion of DAU that experience a utility crash."
  }

  measure: vr_crashes {
    type: sum
    sql: ${crashes_daily.vr_crash_count} ;;
    group_label: "Crash Count"
    group_item_label: "VR Process"
    description: "Total count of vr crashes."
  }

  measure: vr_crash_active_hours {
    type: number
    sql: SUM(IF(crashes_daily.vr_crash_count > 0, ${active_hours}, 0)) ;;
    hidden: yes
  }

  measure: vr_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${vr_crashes}, ${active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "VR Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: vr_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(COUNTIF(${crashes_daily.vr_crash_count} > 0), COUNT(${client_id})) ;;
    group_label: "Crash Incidence"
    group_item_label: "VR Process"
    description: "Proportion of DAU that experience a vr crash."
  }

}

view: buildhub {
  derived_table: {
    sql:
      SELECT
          build.target.version,
          build.target.channel,
          MIN(build.download.date) AS publish_date
      FROM
        mozdata.telemetry.buildhub2
      GROUP BY
        build.target.version,
        build.target.channel
    ;;
  }

  dimension: version {
    description: "The build version."
  }

  dimension: channel {
    description: "The build channel"
  }

  dimension: publish_date {
    description: "Date this build was published. May not be the date it was released."
  }
}
