include: "//looker-hub/fenix/views/events_stream.view.lkml"

view: event_funnel {
  derived_table: {
    sql:
    WITH events_sample AS (
    SELECT
    client_id as client_id,
    submission_timestamp as timestamp,
    DATE(submission_timestamp) as date,
    event_name,
    event_category,
    normalized_country_code as country,
    normalized_os as os,
    normalized_channel as channel,
    extras
    FROM `mozdata.fenix.events_stream`
    WHERE DATE(submission_timestamp) >= {% date_start date %}
    AND DATE(submission_timestamp) <= {% date_end date %}
    {% if country._in_query %}
    AND {% condition country %} normalized_country_code {% endcondition %}
    {% endif %}
    {% if channel._in_query %}
    AND {% condition channel %} normalized_channel {% endcondition %}
    {% endif %}
    {% if os._in_query %}
    AND {% condition os%} normalized_os {% endcondition %}
    {% endif %}
    AND {% condition sample %} sample_id {% endcondition %}
    ),

    step_1 AS (
    SELECT
    client_id,
    date,
    country,
    os,
    channel,
    MIN(timestamp) as step_1_timestamp
    FROM events_sample e
    {% if step_1_event._parameter_value != "" or step_1_category._parameter_value != "" or step_1_extra_filter._parameter_value != "" %}
    WHERE
    {% endif %}
    {% if step_1_event._parameter_value and step_1_event._parameter_value != "" %}
    e.event_name = {% parameter step_1_event %}
    {% endif %}
    {% if step_1_category._parameter_value != "" %}
    AND event_category = {% parameter step_1_category %}
    {% endif %}
    {% if step_1_extra_filter._parameter_value != "" %}
    AND (extras.{% parameter step_1_extra_filter %})
    {% endif %}
    GROUP BY client_id, date, country, os, channel
    ),

    step_2 AS (
    SELECT
    s1.client_id,
    s1.date,
    s1.country,
    s1.os,
    s1.channel,
    s1.step_1_timestamp,
    MIN(e.timestamp) as step_2_timestamp
    FROM step_1 s1
    INNER JOIN events_sample e
    ON s1.client_id = e.client_id
    AND e.timestamp > s1.step_1_timestamp
    AND e.date BETWEEN s1.date AND DATE_ADD(s1.date, INTERVAL 7 DAY)
    {% if step_2_event._parameter_value != "" or step_2_category._parameter_value != "" or step_2_extra_filter._parameter_value != "" %}
    WHERE
    {% endif %}
    {% if step_2_event._parameter_value and step_2_event._parameter_value != "" %}
    e.event_name = {% parameter step_2_event %}
    {% endif %}
    {% if step_2_category._parameter_value != "" %}
    AND e.event_category = {% parameter step_2_category %}
    {% endif %}
    {% if step_2_extra_filter._parameter_value != "" %}
    AND (extras.{% parameter step_2_extra_filter %})
    {% endif %}
    GROUP BY 1,2,3,4,5,6
    ),

    step_3 AS (
    SELECT
    s1.client_id,
    s1.date,
    s1.country,
    s1.os,
    s1.channel,
    s1.step_1_timestamp,
    MIN(e.timestamp) as step_3_timestamp
    FROM step_1 s1
    INNER JOIN events_sample e
    ON s1.client_id = e.client_id
    AND e.timestamp > s1.step_1_timestamp
    AND e.date BETWEEN s1.date AND DATE_ADD(s1.date, INTERVAL 7 DAY)
    {% if step_3_event._parameter_value != "" or step_3_category._parameter_value != "" or step_3_extra_filter._parameter_value != "" %}
    WHERE
    {% endif %}
    {% if step_3_event._parameter_value and step_3_event._parameter_value != "" %}
    e.event_name = {% parameter step_3_event %}
    {% endif %}
    {% if step_3_category._parameter_value != "" %}
    AND e.event_category = {% parameter step_3_category %}
    {% endif %}
    {% if step_3_extra_filter._parameter_value != "" %}
    AND (extras.{% parameter step_3_extra_filter %})
    {% endif %}
    GROUP BY 1,2,3,4,5,6
    ),

    step_4 AS (
    SELECT
    s1.client_id,
    s1.date,
    s1.country,
    s1.os,
    s1.channel,
    s1.step_1_timestamp,
    MIN(e.timestamp) as step_4_timestamp
    FROM step_1 s1
    INNER JOIN events_sample e
    ON s1.client_id = e.client_id
    AND e.timestamp > s1.step_1_timestamp
    AND e.date BETWEEN s1.date AND DATE_ADD(s1.date, INTERVAL 7 DAY)
    {% if step_4_event._parameter_value != "" or step_4_category._parameter_value != "" or step_4_extra_filter._parameter_value != "" %}
    WHERE
    {% endif %}
    {% if step_4_event._parameter_value and step_4_event._parameter_value != "" %}
    e.event_name = {% parameter step_4_event %}
    {% endif %}
    {% if step_4_category._parameter_value != "" %}
    AND e.event_category = {% parameter step_4_category %}
    {% endif %}
    {% if step_4_extra_filter._parameter_value != "" %}
    AND (extras.{% parameter step_4_extra_filter %})
    {% endif %}
    GROUP BY 1,2,3,4,5,6
    )

    SELECT
    s1.date,
    s1.country,
    s1.os,
    s1.channel,
    COUNT(DISTINCT s1.client_id) as step_1_clients,
    COUNT(DISTINCT s2.client_id) as step_2_clients,
    COUNT(DISTINCT s3.client_id) as step_3_clients,
    COUNT(DISTINCT s4.client_id) as step_4_clients,
    AVG(TIMESTAMP_DIFF(s2.step_2_timestamp, s1.step_1_timestamp, MINUTE)) as avg_time_to_step_2_minutes,
    FROM step_1 s1
    LEFT JOIN step_2 s2 USING (client_id, date, country, os, channel)
    LEFT JOIN step_3 s3 USING (client_id, date, country, os, channel)
    LEFT JOIN step_4 s4 USING (client_id, date, country, os, channel)
    GROUP BY 1,2,3,4
    ;;
  }

  # ==========================================
  # GLOBAL FILTERS
  # ==========================================

  filter: sample {
    type:  number
    default_value: "1"
    group_label: "Filters"
  }

  filter: date {
    type: date
    datatype: date
    description: "Date range for funnel analysis"
    group_label: "Filters"
  }

  filter: country {
    type: string
    description: "Filter all steps by country"
    suggest_explore: events_stream
    suggest_dimension: events_stream.country
    group_label: "Filters"
  }

  filter: os {
    type: string
    suggest_explore: events_stream
    suggest_dimension: events_stream.normalized_os
    group_label: "Filters"
  }

  filter: channel {
    type: string
    suggest_explore: events_stream
    suggest_dimension: events_stream.normalized_channel
    group_label: "Filters"
  }

  # ==========================================
  # STEP 1
  # ==========================================

  parameter: step_1_event {
    suggest_explore: events_stream
    suggest_dimension: events_stream.event_name
    group_label: "Step 1"
    group_item_label: "Event Name"
  }

  parameter: step_1_category {
    suggest_explore: events_stream
    suggest_dimension: events_stream.event_category
    group_label: "Step 1"
    group_item_label: "Event Category (optional)"
  }

  parameter: step_1_extra_filter {
    type: unquoted
    description: "Extra filter SQL. Examples: strings.action = 'click' OR booleans.checked = TRUE OR quantities.duration_ms > 1000"
    group_label: "Step 1"
    group_item_label: "Extra Filter (optional)"
  }

  # ==========================================
  # STEP 2
  # ==========================================

  parameter: step_2_event {
    suggest_explore: events_stream
    suggest_dimension: events_stream.event_name
    group_label: "Step 2"
    group_item_label: "Event Name"
  }

  parameter: step_2_category {
    suggest_explore: events_stream
    suggest_dimension: events_stream.event_category
    group_label: "Step 2"
    group_item_label: "Event Category (optional)"
  }

  parameter: step_2_extra_filter {
    type: unquoted
    description: "Extra filter SQL. Examples: strings.action = 'click' OR booleans.checked = TRUE"
    group_label: "Step 2"
    group_item_label: "Extra Filter (optional)"
  }

# ==========================================
  # STEP 3
  # ==========================================

  parameter: step_3_event {
    suggest_explore: events_stream
    suggest_dimension: events_stream.event_name
    group_label: "Step 3"
    group_item_label: "Event Name"
  }

  parameter: step_3_category {
    suggest_explore: events_stream
    suggest_dimension: events_stream.event_category
    group_label: "Step 3"
    group_item_label: "Event Category (optional)"
  }

  parameter: step_3_extra_filter {
    type: unquoted
    description: "Extra filter SQL. Examples: strings.action = 'click' OR booleans.checked = TRUE"
    group_label: "Step 3"
    group_item_label: "Extra Filter (optional)"
  }


# ==========================================
  # STEP 4
  # ==========================================

  parameter: step_4_event {
    suggest_explore: events_stream
    suggest_dimension: events_stream.event_name
    group_label: "Step 4"
    group_item_label: "Event Name"
  }

  parameter: step_4_category {
    suggest_explore: events_stream
    suggest_dimension: events_stream.event_category
    group_label: "Step 4"
    group_item_label: "Event Category (optional)"
  }

  parameter: step_4_extra_filter {
    type: unquoted
    description: "Extra filter SQL. Examples: strings.action = 'click' OR booleans.checked = TRUE"
    group_label: "Step 4"
    group_item_label: "Extra Filter (optional)"
  }



  measure: step_1_clients { type: sum sql: ${TABLE}.step_1_clients ;; group_label: "Funnel Counts" }
  measure: step_2_clients { type: sum sql: ${TABLE}.step_2_clients ;; group_label: "Funnel Counts" }
  measure: step_3_clients { type: sum sql: ${TABLE}.step_3_clients ;; group_label: "Funnel Counts" }
  measure: step_4_clients { type: sum sql: ${TABLE}.step_4_clients ;; group_label: "Funnel Counts" }


  measure: step_1_to_2_conversion {
    type: number
    sql: SAFE_DIVIDE(${step_2_clients}, NULLIF(${step_1_clients}, 0)) ;;
    value_format_name: percent_1
    group_label: "Conversion Rates"
  }

  measure: step_2_to_3_conversion {
    type: number
    sql: SAFE_DIVIDE(${step_3_clients}, NULLIF(${step_2_clients}, 0)) ;;
    value_format_name: percent_1
    group_label: "Conversion Rates"
  }

  measure: step_3_to_4_conversion {
    type: number
    sql: SAFE_DIVIDE(${step_4_clients}, NULLIF(${step_3_clients}, 0)) ;;
    value_format_name: percent_1
    group_label: "Conversion Rates"
  }
}
