# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: stripe_products {
#   hidden: yes

#   join: stripe_products__images {
#     view_label: "Products: Images"
#     sql: LEFT JOIN UNNEST(${stripe_products.images}) as stripe_products__images;;
#     relationship: one_to_many
#   }

#   join: stripe_products__attributes {
#     view_label: "Products: Attributes"
#     sql: LEFT JOIN UNNEST(${stripe_products.attributes}) as stripe_products__attributes;;
#     relationship: one_to_many
#   }

#   join: stripe_products__deactive_on {
#     view_label: "Products: Deactive On"
#     sql: LEFT JOIN UNNEST(${stripe_products.deactive_on}) as stripe_products__deactive_on;;
#     relationship: one_to_many
#   }
# }

view: stripe_products {
  sql_table_name: `mozdata.stripe.products`;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active;;
  }

  dimension: attributes {
    hidden: yes
    sql: ${TABLE}.attributes;;
  }

  dimension: caption {
    type: string
    sql: ${TABLE}.caption;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created;;
  }

  dimension: deactive_on {
    hidden: yes
    sql: ${TABLE}.deactive_on;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description;;
  }

  dimension_group: event_timestamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.event_timestamp;;
  }

  dimension: images {
    hidden: yes
    sql: ${TABLE}.images;;
  }

  dimension: livemode {
    hidden: yes
    type: yesno
    sql: ${TABLE}.livemode;;
  }

  dimension: metadata {
    hidden: yes
    sql: ${TABLE}.metadata;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name;;
  }

  dimension: object {
    hidden: yes
    type: string
    sql: ${TABLE}.object;;
  }

  dimension: package_dimensions__height {
    hidden: yes
    type: number
    sql: ${TABLE}.package_dimensions.height;;
    group_label: "Package Dimensions"
    group_item_label: "Height"
  }

  dimension: package_dimensions__length {
    hidden: yes
    type: number
    sql: ${TABLE}.package_dimensions.length;;
    group_label: "Package Dimensions"
    group_item_label: "Length"
  }

  dimension: package_dimensions__weight {
    hidden: yes
    type: number
    sql: ${TABLE}.package_dimensions.weight;;
    group_label: "Package Dimensions"
    group_item_label: "Weight"
  }

  dimension: package_dimensions__width {
    hidden: yes
    type: number
    sql: ${TABLE}.package_dimensions.width;;
    group_label: "Package Dimensions"
    group_item_label: "Width"
  }

  dimension: shippable {
    hidden: yes
    type: yesno
    sql: ${TABLE}.shippable;;
  }

  dimension: statement_descriptor {
    type: string
    sql: ${TABLE}.statement_descriptor;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url;;
  }
}

# view: stripe_products__images {
#   dimension: image {
#     type: string
#     sql: ${TABLE};;
#   }
# }

# view: stripe_products__attributes {
#   dimension: attribute {
#     type: string
#     sql: ${TABLE};;
#   }
# }

# view: stripe_products__deactive_on {
#   dimension: deactive_on {
#     type: string
#     sql: ${TABLE};;
#   }
# }
