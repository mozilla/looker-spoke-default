view: stripe_products {
  dimension: active {
    sql: ${TABLE}.active ;;
    type: yesno
  }

  dimension: attributes {
    sql: ${TABLE}.attributes ;;
    hidden: yes
  }

  dimension: caption {
    sql: ${TABLE}.caption ;;
    type: string
  }

  dimension: deactive_on {
    sql: ${TABLE}.deactive_on ;;
    hidden: yes
  }

  dimension: description {
    sql: ${TABLE}.description ;;
    type: string
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: string
    primary_key: yes
    hidden: yes
  }

  dimension: images {
    sql: ${TABLE}.images ;;
    hidden: yes
  }

  dimension: livemode {
    sql: ${TABLE}.livemode ;;
    type: yesno
  }

  dimension: metadata {
    sql: ${TABLE}.metadata ;;
    hidden: yes
  }

  dimension: name {
    sql: ${TABLE}.name ;;
    type: string
  }

  dimension: object {
    sql: ${TABLE}.object ;;
    type: string
  }

  dimension: package_dimensions__height {
    sql: ${TABLE}.package_dimensions.height ;;
    type: number
    group_label: "Package Dimensions"
    group_item_label: "Height"
  }

  dimension: package_dimensions__length {
    sql: ${TABLE}.package_dimensions.length ;;
    type: number
    group_label: "Package Dimensions"
    group_item_label: "Length"
  }

  dimension: package_dimensions__weight {
    sql: ${TABLE}.package_dimensions.weight ;;
    type: number
    group_label: "Package Dimensions"
    group_item_label: "Weight"
  }

  dimension: package_dimensions__width {
    sql: ${TABLE}.package_dimensions.width ;;
    type: number
    group_label: "Package Dimensions"
    group_item_label: "Width"
  }

  dimension: shippable {
    sql: ${TABLE}.shippable ;;
    type: yesno
  }

  dimension: statement_descriptor {
    sql: ${TABLE}.statement_descriptor ;;
    type: string
  }

  dimension: type {
    sql: ${TABLE}.type ;;
    type: string
  }

  dimension: url {
    sql: ${TABLE}.url ;;
    type: string
  }

  dimension_group: created {
    sql: ${TABLE}.created ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension_group: event {
    sql: ${TABLE}.event_timestamp ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension_group: updated {
    sql: ${TABLE}.updated ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  measure: count {
    type: count
  }

  sql_table_name: `mozdata.stripe.products` ;;
}
