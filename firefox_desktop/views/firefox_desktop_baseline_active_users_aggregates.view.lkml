include: "//looker-hub/firefox_desktop/views/firefox_desktop_baseline_active_users_aggregates.view.lkml"


view: +firefox_desktop_baseline_active_users_aggregates {

  #Hide is_default browser since always NULL
  dimension: is_default_browser {
    hidden: yes
    sql: ${TABLE}.is_default_browser ;;
  }

  # Hide metric columns showing as dimensions
  dimension: mau {
    hidden: yes
    sql: ${TABLE}.mau ;;
  }

  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }

  dimension: wau {
    hidden: yes
    sql: ${TABLE}.wau ;;
  }

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

  # Define measures for DAU, MAU, wau
  measure: daily_active_users {
    label: "DAU"
    type:  sum
    sql: (${TABLE}.dau) ;;
  }

  measure: weekly_active_users {
    label: "WAU"
    type: sum
    sql:  ${TABLE}.wau ;;
  }

  measure: monthly_active_users {
    label: "MAU"
    type: sum
    sql:  ${TABLE}.mau ;;
  }

}
