view: days_of_use {
  derived_table:{
    sql:
      SELECT
        *
      FROM
        `moz-fx-data-shared-prod`.search.search_clients_last_seen AS clients_last_seen
      WHERE
        -- We add a filter here based on the dates selected using the date filter
        -- Technically we shouldn't need this, since the JOIN with `funnel_analysis` should predicate which partitions
        -- we want to include.
        -- However, because we're looking to join with the date that is:
        --   MIN(56 days from funnel_analysis.submission_date, 2 days before current_date)
        -- BQ doesn't know how to properly push that predicate, and includes all data greater than the submission_date.
        {% condition funnel_analysis.date %} CAST(DATE_SUB(clients_last_seen.submission_date, INTERVAL 56 DAY) AS TIMESTAMP) {% endcondition %}
        OR clients_last_seen.submission_date = DATE_SUB(current_date, INTERVAL 2 DAY);;
  }

  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
    hidden: yes
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: sample_id {
    type: string
    sql: ${TABLE}.sample_id ;;
    hidden: yes
  }

  dimension: day_diff_funnels {
    type: number
    sql:  DATE_DIFF(${TABLE}.submission_date, ${funnel_analysis.submission_date}, DAY);;
    hidden: yes
  }

  dimension: days_seen_bytes {
    type: string
    sql: ${TABLE}.days_seen_bytes ;;
  }

  dimension: days_seen_bits_56 {
    type: string
    sql: IF(${day_diff_funnels} >= 56,
            mozfun.bytes.extract_bits(${days_seen_bytes}, -1 * ${day_diff_funnels}, 56),
            NULL) ;;
    hidden: yes
  }

  dimension: days_seen_bits_28 {
    type: string
    sql: IF(${day_diff_funnels} >= 28,
            mozfun.bytes.extract_bits(${days_seen_bytes}, -1 * ${day_diff_funnels}, 28),
            NULL) ;;
    hidden: yes
  }

  dimension: days_seen_bits_14 {
    type: string
    sql: IF(${day_diff_funnels} >= 14,
            mozfun.bytes.extract_bits(${days_seen_bytes}, -1 * ${day_diff_funnels}, 14),
            NULL) ;;
    hidden: yes
  }

  dimension: days_seen_bits_7 {
    type: string
    sql: IF(${day_diff_funnels} >= 7,
            mozfun.bytes.extract_bits(${days_seen_bytes}, -1 * ${day_diff_funnels}, 7),
            NULL) ;;
    hidden: yes
  }

  dimension: days_of_use_56 {
    type: number
    sql: BIT_COUNT(${days_seen_bits_56}) ;;
    hidden: yes
  }

  dimension: days_of_use_28 {
    type: number
    sql: BIT_COUNT(${days_seen_bits_28}) ;;
    hidden: yes
  }

  dimension: days_of_use_14 {
    type: number
    sql: BIT_COUNT(${days_seen_bits_14}) ;;
    hidden: yes
  }

  dimension: days_of_use_7 {
    type: number
    sql: BIT_COUNT(${days_seen_bits_7}) ;;
    hidden: yes
  }

  measure: 56_day_total_days_of_use {
    type: sum
    sql: ${days_of_use_56} ;;
  }

  measure: 56_day_avg_days_of_use {
    type: average
    sql: ${days_of_use_56} ;;
  }

  measure: 28_day_total_days_of_use {
    type: sum
    sql: ${days_of_use_28} ;;
  }

  measure: 28_day_avg_days_of_use {
    type: average
    sql: ${days_of_use_28} ;;
  }

  measure: 14_day_total_days_of_use {
    type: sum
    sql: ${days_of_use_14} ;;
  }

  measure: 14_day_avg_days_of_use {
    type: average
    sql: ${days_of_use_14} ;;
  }

  measure: 7_day_total_days_of_use {
    label: " 7 Day Total Days of Use" # Space sorts this before e.g. 14
    type: sum
    sql: ${days_of_use_7} ;;
  }

  measure: 7_day_avg_days_of_use {
    label: " 7 Day Avg Days of Use" # Space sorts this before e.g. 14
    type: average
    sql: ${days_of_use_7} ;;
  }
}
