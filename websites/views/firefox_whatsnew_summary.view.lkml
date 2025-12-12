include: "//looker-hub/websites/views/firefox_whatsnew_summary.view.lkml"

view: +firefox_whatsnew_summary {

  dimension_group: date {
    type: time
    # view_label: "Date/Period Selection"
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: cta_click_text {
    label: "CTA Click Text"
    type: string
    description: "This is the data-cta-text event param for GA4 cta_click events"
    sql:
    CASE
      WHEN ${event_name} = 'cta_click' THEN
        (
          SELECT ARRAY(
            SELECT ep.value.string_value
            FROM UNNEST(${TABLE}.event_params) AS ep
            WHERE ep.key = 'text'
          )[SAFE_OFFSET(0)]
        )
      ELSE NULL
    END ;;
  }

  measure: wnp_visits {
    description: "Unique visits to the wnp page"
    type: sum
    sql: ${TABLE}.visits ;;
  }

  measure: wnp_bounces {
    description: "Bounces on the wnp page"
    type: sum
    sql: ${TABLE}.bounces ;;
  }

  measure: cta_clicks {
    description: "Total count of cta_click events"
    type: count
    filters: [event_name: "cta_click"]
  }

  measure: newsletter_subscribe {
    description: "Total count of newsletter_subscribe events"
    type: count
    filters: [event_name: "newsletter_subscribe"]
  }

  measure: page_views {
    description: "Total count of page_views"
    type: count
    filters: [event_name: "page_view"]
  }

  measure: session_start_count {
    description: "Total count of session_start events"
    type: count
    filters: [event_name: "session_start"]
  }


  measure: engaged_sessions_counts {
    description: "Total count of distinct engaged sessions"
    type: count_distinct
    sql: ${visit_identifier} ;;
    filters: [engaged_session: "1"]
  }

  measure: engagement_rate {
    type: number
    sql: SAFE_DIVIDE(${engaged_sessions_counts}, ${session_start_count}) ;;
    value_format_name: percent_2
  }
}
