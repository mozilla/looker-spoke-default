view: zyte_cache {
  sql_table_name: `moz-fx-mozsoc-ml-prod.prod_articles.zyte_cache` ;;

  dimension: canonical_url {
    type: string
    sql: ${TABLE}.canonical_url ;;
  }
  dimension: zyte_article_body {
    type: string
    sql: ${TABLE}.zyte_articleBody ;;
  }
  dimension: zyte_authors {
    type: string
    sql: ${TABLE}.zyte_authors ;;
  }
  dimension: zyte_breadcrumbs {
    type: string
    sql: ${TABLE}.zyte_breadcrumbs ;;
  }
  dimension_group: zyte_cached {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.zyte_cached_at ;;
  }
  dimension: zyte_canonical_url {
    type: string
    sql: ${TABLE}.zyte_canonicalUrl ;;
  }
  dimension: zyte_date_modified {
    type: string
    sql: ${TABLE}.zyte_dateModified ;;
  }
  dimension: zyte_date_published {
    type: string
    sql: ${TABLE}.zyte_datePublished ;;
  }
  dimension: zyte_date_published_raw {
    type: string
    sql: ${TABLE}.zyte_datePublishedRaw ;;
  }
  dimension: zyte_description {
    type: string
    sql: ${TABLE}.zyte_description ;;
  }
  dimension: zyte_headline {
    type: string
    sql: ${TABLE}.zyte_headline ;;
  }
  dimension: zyte_in_language {
    type: string
    sql: ${TABLE}.zyte_inLanguage ;;
  }
  dimension: zyte_main_image {
    type: string
    sql: ${TABLE}.zyte_mainImage ;;
  }
  measure: count {
    type: count
  }
}
