include: "../views/rss_feed_items.view.lkml"
include: "../views/zyte_cache.view.lkml"

explore: rss_feed_items {
  label: "RSS Feed Items"

  join: zyte_cache {
    type: left_outer
    relationship: one_to_one
    sql_on: ${rss_feed_items.canonical_url} = ${zyte_cache.canonical_url} ;;
  }
}
