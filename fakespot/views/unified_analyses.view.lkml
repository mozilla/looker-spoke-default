view: unified_analyses {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT
        "amazon" as source,
        product_id,
        * except (id, exchange_review_words_detected, product_id),
        RANK() OVER (partition by product_id ORDER BY updated_at) as analysis_rank,
      FROM `mozdata.fakespot.amazon_analyses`
      UNION ALL
      SELECT
        "bestbuy" as source,
        bestbuy_product_id as product_id,
        * except (id, bestbuy_product_id),
        RANK() OVER (partition by bestbuy_product_id ORDER BY updated_at) as analysis_rank,
      FROM `mozdata.fakespot.bestbuy_analyses`
      UNION ALL
      SELECT
        "walmart" as source,
        walmart_product_id as product_id,
        * except (id, walmart_product_id),
        RANK() OVER (partition by walmart_product_id ORDER BY updated_at) as analysis_rank,
      FROM `mozdata.fakespot.walmart_analyses`
      UNION ALL
      SELECT
        "home_depot" as source,
        home_depot_product_id as product_id,
        * except (id, home_depot_product_id),
        RANK() OVER (partition by home_depot_product_id ORDER BY updated_at) as analysis_rank,
      FROM `mozdata.fakespot.home_depot_analyses`
      UNION ALL
      SELECT
        "flipkart" as source,
        flipkart_product_id as product_id,
        * except (id, flipkart_product_id),
        RANK() OVER (partition by flipkart_product_id ORDER BY updated_at) as analysis_rank,
      FROM `mozdata.fakespot.flipkart_analyses`
       ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: source {
    description: "Product Source"
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: product_id {
    description: "Vendor specific product id"
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: url {
    description: "Product Url"
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: name {
    description: "Product name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: company {
    description: "Product company"
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: category {
    description: "Product category"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: created_at {
    description: "Analysis Created Time"
    type: date_time
    sql: TIMESTAMP(${TABLE}.created_at) ;;
  }

  dimension: updated_at {
    description: "Analysis Updated Time"
    type: date_time
    sql: TIMESTAMP(${TABLE}.updated_at) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: total_fake_reviews {
    type: number
    sql: ${TABLE}.total_fake_reviews ;;
  }

  dimension: total_legit_reviews {
    type: number
    sql: ${TABLE}.total_legit_reviews ;;
  }

  dimension: total_reviews {
    type: number
    sql: ${TABLE}.total_reviews ;;
  }

  dimension: percentage_fake {
    type: number
    sql: ${TABLE}.percentage_fake ;;
  }

  dimension: completed {
    type: yesno
    sql: ${TABLE}.completed ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}.price ;;
  }

  dimension: percentage_fake_averaged {
    type: number
    sql: ${TABLE}.percentage_fake_averaged ;;
  }

  dimension: reviewers_count {
    type: number
    sql: ${TABLE}.reviewers_count ;;
  }

  dimension: analysis_rank {
    type:  number
    sql: ${TABLE}.analysis_rank ;;
  }

  measure: product_count {
    type: count_distinct
    sql: concat(${product_id}, ${source}) ;;
  }

}
