include: "//looker-hub/firefox_accounts/explores/all_event_counts.explore.lkml"
include: "/subscription_platform/views/stripe_products.view.lkml"
include: "/subscription_platform/views/stripe_plans.view.lkml"

explore: +all_event_counts {

  join: products {
    from: stripe_products
    sql_on: ${all_event_counts.product_id} = ${products.id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: previous_products {
    from: stripe_products
    sql_on: ${all_event_counts.previous_product_id} = ${previous_products.id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: plans {
    from: stripe_plans
    sql_on: ${all_event_counts.plan_id} = ${plans.id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: previous_plans {
    from: stripe_plans
    sql_on: ${all_event_counts.previous_plan_id} = ${previous_plans.id} ;;
    type: left_outer
    relationship: many_to_one
  }

}
