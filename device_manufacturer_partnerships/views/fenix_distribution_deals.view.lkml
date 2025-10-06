include: "//looker-hub/device_manufacturer_partnerships/views/fenix_distribution_deals.view.lkml"

view: +fenix_distribution_deals {
    # defining measures
    measure: sum_dau {
        type: sum
        sql: ${TABLE}.dau ;;
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
    measure: sum_repeat_profile {
        type: sum
        sql: ${TABLE}.repeat_profile ;;
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
    measure: avg_average_ltv {
        type: average
        sql: ${TABLE}.average_ltv ;;
    }
    measure: count_new_profiles {
        type: count
        filters: [is_new_profile: "true"]
    }
    measure: count_existing_profiles {
        type: count
        filters: [is_new_profile: "false"]
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
}
