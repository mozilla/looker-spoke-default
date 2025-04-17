view: rss_feed_items {
  sql_table_name: `moz-fx-mozsoc-ml-prod.prod_rss_news.rss_feed_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: author {
    type: string
    sql: ${TABLE}.author ;;
  }
  dimension: canonical_url {
    type: string
    sql: ${TABLE}.canonical_url ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: content_cleaned {
    type: string
    sql: ${TABLE}.content_cleaned ;;
  }
  dimension_group: crawled_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.crawled_at ;;
  }
  dimension: crawled_date {
    type: string
    sql: ${TABLE}.crawled_date ;;
  }
  dimension: engagement {
    type: number
    sql: ${TABLE}.engagement ;;
  }
  dimension: keywords {
    type: string
    sql: ${TABLE}.keywords ;;
  }
  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }
  dimension: load_count {
    type: number
    sql: ${TABLE}.load_count ;;
  }
  dimension_group: loaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.loaded_at ;;
  }
  dimension: origin_title {
    type: string
    sql: ${TABLE}.origin_title ;;
  }
  dimension: origin_url {
    type: string
    sql: ${TABLE}.origin_url ;;
  }
  dimension_group: published_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.published_at ;;
  }
  dimension: published_date {
    type: string
    sql: ${TABLE}.published_date ;;
  }
  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }
  dimension: surface {
    type: string
    sql: ${TABLE}.surface ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  dimension: unread {
    type: yesno
    sql: ${TABLE}.unread ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
