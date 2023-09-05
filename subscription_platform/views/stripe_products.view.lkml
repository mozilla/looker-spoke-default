include: "//looker-hub/subscription_platform/views/stripe_products.view.lkml"

view: +stripe_products {

  dimension: id {
    primary_key: yes
  }

  dimension: statement_descriptor {
    hidden:  yes
  }

}
