include: "//looker-hub/websites/views/blogs_daily_summary.view.lkml"

view: +blogs_daily_summary {
  measure: sessions_sum {
    label: "Sessions Sum"
    type: sum
    sql: ${sessions} ;;
  }

  measure: downloads_sum {
    label: "Downloads Sum"
    type: sum
    sql: ${downloads} ;;
  }

  measure: social_shares_sum {
    label: "Social Share Sum"
    type: sum
    sql: ${social_share} ;;
  }

  measure: newsletter_subscriptions_sum {
    label: "Newsletter Subscription Sum"
    type: sum
    sql: ${newsletter_subscription} ;;
  }
}
