include: "../views/crash_usage.view.lkml"
include: "/shared/views/countries.view.lkml"

datagroup: clients_daily_joined_partitions {
  max_cache_age: "24 hours"
  sql_trigger:
    SELECT MAX(last_modified_time)
    FROM `moz-fx-data-shared-prod`.telemetry_derived.INFORMATION_SCHEMA.PARTITIONS
    WHERE table_name = "clients_daily_joined_v1" ;;
  label: "Clients Daily Joined Partitions"
  description: "Updates when new partitions are added to clients_daily_joined"
}

explore: crash_usage {
  label: "Crashes"
  description: "Crash counts for Desktop Firefox, derived from the crash ping."
  persist_with: clients_daily_joined_partitions

  join: buildhub {
    sql_on: ${crash_usage.version} = ${buildhub.version} AND ${crash_usage.channel} = ${buildhub.channel} ;;
    relationship: many_to_one
    fields: []
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${crash_usage.country_code} = ${countries.code} ;;
  }

  sql_always_where: ${crash_usage.submission_date} >= "2021-01-01" ;;

  always_filter: {
    filters: [
      crash_usage.submission_date: "3 month",
      crash_usage.ten_percent_sample: "Yes"
    ]
  }

  aggregate_table: ten_percent_daily_rollups {
    query: {
      dimensions: [
        submission_date,
        version,
        major_version,
        minor_version,
        patch_version,
        os_name,
        channel,
        days_since_build_published,
      ]
      measures: [
        active_hours,
        dau_count,
        content_crash_rate,
        content_crashes,
        content_crash_incidence,
        gpu_crash_rate,
        gpu_crashes,
        gpu_crash_incidence,
        main_crash_rate,
        main_crashes,
        main_crash_incidence,
        rdd_crash_rate,
        rdd_crashes,
        rdd_crash_incidence,
        socket_crash_incidence,
        socket_crash_rate,
        socket_crashes,
        utility_crash_incidence,
        utility_crash_rate,
        utility_crashes,
        vr_crash_rate,
        vr_crashes,
        vr_crash_incidence,
      ]
      filters: [
        crash_usage.days_since_build_published: "<=56",
        crash_usage.ten_percent_sample: "Yes",
      ]
    }
    materialization: {
      datagroup_trigger: clients_daily_joined_partitions
      increment_key: "submission_date"
    }
  }

  aggregate_table: ten_percent_build_id_rollups {
    query: {
      dimensions: [
        build_id,
        build_id_as_int,
        channel,
        os_name,
        days_since_build_published,
      ]
      measures: [
        active_hours,
        content_crash_rate,
        gpu_crash_rate,
        main_crash_rate,
        rdd_crash_rate,
        socket_crash_rate,
        utility_crash_rate,
        vr_crash_rate,
      ]
      filters: [
        crash_usage.submission_date: "3 month",
        crash_usage.days_since_build_published: "<=56",
        crash_usage.ten_percent_sample: "Yes",
      ]
    }

    materialization: {
      sql_trigger_value:
        SELECT MAX(last_modified_time)
        FROM `moz-fx-data-shared-prod`.telemetry_derived.INFORMATION_SCHEMA.PARTITIONS
        WHERE table_name = "clients_daily_joined_v1" ;;
    }
  }

  aggregate_table: full_nightly_daily_rollups {
    query: {
      dimensions: [
        submission_date,
        version,
        major_version,
        minor_version,
        patch_version,
        os_name,
        days_since_build_published,
      ]
      measures: [
        active_hours,
        dau_count,
        content_crash_rate,
        content_crashes,
        content_crash_incidence,
        gpu_crash_rate,
        gpu_crashes,
        gpu_crash_incidence,
        main_crash_rate,
        main_crashes,
        main_crash_incidence,
        rdd_crash_rate,
        rdd_crashes,
        rdd_crash_incidence,
        socket_crash_incidence,
        socket_crash_rate,
        socket_crashes,
        utility_crash_incidence,
        utility_crash_rate,
        utility_crashes,
        vr_crash_rate,
        vr_crashes,
        vr_crash_incidence,
      ]
      filters: [
        crash_usage.days_since_build_published: "<=56",
        crash_usage.ten_percent_sample: "No",
        crash_usage.channel: "nightly"
      ]
    }
    materialization: {
      datagroup_trigger: clients_daily_joined_partitions
      increment_key: "submission_date"
    }
  }

  aggregate_table: full_nightly_buildid_rollups {
    query: {
      dimensions: [
        build_id,
        build_id_as_int,
        channel,
        os_name,
        days_since_build_published,
      ]
      measures: [
        active_hours,
        content_crash_rate,
        gpu_crash_rate,
        main_crash_rate,
        rdd_crash_rate,
        socket_crash_rate,
        utility_crash_rate,
        vr_crash_rate,
      ]
      filters: [
        crash_usage.submission_date: "3 month",
        crash_usage.days_since_build_published: "<=56",
        crash_usage.ten_percent_sample: "No",
        crash_usage.channel: "nightly"
      ]
    }

    materialization: {
      datagroup_trigger: clients_daily_joined_partitions
    }
  }


  aggregate_table: full_beta_daily_rollups {
    query: {
      dimensions: [
        submission_date,
        version,
        major_version,
        minor_version,
        patch_version,
        os_name,
        days_since_build_published,
      ]
      measures: [
        active_hours,
        dau_count,
        content_crash_rate,
        content_crashes,
        content_crash_incidence,
        gpu_crash_rate,
        gpu_crashes,
        gpu_crash_incidence,
        main_crash_rate,
        main_crashes,
        main_crash_incidence,
        rdd_crash_rate,
        rdd_crashes,
        rdd_crash_incidence,
        socket_crash_incidence,
        socket_crash_rate,
        socket_crashes,
        utility_crash_incidence,
        utility_crash_rate,
        utility_crashes,
        vr_crash_rate,
        vr_crashes,
        vr_crash_incidence,
      ]
      filters: [
        crash_usage.days_since_build_published: "<=56",
        crash_usage.ten_percent_sample: "No",
        crash_usage.channel: "beta"
      ]
    }
    materialization: {
      datagroup_trigger: clients_daily_joined_partitions
      increment_key: "submission_date"
    }
  }

  aggregate_table: full_beta_buildid_rollups {
    query: {
      dimensions: [
        build_id,
        build_id_as_int,
        channel,
        os_name,
        days_since_build_published,
      ]
      measures: [
        active_hours,
        content_crash_rate,
        gpu_crash_rate,
        main_crash_rate,
        rdd_crash_rate,
        socket_crash_rate,
        utility_crash_rate,
        vr_crash_rate,
      ]
      filters: [
        crash_usage.submission_date: "3 month",
        crash_usage.days_since_build_published: "<=56",
        crash_usage.ten_percent_sample: "No",
        crash_usage.channel: "beta"
      ]
    }

    materialization: {
      datagroup_trigger: clients_daily_joined_partitions
    }
  }
}
