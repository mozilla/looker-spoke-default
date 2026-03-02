include: "//looker-hub/websites/explores/semrush_domain_overview.explore.lkml"


view: +semrush_domain_overview {

  dimension: device_type {
    type: string
    description: "Mobile or Desktop, derived from the database field"
    sql: CASE
      WHEN ${database} LIKE 'mobile%' THEN 'mobile'
      ELSE 'desktop'
    END ;;
  }

  measure: avgerage_rank {
    type: average
    sql: ${rank} ;;
    value_format_name: decimal_0
  }

dimension: country_code {
type: string
sql: UPPER(REPLACE(${database}, 'mobile-', '')) ;;
description: "Normalized country code with mobile prefix removed, used for joining to countries table"
}

  dimension: country_tier {
    type: string
    sql: CASE
      WHEN ${marketing_country_tier_mapping.tier} = 'Tier 1' THEN 'Core'
      WHEN ${marketing_country_tier_mapping.tier} = 'Tier 2' THEN 'Growth'
      ELSE 'Emerging'
    END ;;
    description: "Country tier: Core (Tier 1), Growth (Tier 2), Emerging (Tier 3 or unmatched)"
  }




  measure: ai_overview_presence_ratio {
    type: number
    description: "Ratio of AI Overview features where domain appears (FP52) to AI Overview features triggered by ranked keywords (FK52). A high ratio indicates strong presence in AI Overview; a low ratio signals potential visibility loss."
    sql: SAFE_DIVIDE(${total_fp_ai_overview}, ${total_fk_ai_overview}) ;;
    value_format_name: percent_1
  }

  dimension: organic_traffic {
    hidden: yes
  }
  measure: total_organic_traffic {
    type: sum
    sql: ${TABLE}.organic_traffic ;;
    description: "Traffic brought to a website via Google top 100 organic search results"
  }

  dimension: organic_keywords {
    hidden: yes
  }
  measure: total_organic_keywords {
    type: sum
    sql: ${TABLE}.organic_keywords ;;
    description: "Keywords that bring users to a website via Google top 100 organic search results"
  }

  dimension: organic_cost {
    hidden: yes
  }
  measure: total_organic_cost {
    type: sum
    sql: ${TABLE}.organic_cost ;;
    description: "Estimated price of organic keywords in Google Ads"
  }

  dimension: adwords_keywords {
    hidden: yes
  }
  measure: total_adwords_keywords {
    type: sum
    sql: ${TABLE}.adwords_keywords ;;
    description: "Keywords a website is buying in Google Ads for ads that appear in paid search results"
  }

  dimension: adwords_traffic {
    hidden: yes
  }
  measure: total_adwords_traffic {
    type: sum
    sql: ${TABLE}.adwords_traffic ;;
    description: "Traffic brought to the website via paid search results"
  }

  dimension: adwords_cost {
    hidden: yes
  }
  measure: total_adwords_cost {
    type: sum
    sql: ${TABLE}.adwords_cost ;;
    description: "Estimated budget spent buying keywords in Google Ads, monthly estimation"
  }

  dimension: serp_features_positions {
    hidden: yes
  }
  measure: total_serp_features_positions {
    type: sum
    sql: ${TABLE}.serp_features_positions ;;
    description: "Number of keywords where the domain ranks in SERP Features"
  }

  dimension: serp_features_positions_branded {
    hidden: yes
  }
  measure: total_serp_features_positions_branded {
    type: sum
    sql: ${TABLE}.serp_features_positions_branded ;;
    description: "Number of branded keywords where the domain ranks in SERP Features"
  }

  dimension: serp_features_positions_lost {
    hidden: yes
  }
  measure: total_serp_features_positions_lost {
    type: sum
    sql: ${TABLE}.serp_features_positions_lost ;;
    description: "Keywords the domain was previously ranking for in SERP Features but no longer is"
  }

  dimension: serp_features_positions_new {
    hidden: yes
  }
  measure: total_serp_features_positions_new {
    type: sum
    sql: ${TABLE}.serp_features_positions_new ;;
    description: "New keywords the domain is ranking for in SERP Features"
  }

  dimension: serp_features_traffic {
    hidden: yes
  }
  measure: total_serp_features_traffic {
    type: sum
    sql: ${TABLE}.serp_features_traffic ;;
    description: "Estimated organic traffic driven to the domain from SERP Feature positions"
  }

  dimension: serp_features_traffic_branded {
    hidden: yes
  }
  measure: total_serp_features_traffic_branded {
    type: sum
    sql: ${TABLE}.serp_features_traffic_branded ;;
    description: "Estimated organic traffic from SERP Feature positions on branded keywords"
  }

  dimension: serp_features_traffic_cost {
    hidden: yes
  }
  measure: total_serp_features_traffic_cost {
    type: sum
    sql: ${TABLE}.serp_features_traffic_cost ;;
    description: "Estimated PPC cost to rank for keywords where the domain ranks in SERP Features"
  }

  dimension: fk_knowledge_panel {
    hidden: yes
  }
  measure: total_fk_knowledge_panel {
    type: sum
    sql: ${TABLE}.fk_knowledge_panel ;;
    description: "SERP features triggered by ranked keywords - Knowledge panel (code 1)"
  }

  dimension: fk_carousel {
    hidden: yes
  }
  measure: total_fk_carousel {
    type: sum
    sql: ${TABLE}.fk_carousel ;;
    description: "SERP features triggered by ranked keywords - Carousel (code 2)"
  }

  dimension: fk_local_pack {
    hidden: yes
  }
  measure: total_fk_local_pack {
    type: sum
    sql: ${TABLE}.fk_local_pack ;;
    description: "SERP features triggered by ranked keywords - Local pack (code 3)"
  }

  dimension: fk_top_stories {
    hidden: yes
  }
  measure: total_fk_top_stories {
    type: sum
    sql: ${TABLE}.fk_top_stories ;;
    description: "SERP features triggered by ranked keywords - Top stories (code 4)"
  }

  dimension: fk_image_pack {
    hidden: yes
  }
  measure: total_fk_image_pack {
    type: sum
    sql: ${TABLE}.fk_image_pack ;;
    description: "SERP features triggered by ranked keywords - Image pack (code 5)"
  }

  dimension: fk_sitelinks {
    hidden: yes
  }
  measure: total_fk_sitelinks {
    type: sum
    sql: ${TABLE}.fk_sitelinks ;;
    description: "SERP features triggered by ranked keywords - Sitelinks (code 6)"
  }

  dimension: fk_reviews {
    hidden: yes
  }
  measure: total_fk_reviews {
    type: sum
    sql: ${TABLE}.fk_reviews ;;
    description: "SERP features triggered by ranked keywords - Reviews (code 7)"
  }

  dimension: fk_video {
    hidden: yes
  }
  measure: total_fk_video {
    type: sum
    sql: ${TABLE}.fk_video ;;
    description: "SERP features triggered by ranked keywords - Video (code 9)"
  }

  dimension: fk_featured_video {
    hidden: yes
  }
  measure: total_fk_featured_video {
    type: sum
    sql: ${TABLE}.fk_featured_video ;;
    description: "SERP features triggered by ranked keywords - Featured video (code 10)"
  }

  dimension: fk_featured_snippet {
    hidden: yes
  }
  measure: total_fk_featured_snippet {
    type: sum
    sql: ${TABLE}.fk_featured_snippet ;;
    description: "SERP features triggered by ranked keywords - Featured snippet (code 11)"
  }

  dimension: fk_amp {
    hidden: yes
  }
  measure: total_fk_amp {
    type: sum
    sql: ${TABLE}.fk_amp ;;
    description: "SERP features triggered by ranked keywords - AMP (code 12)"
  }

  dimension: fk_image {
    hidden: yes
  }
  measure: total_fk_image {
    type: sum
    sql: ${TABLE}.fk_image ;;
    description: "SERP features triggered by ranked keywords - Image (code 13)"
  }

  dimension: fk_ads_top {
    hidden: yes
  }
  measure: total_fk_ads_top {
    type: sum
    sql: ${TABLE}.fk_ads_top ;;
    description: "SERP features triggered by ranked keywords - Ads top (code 14)"
  }

  dimension: fk_ads_bottom {
    hidden: yes
  }
  measure: total_fk_ads_bottom {
    type: sum
    sql: ${TABLE}.fk_ads_bottom ;;
    description: "SERP features triggered by ranked keywords - Ads bottom (code 15)"
  }

  dimension: fk_shopping_ads {
    hidden: yes
  }
  measure: total_fk_shopping_ads {
    type: sum
    sql: ${TABLE}.fk_shopping_ads ;;
    description: "SERP features triggered by ranked keywords - Shopping ads (code 16)"
  }

  dimension: fk_hotels_pack {
    hidden: yes
  }
  measure: total_fk_hotels_pack {
    type: sum
    sql: ${TABLE}.fk_hotels_pack ;;
    description: "SERP features triggered by ranked keywords - Hotels Pack (code 17)"
  }

  dimension: fk_jobs_search {
    hidden: yes
  }
  measure: total_fk_jobs_search {
    type: sum
    sql: ${TABLE}.fk_jobs_search ;;
    description: "SERP features triggered by ranked keywords - Jobs search (code 18)"
  }

  dimension: fk_featured_images {
    hidden: yes
  }
  measure: total_fk_featured_images {
    type: sum
    sql: ${TABLE}.fk_featured_images ;;
    description: "SERP features triggered by ranked keywords - Featured images (code 19)"
  }

  dimension: fk_video_carousel {
    hidden: yes
  }
  measure: total_fk_video_carousel {
    type: sum
    sql: ${TABLE}.fk_video_carousel ;;
    description: "SERP features triggered by ranked keywords - Video Carousel (code 20)"
  }

  dimension: fk_people_also_ask {
    hidden: yes
  }
  measure: total_fk_people_also_ask {
    type: sum
    sql: ${TABLE}.fk_people_also_ask ;;
    description: "SERP features triggered by ranked keywords - People also ask (code 21)"
  }

  dimension: fk_faq {
    hidden: yes
  }
  measure: total_fk_faq {
    type: sum
    sql: ${TABLE}.fk_faq ;;
    description: "SERP features triggered by ranked keywords - FAQ (code 22)"
  }

  dimension: fk_flights {
    hidden: yes
  }
  measure: total_fk_flights {
    type: sum
    sql: ${TABLE}.fk_flights ;;
    description: "SERP features triggered by ranked keywords - Flights (code 23)"
  }

  dimension: fk_recipes {
    hidden: yes
  }
  measure: total_fk_recipes {
    type: sum
    sql: ${TABLE}.fk_recipes ;;
    description: "SERP features triggered by ranked keywords - Recipes (code 25)"
  }

  dimension: fk_twitter_carousel {
    hidden: yes
  }
  measure: total_fk_twitter_carousel {
    type: sum
    sql: ${TABLE}.fk_twitter_carousel ;;
    description: "SERP features triggered by ranked keywords - Twitter carousel (code 27)"
  }

  dimension: fk_application {
    hidden: yes
  }
  measure: total_fk_application {
    type: sum
    sql: ${TABLE}.fk_application ;;
    description: "SERP features triggered by ranked keywords - Application (code 31)"
  }

  dimension: fk_events {
    hidden: yes
  }
  measure: total_fk_events {
    type: sum
    sql: ${TABLE}.fk_events ;;
    description: "SERP features triggered by ranked keywords - Events (code 32)"
  }

  dimension: fk_popular_products {
    hidden: yes
  }
  measure: total_fk_popular_products {
    type: sum
    sql: ${TABLE}.fk_popular_products ;;
    description: "SERP features triggered by ranked keywords - Popular products (code 34)"
  }

  dimension: fk_related_products {
    hidden: yes
  }
  measure: total_fk_related_products {
    type: sum
    sql: ${TABLE}.fk_related_products ;;
    description: "SERP features triggered by ranked keywords - Related products (code 35)"
  }

  dimension: fk_related_searches {
    hidden: yes
  }
  measure: total_fk_related_searches {
    type: sum
    sql: ${TABLE}.fk_related_searches ;;
    description: "SERP features triggered by ranked keywords - Related searches (code 36)"
  }

  dimension: fk_see_results_about {
    hidden: yes
  }
  measure: total_fk_see_results_about {
    type: sum
    sql: ${TABLE}.fk_see_results_about ;;
    description: "SERP features triggered by ranked keywords - See results about (code 37)"
  }

  dimension: fk_short_videos {
    hidden: yes
  }
  measure: total_fk_short_videos {
    type: sum
    sql: ${TABLE}.fk_short_videos ;;
    description: "SERP features triggered by ranked keywords - Short videos (code 38)"
  }

  dimension: fk_application_list {
    hidden: yes
  }
  measure: total_fk_application_list {
    type: sum
    sql: ${TABLE}.fk_application_list ;;
    description: "SERP features triggered by ranked keywords - Application list (code 40)"
  }

  dimension: fk_buying_guide {
    hidden: yes
  }
  measure: total_fk_buying_guide {
    type: sum
    sql: ${TABLE}.fk_buying_guide ;;
    description: "SERP features triggered by ranked keywords - Buying guide (code 41)"
  }

  dimension: fk_things_to_know {
    hidden: yes
  }
  measure: total_fk_things_to_know {
    type: sum
    sql: ${TABLE}.fk_things_to_know ;;
    description: "SERP features triggered by ranked keywords - Things to know (code 43)"
  }

  dimension: fk_discussions_and_forums {
    hidden: yes
  }
  measure: total_fk_discussions_and_forums {
    type: sum
    sql: ${TABLE}.fk_discussions_and_forums ;;
    description: "SERP features triggered by ranked keywords - Discussions and forums (code 45)"
  }

  dimension: fk_questions_and_answers {
    hidden: yes
  }
  measure: total_fk_questions_and_answers {
    type: sum
    sql: ${TABLE}.fk_questions_and_answers ;;
    description: "SERP features triggered by ranked keywords - Questions and answers (code 47)"
  }

  dimension: fk_people_also_search {
    hidden: yes
  }
  measure: total_fk_people_also_search {
    type: sum
    sql: ${TABLE}.fk_people_also_search ;;
    description: "SERP features triggered by ranked keywords - People also search (code 50)"
  }

  dimension: fk_ads_middle {
    hidden: yes
  }
  measure: total_fk_ads_middle {
    type: sum
    sql: ${TABLE}.fk_ads_middle ;;
    description: "SERP features triggered by ranked keywords - Ads middle (code 51)"
  }

  dimension: fk_ai_overview {
    hidden: yes
  }
  measure: total_fk_ai_overview {
    type: sum
    sql: ${TABLE}.fk_ai_overview ;;
    description: "SERP features triggered by ranked keywords - AI overview (code 52)"
  }

  dimension: fp_image_pack {
    hidden: yes
  }
  measure: total_fp_image_pack {
    type: sum
    sql: ${TABLE}.fp_image_pack ;;
    description: "SERP features where domain appears - Image pack (code 5)"
  }

  dimension: fp_sitelinks {
    hidden: yes
  }
  measure: total_fp_sitelinks {
    type: sum
    sql: ${TABLE}.fp_sitelinks ;;
    description: "SERP features where domain appears - Sitelinks (code 6)"
  }

  dimension: fp_featured_snippet {
    hidden: yes
  }
  measure: total_fp_featured_snippet {
    type: sum
    sql: ${TABLE}.fp_featured_snippet ;;
    description: "SERP features where domain appears - Featured snippet (code 11)"
  }

  dimension: fp_image {
    hidden: yes
  }
  measure: total_fp_image {
    type: sum
    sql: ${TABLE}.fp_image ;;
    description: "SERP features where domain appears - Image (code 13)"
  }

  dimension: fp_people_also_ask {
    hidden: yes
  }
  measure: total_fp_people_also_ask {
    type: sum
    sql: ${TABLE}.fp_people_also_ask ;;
    description: "SERP features where domain appears - People also ask (code 21)"
  }

  dimension: fp_things_to_know {
    hidden: yes
  }
  measure: total_fp_things_to_know {
    type: sum
    sql: ${TABLE}.fp_things_to_know ;;
    description: "SERP features where domain appears - Things to know (code 43)"
  }

  dimension: fp_ai_overview {
    hidden: yes
  }
  measure: total_fp_ai_overview {
    type: sum
    sql: ${TABLE}.fp_ai_overview ;;
    description: "SERP features where domain appears - AI overview (code 52)"
  }
}
