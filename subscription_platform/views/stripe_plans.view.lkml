include: "//looker-hub/subscription_platform/views/stripe_plans.view.lkml"

view: +stripe_plans {

  dimension: id {
    primary_key: yes
  }

  dimension: aggregate_usage {
    hidden:  yes
  }

  dimension: billing_scheme {
    hidden:  yes
  }

  dimension: tiers_mode {
    hidden:  yes
  }

  dimension: trial_period_days {
    hidden:  yes
  }

  dimension: usage_type {
    hidden:  yes
  }

}
