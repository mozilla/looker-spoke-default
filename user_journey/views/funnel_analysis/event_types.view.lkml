view: event_type_1 {
  derived_table: {
    sql:
      SELECT
        mozfun.event_analysis.aggregate_match_strings(
          ARRAY_AGG(
            mozfun.event_analysis.event_index_to_match_string(index))) AS match_string
      FROM
        mozdata.messaging_system.event_types
      WHERE
        {% condition event_type_1.message_id %} event_types.category {% endcondition %}
        AND {% condition event_type_1.event_type %} event_types.event {% endcondition %};;
  }

  filter: message_id {
    type: string
    suggest_explore: event_names
    suggest_dimension: event_names.category
  }

  filter: event_type {
    type: string
    suggest_explore: event_names
    suggest_dimension: event_names.event
  }

  # Keeping this to indicate how we might expose event properties
  #   We don't support event_properties in the event_analysis UDFs yet,
  #   but when we do we can expose them here.
  #filter: page {
  #  type: string
  #  suggest_explore: page
  #  suggest_dimension: page.event_property_value
  #  suggest_persist_for: "1 second"
  #}

  dimension: match_string {
    hidden: yes
    sql: ${TABLE}.match_string ;;
  }
}

view: event_type_2 {
  derived_table: {
    sql:
      SELECT
        mozfun.event_analysis.aggregate_match_strings(
          ARRAY_AGG(
            mozfun.event_analysis.event_index_to_match_string(index))) AS match_string
      FROM
        mozdata.messaging_system.event_types
      WHERE
        {% condition event_type_2.message_id %} event_types.category {% endcondition %}
        AND {% condition event_type_2.event_type %} event_types.event {% endcondition %};;
  }

  filter: message_id {
    type: string
    suggest_explore: event_names
    suggest_dimension: event_names.category
  }

  filter: event_type {
    type: string
    suggest_explore: event_names
    suggest_dimension: event_names.event
  }

  #filter: page {
  #  type: string
  #  suggest_explore: page
  #  suggest_dimension: page.event_property_value
  #  suggest_persist_for: "1 second"
  #}

  dimension: match_string {
    hidden: yes
    sql: ${TABLE}.match_string ;;
  }
}

view: event_type_3 {
  derived_table: {
    sql:
      SELECT
        mozfun.event_analysis.aggregate_match_strings(
          ARRAY_AGG(
            mozfun.event_analysis.event_index_to_match_string(index))) AS match_string
      FROM
        mozdata.messaging_system.event_types
      WHERE
        {% condition event_type_3.message_id %} event_types.category {% endcondition %}
        AND {% condition event_type_3.event_type %} event_types.event {% endcondition %};;
  }

  filter: message_id {
    type: string
    suggest_explore: event_names
    suggest_dimension: event_names.category
  }

  filter: event_type {
    type: string
    suggest_explore: event_names
    suggest_dimension: event_names.event
  }

  #filter: page {
  #  type: string
  #  suggest_explore: page
  #  suggest_dimension: page.event_property_value
  #  suggest_persist_for: "1 second"
  #}

  dimension: match_string {
    hidden: yes
    sql: mozfun.event_analysis.event_index_to_match_string(${TABLE}.index) ;;
  }
}

view: event_type_4 {
  derived_table: {
    sql:
      SELECT
        mozfun.event_analysis.aggregate_match_strings(
          ARRAY_AGG(
            mozfun.event_analysis.event_index_to_match_string(index))) AS match_string
      FROM
        mozdata.messaging_system.event_types
      WHERE
        {% condition event_type_4.message_id %} event_types.category {% endcondition %}
        AND {% condition event_type_4.event_type %} event_types.event {% endcondition %};;
  }

  filter: message_id {
    type: string
    suggest_explore: event_names
    suggest_dimension: event_names.category
  }

  filter: event_type {
    type: string
    suggest_explore: event_names
    suggest_dimension: event_names.event
  }

  #filter: page {
  #  type: string
  #  suggest_explore: page
  #  suggest_dimension: page.event_property_value
  #  suggest_persist_for: "1 second"
  #}

  dimension: match_string {
    hidden: yes
    sql: mozfun.event_analysis.event_index_to_match_string(${TABLE}.index) ;;
  }
}
