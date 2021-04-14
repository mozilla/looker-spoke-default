view: client_properties {
  derived_table: {
    sql:
      SELECT
        *
      FROM
        mozdata.telemetry.clients_last_seen
      WHERE
        {% condition funnel_analysis.date %} CAST(clients_last_seen.submission_date AS TIMESTAMP) {% endcondition %};;
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

  dimension: is_default_browser {
    type: yesno
    sql: ${TABLE}.is_default_browser ;;
  }

  dimension: days_since_seen {
    hidden: yes
    type: number
    sql: ${TABLE}.days_since_seen ;;
  }

  measure: count_active_is_default_browser {
    label: "Count Active Is Default Browser"
    type: count

    filters: [is_default_browser: "yes", days_since_seen: "<1"]
  }

  measure: count_active_users {
    label: "Count Active Users"
    type: count

    filters: [days_since_seen: "<1"]
  }

  measure: fraction_is_default_browser {
    label: "Fraction Is Default Browser"
    sql: SAFE_DIVIDE(${count_active_is_default_browser}, ${count_active_users}) ;;
    type: number
  }
}
