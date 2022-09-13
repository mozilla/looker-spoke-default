include: "//looker-hub/mdn_yari/views/page.view.lkml"

view: page+ {
  dimension: page_path {
    sql: ${TABLE}.metrics.url2.page_path ;;
    type: string
    group_label: "Metrics Url2"
    group_item_label: "Page Path"
    description: "The URL path of the page that was viewed.
    "
  }

  dimension: page_referrer {
    sql: ${TABLE}.metrics.url2.page_referrer ;;
    type: string
    group_label: "Metrics Url2"
    group_item_label: "Page Referrer"
    description: "The referring URL that linked to the page that was viewed.
    "
  }
}
