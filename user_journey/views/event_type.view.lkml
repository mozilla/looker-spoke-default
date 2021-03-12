view: event_type {
  derived_table: {
    sql:
    SELECT
      mozfun.event_analysis.aggregate_match_strings(
          ARRAY_AGG(
            CONCAT(event_properties_match_string,
                   event_match_string))) AS match_string
    FROM (
      SELECT
        mozfun.event_analysis.event_index_to_match_string(index)
          AS event_match_string,
        ARRAY_TO_STRING(ARRAY_AGG(event_property_match_string
                    ORDER BY
                      event_property_index DESC), '')
          AS event_properties_match_string,
      FROM
        (
          SELECT
            selected_events.index,
            event_property.index AS event_property_index,
            COALESCE(event_property_match_string,
              '.') AS event_property_match_string
          FROM
            (
              SELECT
                *
              FROM
                mozdata.messaging_system.event_types
              WHERE
                {% condition message_id %} event_types.category {% endcondition %}
                AND {% condition event_type %} event_types.event {% endcondition %}
            ) AS selected_events
          LEFT JOIN
            UNNEST(event_properties) AS event_property
          LEFT JOIN
            (
              SELECT
                selected_events.index,
                event_property.index AS event_property_index,
                mozfun.event_analysis.aggregate_match_strings(ARRAY_AGG(mozfun.event_analysis.escape_metachars(event_property_value.value))) AS event_property_match_string
              FROM
                (
                  SELECT
                    *
                  FROM
                    mozdata.messaging_system.event_types
                  WHERE
                    {% condition message_id %} event_types.category {% endcondition %}
                    AND {% condition event_type %} event_types.event {% endcondition %}
                ) AS selected_events
              LEFT JOIN
                UNNEST(event_properties) AS event_property
              LEFT JOIN
                UNNEST(value) AS event_property_value
              WHERE
                (
                  event_property.key = "page"
                  AND REGEXP_CONTAINS("""{% condition page %} __key__ {% endcondition %}""", r"__key__")
                  AND {% condition page %} event_property_value.key {% endcondition %}
                ) OR (
                  event_property.key = "source"
                  AND REGEXP_CONTAINS("""{% condition source %} __key__ {% endcondition %}""", r"__key__")
                  AND {% condition source %} event_property_value.key {% endcondition %}
                ) OR (
                  event_property.key = "domState"
                  AND REGEXP_CONTAINS("""{% condition domState %} __key__ {% endcondition %}""", r"__key__")
                  AND {% condition domState %} event_property_value.key {% endcondition %}
                ) OR (
                  event_property.key = "reason"
                  AND REGEXP_CONTAINS("""{% condition reason %} __key__ {% endcondition %}""", r"__key__")
                  AND {% condition reason %} event_property_value.key {% endcondition %}
                ) OR (
                  event_property.key = "display"
                  AND REGEXP_CONTAINS("""{% condition display %} __key__ {% endcondition %}""", r"__key__")
                  AND {% condition display %} event_property_value.key {% endcondition %}
                )
              GROUP BY
                selected_events.index,
                event_property.index
            ) AS selected_event_properties
          ON
            selected_event_properties.index = selected_events.index
            AND selected_event_properties.event_property_index = event_property.index

        ) AS all_event_properties
      GROUP BY
        index
    );;
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

  filter: page {
    type: string
    suggest_explore: event_property_page
    suggest_dimension: event_property_page.property_value
    group_label: "Event Properties"
  }

  filter: source {
    type: string
    suggest_explore: event_property_source
    suggest_dimension: event_property_source.property_value
    group_label: "Event Properties"
  }

  filter: domState {
    type: string
    suggest_explore: event_property_domState
    suggest_dimension: event_property_domState.property_value
    group_label: "Event Properties"
  }

  filter: reason {
    type: string
    suggest_explore: event_property_reason
    suggest_dimension: event_property_reason.property_value
    group_label: "Event Properties"
  }

  filter: display {
    type: string
    suggest_explore: event_property_display
    suggest_dimension: event_property_display.property_value
    group_label: "Event Properties"
  }

  dimension: match_string {
    hidden: yes
    sql: ${TABLE}.match_string ;;
    primary_key: yes
  }
}
