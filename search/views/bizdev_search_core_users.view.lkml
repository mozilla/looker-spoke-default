view: bizdev_search_core_users {
  derived_table: {
    sql: SELECT
           *
         FROM `mozdata.search.desktop_mobile_search_clients_monthly`
      ;;
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_month ;;
    type: time
    timeframes: [
      month,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: normalized_app_name {
    type: string
    sql: ${TABLE}.normalized_app_name ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: normalized_engine {
    type: string
    sql: ${TABLE}.normalized_engine ;;
  }

  dimension: ad_click_bucket {
    type: string
    sql:  CASE
              WHEN ${TABLE}.ad_click >= 10 THEN '10+ ad-clicks'
              WHEN ${TABLE}.ad_click > 0 THEN '1-9 ad-clicks'
              ELSE '0 ad-clicks'
          END ;;
  }

  dimension: days_of_use_bucket {
    type: string
    sql:  CASE
              WHEN days_of_use >= 21 THEN '21+ days'
              ELSE '1-20 days'
          END ;;
  }

  measure: searches {
    type: sum
    sql: ${TABLE}.searches ;;
  }

  measure: search_with_ads {
    type: sum
    sql: ${TABLE}.search_with_ads ;;
  }

  measure: ad_clicks {
    type: sum
    sql: ${TABLE}.ad_click ;;
  }

  measure: days_of_use {
    type: sum
    sql: ${TABLE}.days_of_use ;;
  }

  measure: clients {
    type: count_distinct
    sql: ${TABLE}.client_id ;;
  }

  measure: approx_clients {
    type: count_distinct
    approximate: yes
    sql: ${TABLE}.client_id ;;
  }

}
