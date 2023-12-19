include: "//looker-hub/subscription_platform/views/stripe_subscriptions.view.lkml"

view: +stripe_subscriptions {
  dimension: id {
    primary_key: yes
  }

  measure: count {
    type: count
  }
}
