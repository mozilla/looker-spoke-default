include: "//looker-hub/combined_browser_metrics/views/firefox_desktop_baseline_active_users_aggregates.view.lkml"


view: +firefox_desktop_baseline_active_users_aggregates {

  # Group OS dimensions in Explore
  dimension: os {
    sql: ${TABLE}.os ;;
    group_label: "OS"
  }
  dimension: os_version {
    sql: ${TABLE}.os_version ;;
    group_label: "OS"
  }
  dimension: os_version_major {
    sql: ${TABLE}.os_version_major ;;
    group_label: "OS"
  }
  dimension: os_version_minor {
    sql: ${TABLE}.os_version_minor ;;
    group_label: "OS"
  }
  dimension: windows_build_number {
    sql: ${TABLE}.windows_build_number ;;
    group_label: "OS"
  }

  # Group app version dimensions in Explore
  dimension: app_version {
    sql: ${TABLE}.app_version ;;
    group_label: "App Version"
  }

  dimension: app_version_major {
    sql: ${TABLE}.app_version_major ;;
    group_label: "App Version"
  }

  dimension: app_version_minor {
    sql: ${TABLE}.app_version_minor ;;
    group_label: "App Version"
  }

  dimension: app_version_patch_revision {
    sql: ${TABLE}.app_version_patch_revision ;;
    group_label: "App Version"
  }

  dimension: app_version_is_major_release {
    sql: ${TABLE}.app_version_is_major_release ;;
    group_label: "App Version"
  }

  # Group location data
  dimension: country {
    sql: ${TABLE}.country ;;
    group_label: "Location"
  }
  dimension: city {
    sql: ${TABLE}.city ;;
    group_label: "Location"
  }
  dimension: locale {
    sql: ${TABLE}.locale ;;
    group_label: "Location"
  }


}
