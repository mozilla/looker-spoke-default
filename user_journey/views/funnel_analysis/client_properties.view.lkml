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

  measure: count_is_default_browser {
    label: "Count Is Default Browser"
    type: count

    filters: [is_default_browser: "yes"]
  }

  measure: count_clients {
    label: "Count Clients"
    type: count
  }

  measure: fraction_is_default_browser {
    label: "Fraction Is Default Browser"
    sql: SAFE_DIVIDE(${count_is_default_browser}, ${count_clients}) ;;
    type: number
  }
}
