include: "//looker-hub/subscription_platform/views/stripe_plans.view.lkml"

view: +stripe_plans {

  dimension: id {
    primary_key: yes
  }

}
