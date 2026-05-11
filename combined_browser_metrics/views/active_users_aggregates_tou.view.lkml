include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates_tou_mobile.view.lkml"

view: active_users_aggregates_tou {

  extends: [active_users_aggregates_tou_mobile]


  dimension: country_segmentation {
    description: "Normalizing country name to focus on major markets"
    type: string
    hidden: no
    sql: CASE WHEN ${country} in ('US','CA','GB','DE','FR','ES','IT','BR','MX','IN','ID','CN','RU') THEN ${country} ELSE "ROW" END ;;
  }

  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }

  dimension: wau {
    hidden: yes
    sql: ${TABLE}.wau ;;
  }

  dimension: mau {
    hidden: yes
    sql: ${TABLE}.mau ;;
  }

  dimension: weekly_users {
    hidden: yes
    sql: ${TABLE}.weekly_users ;;
  }

  dimension: monthly_users {
    hidden: yes
    sql: ${TABLE}.monthly_users ;;
  }

  dimension: daily_users {
    hidden: yes
    sql: ${TABLE}.daily_users ;;
  }

  dimension: tou_daily_active_users {
    hidden: yes
    sql: ${TABLE}.tou_daily_active_users ;;
  }

  dimension: tou_weekly_active_users {
    hidden: yes
    sql: ${TABLE}.tou_weekly_active_users ;;
  }

  dimension: tou_monthly_active_users {
    hidden: yes
    sql: ${TABLE}.tou_monthly_active_users ;;
  }

  # Measures become SUMs of the pre-aggregated columns
  measure: daily_active_users {
    label: "DAU"
    type: sum
    sql: ${TABLE}.dau ;;
  }


  measure: weekly_active_users {
    label: "WAU"
    type: sum
    sql: ${TABLE}.wau ;;
  }

  measure: monthly_active_users {
    label: "MAU"
    type: sum
    sql: ${TABLE}.mau ;;
  }

  measure: tou_dau {
    label: "ToU DAU"
    type: sum
    sql: ${TABLE}.tou_daily_active_users ;;
  }

  measure: tou_wau {
    label: "ToU WAU"
    type: sum
    sql: ${TABLE}.tou_weekly_active_users ;;
  }

  measure: tou_mau {
    label: "ToU MAU"
    type: sum
    sql: ${TABLE}.tou_monthly_active_users ;;
  }
}
