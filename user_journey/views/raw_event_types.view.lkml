view: raw_event_types {
  derived_table: {
    sql:
      SELECT
        category,
        event,
        property.key AS property_name,
        property_value.key AS property_value
      FROM mozdata.messaging_system.event_types
      LEFT JOIN UNNEST(event_properties) AS property
      LEFT JOIN UNNEST(property.value) AS property_value
      ;;
  }


  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: property_name {
    type: string
    sql: ${TABLE}.property_name ;;
  }

  dimension: property_value {
    type: string
    sql: ${TABLE}.property_value ;;
  }

  dimension: message_event {
    type: string
    sql: CONCAT(${TABLE}.category, ' - ', ${TABLE}.event) ;;
  }
}
