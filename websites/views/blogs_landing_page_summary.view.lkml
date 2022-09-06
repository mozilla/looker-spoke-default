include: "//looker-hub/websites/views/blogs_landing_page_summary.view.lkml"

view: +blogs_landing_page_summary {
  measure: sessions {
    label: "Sessions Count"
    type: sum
    sql: ${TABLE}.sessions;;
  }

  measure: downloads {
    label: "Downloads Count"
    type: sum
    sql: ${TABLE}.downloads;;
  }

  measure: social_share {
    label: "Social Share Count"
    type: sum
    sql: ${TABLE}.social_share;;
  }

  measure: newsletter_subscription {
    label: "Newsletter Subscription Count"
    type: sum
    sql: ${TABLE}.newsletter_subscription;;
  }
}