view: message_ids {
  derived_table: {
    sql:
      SELECT
        CONCAT(category, ' - ', event) AS message_event,
        mozfun.event_analysis.event_index_to_match_string(index) AS match_string,
      FROM
        mozdata.messaging_system.event_types event_types
      WHERE
        {% condition message_ids.message_event %}
          CONCAT(event_types.category, ' - ', event_types.event)
        {% endcondition %};;
  }

  dimension: message_event {
    type: string
    sql: ${TABLE}.message_event ;;
  }

  dimension: match_string {
    hidden: yes
    sql: ${TABLE}.match_string ;;
  }
}
