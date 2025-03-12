view: shipment_and_activation_vivo {

  sql_table_name: `moz-fx-data-shared-prod.device_manufacturer_partnerships.shipment_and_activation_vivo` ;;

  dimension_group: reported {
    sql: ${TABLE}.date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
    description: "Country name"
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
    description: "Two letter country code"
  }

  measure: shipped {
    type: sum
    sql: ${TABLE}.shipped ;;
    description: "Number of devices shipped"
  }

  measure: activated {
    type: sum
    sql: ${TABLE}.activated ;;
    description: "Number of units activated"
  }

}
