view: crash_usage {
  sql_table_name: `moz-fx-data-shared-prod`.telemetry_derived.clients_daily_joined_v1 ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: ten_percent_sample {
    type: yesno
    sql: ${sample_id} < 10 ;;
    description: "Is part of the ten percent sample?"
  }

  dimension: sample_id {
    type: number
    sql: ${TABLE}.sample_id ;;
    hidden: yes
  }

  dimension: submission_date {
    type: date
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP);;
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
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).patch_revision ;;
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

  dimension: build_id_as_int {
    type: number
    sql: CAST(${TABLE}.app_build_id AS INTEGER) ;;
    description: "Build ID, as an int. Useful for sorting."
  }

  dimension: os_name {
    type: string
    sql: CASE ${TABLE}.os
          WHEN "Darwin" THEN "Darwin"
          WHEN "Linux" THEN "Linux"
          WHEN "Windows_NT" THEN "Windows_NT"
          ELSE "Other" END;;
    suggestions: ["Darwin", "Linux", "Windows_NT", "Other"]
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
    suggestions: ["release", "beta", "nightly", "esr", "aurora", "Other"]
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

  measure: dau_count {
    type: count
    description: "Count of unique Daily Active Users (DAU)."
  }

  measure: active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    description: "Total active hours, derived from active ticks (see the probe dictionary for details)."
  }

  dimension: main_crash_count {
    type: number
    sql: ${TABLE}.main_crash_count ;;
    group_label: "Client Crash Count"
    group_item_label: "Main Process"
    description: "Number of Main crashes by a single client. Filter on this field to remove clients with large numbers of crashes."
  }

  measure: main_crashes {
    type: sum
    sql: ${main_crash_count} ;;
    group_label: "Total Crash Count"
    group_item_label: "Main Process"
    description: "Total count of Main crashes."
  }

  measure: main_crash_active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    filters: [
      main_crash_count: ">0"
    ]
    #hidden: yes
  }

  measure: main_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${main_crashes}, ${main_crash_active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Main Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: main_crash_dau_count {
    type: count
    group_label: "Crashed DAU"
    group_item_label: "Main Process"
    description: "Number of DAU who experienced at least one Main crash"
    filters: [
      main_crash_count: ">0"
    ]
  }

  measure: main_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(${main_crash_dau_count}, ${dau_count}) ;;
    group_label: "Crash Incidence"
    group_item_label: "Main Process"
    description: "Proportion of DAU that experience a Main crash."
  }

  dimension: content_crash_count {
    type: number
    sql: ${TABLE}.content_crash_count ;;
    group_label: "Client Crash Count"
    group_item_label: "Content Process"
    description: "Number of Content crashes by a single client. Filter on this field to remove clients with large numbers of crashes."
  }

  measure: content_crashes {
    type: sum
    sql: ${content_crash_count} ;;
    group_label: "Total Crash Count"
    group_item_label: "Content Process"
    description: "Total count of Content crashes."
  }

  measure: content_crash_active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    filters: [
      content_crash_count: ">0"
    ]
    hidden: yes
  }

  measure: content_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${content_crashes}, ${content_crash_active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Content Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: content_crash_dau_count {
    type: count
    group_label: "Crashed DAU"
    group_item_label: "Content Process"
    description: "Number of DAU who experienced at least one Content crash"
    filters: [
      content_crash_count: ">0"
    ]
  }

  measure: content_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(${content_crash_dau_count}, ${dau_count}) ;;
    group_label: "Crash Incidence"
    group_item_label: "Content Process"
    description: "Proportion of DAU that experience a Content crash."
  }

  dimension: gpu_crash_count {
    type: number
    sql: ${TABLE}.gpu_crash_count ;;
    group_label: "Client Crash Count"
    group_item_label: "GPU Process"
    description: "Number of GPU crashes by a single client. Filter on this field to remove clients with large numbers of crashes."
  }

  measure: gpu_crashes {
    type: sum
    sql: ${gpu_crash_count} ;;
    group_label: "Total Crash Count"
    group_item_label: "GPU Process"
    description: "Total count of GPU crashes."
  }

  measure: gpu_crash_active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    filters: [
      gpu_crash_count: ">0"
    ]
    hidden: yes
  }

  measure: gpu_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${gpu_crashes}, ${gpu_crash_active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "GPU Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: gpu_crash_dau_count {
    type: count
    group_label: "Crashed DAU"
    group_item_label: "GPU Process"
    description: "Number of DAU who experienced at least one GPU crash"
    filters: [
      gpu_crash_count: ">0"
    ]
  }

  measure: gpu_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(${gpu_crash_dau_count}, ${dau_count}) ;;
    group_label: "Crash Incidence"
    group_item_label: "GPU Process"
    description: "Proportion of DAU that experience a GPU crash."
  }

  dimension: rdd_crash_count {
    type: number
    sql: ${TABLE}.rdd_crash_count ;;
    group_label: "Client Crash Count"
    group_item_label: "RDD Process"
    description: "Number of RDD crashes by a single client. Filter on this field to remove clients with large numbers of crashes."
  }

  measure: rdd_crashes {
    type: sum
    sql: ${rdd_crash_count} ;;
    group_label: "Total Crash Count"
    group_item_label: "RDD Process"
    description: "Total count of RDD crashes."
  }

  measure: rdd_crash_active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    filters: [
      rdd_crash_count: ">0"
    ]
    hidden: yes
  }

  measure: rdd_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${rdd_crashes}, ${rdd_crash_active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "RDD Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: rdd_crash_dau_count {
    type: count
    group_label: "Crashed DAU"
    group_item_label: "RDD Process"
    description: "Number of DAU who experienced at least one RDD crash"
    filters: [
      rdd_crash_count: ">0"
    ]
  }

  measure: rdd_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(${rdd_crash_dau_count}, ${dau_count}) ;;
    group_label: "Crash Incidence"
    group_item_label: "RDD Process"
    description: "Proportion of DAU that experience a RDD crash."
  }

  dimension: socket_crash_count {
    type: number
    sql: ${TABLE}.socket_crash_count ;;
    group_label: "Client Crash Count"
    group_item_label: "Socket Process"
    description: "Number of Socket crashes by a single client. Filter on this field to remove clients with large numbers of crashes."
  }

  measure: socket_crashes {
    type: sum
    sql: ${socket_crash_count} ;;
    group_label: "Total Crash Count"
    group_item_label: "Socket Process"
    description: "Total count of Socket crashes."
  }

  measure: socket_crash_active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    filters: [
      socket_crash_count: ">0"
    ]
    hidden: yes
  }

  measure: socket_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${socket_crashes}, ${socket_crash_active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Socket Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: socket_crash_dau_count {
    type: count
    group_label: "Crashed DAU"
    group_item_label: "Socket Process"
    description: "Number of DAU who experienced at least one Socket crash"
    filters: [
      socket_crash_count: ">0"
    ]
  }

  measure: socket_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(${socket_crash_dau_count}, ${dau_count}) ;;
    group_label: "Crash Incidence"
    group_item_label: "Socket Process"
    description: "Proportion of DAU that experience a Socket crash."
  }

  dimension: utility_crash_count {
    type: number
    sql: ${TABLE}.utility_crash_count ;;
    group_label: "Client Crash Count"
    group_item_label: "Utility Process"
    description: "Number of Utility crashes by a single client. Filter on this field to remove clients with large numbers of crashes."
  }

  measure: utility_crashes {
    type: sum
    sql: ${utility_crash_count} ;;
    group_label: "Total Crash Count"
    group_item_label: "Utility Process"
    description: "Total count of Utility crashes."
  }

  measure: utility_crash_active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    filters: [
      utility_crash_count: ">0"
    ]
    hidden: yes
  }

  measure: utility_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${utility_crashes}, ${utility_crash_active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "Utility Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: utility_crash_dau_count {
    type: count
    group_label: "Crashed DAU"
    group_item_label: "Utility Process"
    description: "Number of DAU who experienced at least one Utility crash"
    filters: [
      utility_crash_count: ">0"
    ]
  }

  measure: utility_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(${utility_crash_dau_count}, ${dau_count}) ;;
    group_label: "Crash Incidence"
    group_item_label: "Utility Process"
    description: "Proportion of DAU that experience a Utility crash."
  }

  dimension: vr_crash_count {
    type: number
    sql: ${TABLE}.vr_crash_count ;;
    group_label: "Client Crash Count"
    group_item_label: "VR Process"
    description: "Number of VR crashes by a single client. Filter on this field to remove clients with large numbers of crashes."
  }

  measure: vr_crashes {
    type: sum
    sql: ${vr_crash_count} ;;
    group_label: "Total Crash Count"
    group_item_label: "VR Process"
    description: "Total count of vr crashes."
  }

  measure: vr_crash_active_hours {
    type: sum
    sql: ${active_hours_sum} ;;
    filters: [
      vr_crash_count: ">0"
    ]
    hidden: yes
  }

  measure: vr_crash_rate {
    type: number
    sql: SAFE_DIVIDE(${vr_crashes}, ${vr_crash_active_hours}) ;;
    group_label: "Crash Rate"
    group_item_label: "VR Process"
    description: "Total crashes, divided by number of usages hours of those who crashed (not overall)."
  }

  measure: vr_crash_dau_count {
    type: count
    group_label: "Crashed DAU"
    group_item_label: "VR Process"
    description: "Number of DAU who experienced at least one VR crash"
    filters: [
      vr_crash_count: ">0"
    ]
  }

  measure: vr_crash_incidence {
    type: number
    sql: SAFE_DIVIDE(${vr_crash_dau_count}, ${dau_count}) ;;
    group_label: "Crash Incidence"
    group_item_label: "VR Process"
    description: "Proportion of DAU that experience a vr crash."
  }
}

view: buildhub {
  derived_table: {
    sql:
      SELECT
          IF(
            -- Only nightly builds report the full version (with suffixes, e.g. 119.0.1a2)
            -- Beta & friends just report the major.minor.patch
            -- (Note: In telemetry)
            build.target.channel = 'nightly',
            build.target.version,
            REGEXP_EXTRACT(build.target.version, r"(^\d+\.\d+(?:\.\d+)?)")
          ) AS version,
          build.target.channel,
          MIN(build.download.date) AS publish_date,
      FROM
          mozdata.telemetry.buildhub2
      GROUP BY
          version,
          channel
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
