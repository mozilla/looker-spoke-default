include: "//looker-hub/firefox_ios/views/active_users_table.view.lkml"
include: "//looker-hub/firefox_ios/views/terms_of_use_status_table.view.lkml"


view: +active_users_table {

  # Hide metric columns showing as dimensions
  dimension: days_active_bits {
    hidden: yes
    sql: ${TABLE}.days_active_bits ;;
  }

  dimension: days_created_profile_bits {
    hidden: yes
    sql: ${TABLE}.days_created_profile_bits ;;
  }

  dimension: days_desktop_active_bits {
    hidden: yes
    sql: ${TABLE}.days_desktop_active_bits ;;
  }

  dimension: days_interacted_bits {
    hidden: yes
    sql: ${TABLE}.days_interacted_bits ;;
  }

  dimension: days_seen_bits {
    hidden: yes
    sql: ${TABLE}.days_seen_bits ;;
  }

  dimension: days_seen_session_end_bits {
    hidden: yes
    sql: ${TABLE}.days_seen_session_end_bits ;;
  }

  dimension: days_seen_session_start_bits {
    hidden: yes
    sql: ${TABLE}.days_seen_session_start_bits ;;
  }

  dimension: days_since_active {
    hidden: yes
    sql: ${TABLE}.days_since_active ;;
  }

  dimension: days_since_created_profile {
    hidden: yes
    sql: ${TABLE}.days_since_created_profile ;;
  }

  dimension: days_since_desktop_active {
    hidden: yes
    sql: ${TABLE}.days_since_desktop_active ;;
  }

  dimension: days_since_seen {
    hidden: yes
    sql: ${TABLE}.days_since_seen ;;
  }

  dimension: days_since_seen_session_end {
    hidden: yes
    sql: ${TABLE}.days_since_seen_session_end ;;
  }

  dimension: days_since_seen_session_start {
    hidden: yes
    sql: ${TABLE}.days_since_seen_session_start ;;
  }

  dimension: days_since_visited_1_uri {
    hidden: yes
    sql: ${TABLE}.days_since_visited_1_uri ;;
  }

  dimension: days_visited_1_uri_bits {
    hidden: yes
    sql: ${TABLE}.days_visited_1_uri_bits ;;
  }



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
  dimension: os_grouped {
    sql: ${TABLE}.os_grouped ;;
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

  dimension: country_segmentation {
    sql: CASE WHEN ${TABLE}.country in ('US', 'CA', 'GB', 'DE', 'FR', 'ES', 'IT', 'BR', 'MX', 'IN', 'ID', 'CN', 'RU') THEN ${TABLE}.country  ELSE 'ROW' END;;
    group_label: "Location"
  }

  dimension: city {
    hidden: yes
    sql: ${TABLE}.city ;;
    group_label: "Location"
  }

  dimension: is_dau {
    hidden: yes
    sql: ${TABLE}.is_dau ;;
  }

  dimension: is_wau {
    hidden: yes
    sql: ${TABLE}.is_wau ;;
  }
  dimension: is_mau {
    hidden: yes
    sql: ${TABLE}.is_mau ;;
  }


  dimension: locale {
    sql: ${TABLE}.locale ;;
    group_label: "Location"
  }

  dimension: tou_accepted {
    type: yesno
    sql: ${terms_of_use_status_table.client_id} IS NULL ;;
  }

  # Define measures for DAU, MAU, wau
  measure: daily_active_users {
    label: "DAU"
    type:  count_distinct
    sql: CASE WHEN ${TABLE}.is_dau THEN  ${TABLE}.client_id END;;
  }

  measure: weekly_active_users {
    label: "WAU"
    type: count_distinct
    sql:  CASE WHEN ${TABLE}.is_wau THEN  ${TABLE}.client_id END;;
  }

  measure: monthly_active_users {
    label: "MAU"
    type: count_distinct
    sql:  CASE WHEN ${TABLE}.is_mau THEN  ${TABLE}.client_id END;;
  }

  measure: tou_daily_active_users {
    label: "ToU DAU"
    type:  count_distinct
    sql: CASE WHEN ${terms_of_use_status_table.client_id} IS NOT NULL
      AND ${TABLE}.is_dau THEN  ${TABLE}.client_id END;;
  }

  measure: tou_weekly_active_users {
    label: "ToU WAU"
    type: count_distinct
    sql:  CASE WHEN ${terms_of_use_status_table.client_id} IS NOT NULL
      AND ${TABLE}.is_wau THEN  ${TABLE}.client_id END;;
  }

  measure: tou_monthly_active_users {
    label: "ToU MAU"
    type: count_distinct
    sql:  CASE WHEN ${terms_of_use_status_table.client_id} IS NOT NULL
      AND ${TABLE}.is_mau THEN  ${TABLE}.client_id END;;
  }

}
