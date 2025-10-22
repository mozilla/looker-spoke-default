include: "//looker-hub/device_manufacturer_partnerships/views/fenix_distribution_deals.view.lkml"

view: +fenix_distribution_deals {
    # defining measures
    measure: sum_dau {
        type: sum
        sql: ${TABLE}.dau ;;
    }

    measure: days_in_query {
      type: number
      sql: DATE_DIFF(MAX(${TABLE}.submission_date), MIN(${TABLE}.submission_date), DAY) ;;

    }

    measure: avg_dau {
      type: number
      sql: SAFE_DIVIDE(SUM(${TABLE}.dau), ${days_in_query}) ;;
    }

    measure: sum_wau {
        type: sum
        sql: ${TABLE}.wau ;;
    }
    measure: sum_mau {
        type: sum
        sql: ${TABLE}.mau ;;
    }
    measure: sum_client_count {
        type: sum
        sql: ${TABLE}.client_count ;;
    }
    measure: sum_default_browser_count {
        type: sum
        sql: ${TABLE}.default_browser_count ;;
    }

    measure: pct_dau_default_browser {
        type: number
        sql: SAFE_DIVIDE(${sum_default_browser_count}, ${sum_dau}) ;;
        value_format_name: percent_2
    }

    measure: sum_dma_count {
        type: sum
        sql: ${TABLE}.dma_count ;;
    }
    measure: sum_retained_week_4 {
        type: sum
        sql: ${TABLE}.retained_week_4 ;;
    }
    measure: sum_retained_week_4_new_profile {
        type: sum
        sql: ${TABLE}.retained_week_4_new_profile ;;
    }

    measure: retention_rate {
        type: number
        sql: SAFE_DIVIDE(${sum_retained_week_4}, ${sum_active_metric_date});;
        value_format_name: percent_2
    }

    measure: new_profile_retention_rate {
        type: number
        sql: SAFE_DIVIDE(${sum_retained_week_4_new_profile}, ${sum_new_profile_metric_date}) ;;
        value_format_name: percent_2
    }

    measure: sum_repeat_profile {
        type: sum
        sql: ${TABLE}.repeat_profile ;;
    }
    measure: sum_new_profile_metric_date {
        type: sum
        sql: ${TABLE}.new_profile_metric_date ;;
    }
    measure: sum_active_metric_date {
        type: sum
        sql: ${TABLE}.active_metric_date ;;
    }
    measure: sum_organic {
        type: sum
        sql: ${TABLE}.organic ;;
    }
    measure: sum_ad_click {
        type: sum
        sql: ${TABLE}.ad_click ;;
    }
    measure: sum_search_count {
        type: sum
        sql: ${TABLE}.search_count ;;
    }
    measure: sum_search_with_ads {
        type: sum
        sql: ${TABLE}.search_with_ads ;;
    }
    measure: sum_tagged_follow_on {
        type: sum
        sql: ${TABLE}.tagged_follow_on ;;
    }
    measure: sum_tagged_sap {
        type: sum
        sql: ${TABLE}.tagged_sap ;;
    }
    measure: sum_total_ltv {
        type: sum
        sql: ${TABLE}.total_ltv ;;
    }


    measure: sum_total_ltv_at_max_lrd {
      type: sum
      sql: IF(
        ${TABLE}.last_reported_date = MAX(${TABLE}.last_reported_date) OVER (),
        ${TABLE}.total_ltv,
        0
      ) ;;
    }
    measure: sum_client_count_at_max_lrd {
      type: sum
      sql: IF(
        ${TABLE}.last_reported_date = MAX(${TABLE}.last_reported_date) OVER (),
        ${TABLE}.client_count,
        0
      ) ;;
    }

    measure: ltv {
      type: number
      sql: SAFE_DIVIDE(${sum_total_ltv_at_max_lrd}, ${sum_client_count_at_max_lrd}) ;;
      value_format: "$0.000"
    }

    measure: sum_new_profile_count {
        type: sum
        sql: ${TABLE}.new_profile_count ;;
    }
    measure: sum_existing_profile_count {
        type: sum
        sql: ${TABLE}.existing_profile_count ;;
    }
    measure: sum_dau_with_search_count {
        type: sum
        sql: ${TABLE}.dau_with_search_count ;;
    }
    measure: sum_dau_with_ad_clicks_count {
        type: sum
        sql: ${TABLE}.dau_with_ad_clicks_count ;;
    }

    measure: avg_searches_per_search_dau {
        type: number
        sql: SAFE_DIVIDE(${sum_search_count}, ${sum_dau_with_search_count}) ;;
    }

    measure: ad_clicks_per_search_dau {
        type: number
        sql: SAFE_DIVIDE(${sum_ad_click}, ${sum_dau_with_search_count}) ;;
    }

    measure: pct_dau_with_ad_clicks {
        type: number
        sql: SAFE_DIVIDE(${sum_dau_with_ad_clicks_count}, ${sum_dau}) ;;
        value_format_name: percent_2
    }

    measure: avg_daily_searches_per_search_dau {
      type: number
      sql: SAFE_DIVIDE(${sum_search_count}, ${sum_dau_with_search_count})/${days_in_query} ;;
    }

    # hiding dimensions
    dimension: dau {
        hidden: yes
    }
    dimension: wau {
        hidden: yes
    }
    dimension: mau {
        hidden: yes
    }
    dimension: client_count {
        hidden: yes
    }
    dimension: default_browser_count {
        hidden: yes
    }
    dimension: dma_count {
        hidden: yes
    }
    dimension: retained_week_4 {
        hidden: yes
    }
    dimension: retained_week_4_new_profile {
        hidden: yes
    }
    dimension: repeat_profile {
        hidden: yes
    }
    dimension: organic {
        hidden: yes
    }
    dimension: ad_click {
        hidden: yes
    }
    dimension: search_count {
        hidden: yes
    }
    dimension: search_with_ads {
        hidden: yes
    }
    dimension: tagged_follow_on {
        hidden: yes
    }
    dimension: tagged_sap {
        hidden: yes
    }
    dimension: total_ltv {
        hidden: yes
    }
    dimension: average_ltv {
        hidden: yes
    }
    dimension: new_profile_metric_date {
        hidden: yes
    }
    dimension: active_metric_date {
        hidden: yes
    }


}
