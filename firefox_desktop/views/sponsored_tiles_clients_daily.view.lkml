# include: "//looker-hub/firefox_desktop/views/*"

# view: +sponsored_tiles_clients_daily {
view: sponsored_tiles_clients_daily_temp {

  sql_table_name: `mozdata.analysis.sponsored_tiles_clients_daily` ;;

  dimension: browser_version_info__is_major_release {
    sql: ${TABLE}.browser_version_info.is_major_release ;;
    type: yesno
    group_label: "Browser Version Info"
    group_item_label: "Is Major Release"
  }

  dimension: browser_version_info__major_version {
    sql: ${TABLE}.browser_version_info.major_version ;;
    type: number
    group_label: "Browser Version Info"
    group_item_label: "Major Version"
  }

  dimension: browser_version_info__minor_version {
    sql: ${TABLE}.browser_version_info.minor_version ;;
    type: number
    group_label: "Browser Version Info"
    group_item_label: "Minor Version"
  }

  dimension: browser_version_info__patch_revision {
    sql: ${TABLE}.browser_version_info.patch_revision ;;
    type: number
    group_label: "Browser Version Info"
    group_item_label: "Patch Revision"
  }

  dimension: browser_version_info__version {
    sql: ${TABLE}.browser_version_info.version ;;
    type: string
    group_label: "Browser Version Info"
    group_item_label: "Version"
  }

  dimension: client_id {
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
    map_layer_name: countries
  }

  dimension: device {
    sql: ${TABLE}.device ;;
    type: string
  }

  dimension: experiments {
    sql: ${TABLE}.experiments ;;
    hidden: yes
  }

  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
  }

  dimension: normalized_channel {
    sql: ${TABLE}.normalized_channel ;;
    type: string
  }

  dimension: normalized_os {
    sql: ${TABLE}.normalized_os ;;
    type: string
  }

  dimension: profile_age_in_days {
    sql: ${TABLE}.profile_age_in_days ;;
    type: number
  }

  dimension: sample_id {
    sql: ${TABLE}.sample_id ;;
    type: number
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  measure: distinct_client_count {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.client_id) ;;
  }

  dimension: sponsored_tiles_enabled_at_startup {
    description: "Only available for Android. Must filter to Android to avoid overinflated disable counts."
    sql:${TABLE}.sponsored_tiles_enabled_at_startup ;;
    type: yesno
  }

  measure: sponsored_tiles_impression {
    type: number
    sql: SUM(${TABLE}.sponsored_tiles_impression_count) ;;
  }

  measure: sponsored_tiles_click {
    type: number
    sql: SUM(${TABLE}.sponsored_tiles_click_count) ;;
  }

  measure: sponsored_tiles_disable {
    type: number
    sql: SUM(${TABLE}.sponsored_tiles_disable_count) ;;
  }

  measure: sponsored_tiles_dismissal {
    type: number
    description: "Only available for desktop."
    sql: SUM(${TABLE}.sponsored_tiles_dismissal_count) ;;
  }

}

view: sponsored_tiles_clients_daily_temp__experiments {
  dimension: key {
    sql: ${TABLE}.key ;;
    type: string
  }

  dimension: value {
    sql: ${TABLE}.value ;;
    type: string
  }
}
