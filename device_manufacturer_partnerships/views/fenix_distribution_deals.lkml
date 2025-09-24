include: "//looker-hub/device_manufacturer_partnerships/views/fenix_distribution_deals"

view: +fenix_distribution_deals {
    # defining measures
    measure: dau {
        type: sum
        sql: ${TABLE}.dau ;;
    }
    measure: wau {
        type: sum
        sql: ${TABLE}.wau ;;
    }
    measure: mau {
        type: sum
        sql: ${TABLE}.mau ;;
    }
    measure: client_count {
        type: sum
        sql: ${TABLE}.client_count ;;
    }
    measure: default_browser_count {
        type: sum
        sql: ${TABLE}.default_browser_count ;;
    }
    measure: dma_count {
        type: sum
        sql: ${TABLE}.dma_count ;;
    }
    measure: retained_week_4 {
        type: sum
        sql: ${TABLE}.retained_week_4 ;;
    }
    measure: retained_week_4_new_profile {
        type: sum
        sql: ${TABLE}.retained_week_4_new_profile ;;
    }
    measure: repeat_profile {
        type: sum
        sql: ${TABLE}.repeat_profile ;;
    }
    measure: organic {
        type: sum
        sql: ${TABLE}.organic ;;
    }
    measure: ad_click {
        type: sum
        sql: ${TABLE}.ad_click ;;
    }
    measure: search_count {
        type: sum
        sql: ${TABLE}.search_count ;;
    }
    measure: search_with_ads {
        type: sum
        sql: ${TABLE}.search_with_ads ;;
    }
    measure: tagged_follow_on {
        type: sum
        sql: ${TABLE}.tagged_follow_on ;;
    }
    measure: tagged_sap {
        type: sum
        sql: ${TABLE}.tagged_sap ;;
    }
    measure: total_ltv {
        type: sum
        sql: ${TABLE}.total_ltv ;;
    }
    measure: average_ltv {
        type: average
        sql: ${TABLE}.average_ltv ;;
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
