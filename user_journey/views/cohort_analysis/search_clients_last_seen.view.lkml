view: search_clients_last_seen {
  derived_table:{
    sql:
      SELECT
        *
      FROM
        `moz-fx-data-shared-prod`.search.search_clients_last_seen AS clients_last_seen
      WHERE
        {% condition cohort_analysis.date %} CAST(DATE_SUB(clients_last_seen.submission_date, INTERVAL 56 DAY) AS TIMESTAMP) {% endcondition %}
        OR clients_last_seen.submission_date = DATE_SUB(current_date, INTERVAL 2 DAY)
        AND {% if days_since_message.days_since_message._is_selected %}
          TRUE
        {% else %}
          ERROR("""
            Must use the days_since_mesage.days_since_message dimension in this explore.
            This explore CROSS JOINS with all possible days. Unless we GROUP BY each of those days,
            we'll get incorrect results for the outputted measures.""")
        {% endif %};;
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

  dimension: day_diff_cohorts {
    type: number
    sql:  DATE_DIFF(${TABLE}.submission_date, ${cohort_analysis.submission_date}, DAY);;
    hidden: yes
  }

  dimension: days_seen_bytes {
    type: string
    sql: ${TABLE}.days_seen_bytes ;;
  }

  dimension: days_seen_bits {
    type: string
    sql:
      IF(${day_diff_cohorts} >= days_since_message.days_since_message,
         mozfun.bytes.extract_bits(${days_seen_bytes}, (-1 * ${day_diff_cohorts}), days_since_message.days_since_message),
         NULL);;
  }

  dimension: days_of_use {
    type: number
    sql: BIT_COUNT(${days_seen_bits}) ;;
    hidden: yes
  }
}
