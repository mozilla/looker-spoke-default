# note, this is intended to be a temporary solution for counting registrations and logins in a way that can be segmented by entrypoint and UTM parameters
# we are working on refactoring the FxA tables more generally.

view: fxa_flow_aggregates {
  derived_table: {
    interval_trigger: "24 hours"
    increment_key: "flow_start_date"
    increment_offset: 2
    sql: WITH unnested_base AS (
      SELECT *
      FROM firefox_accounts.fxa_flows_v1,
      UNNEST(flow_events) AS flow_event
    )

    SELECT
      flow_start_date,
      entrypoint,
      utm_source,
      utm_medium,
      utm_term,
      utm_campaign,
      country,
      browser_name,
      browser_version,
      os_name,
      COUNT(DISTINCT flow_id) AS total_flows_started,
      COUNTIF(
        flow_event.category = 'fxa_email_first' AND flow_event.`event` = 'submit'
      ) AS emails_submitted,
      COUNTIF(
        flow_event.category = 'fxa_email_first' AND flow_event.`event` = 'engage'
      ) AS emails_engaged,
      COUNTIF(
        flow_event.category = 'fxa_reg' AND flow_event.`event` = 'view'
      ) AS registrations_started,
      COUNTIF(
        flow_event.category = 'fxa_reg' AND flow_event.`event` = 'complete'
      ) AS registrations_complete,
      COUNTIF(
        flow_event.category = 'fxa_login' AND flow_event.`event` = 'view'
      ) AS logins_started,
      COUNTIF(
        flow_event.category = 'fxa_login' AND flow_event.`event` = 'complete'
      ) AS logins_complete,
    FROM unnested_base
    WHERE {% incrementcondition %} flow_start_date {% endincrementcondition %}
    GROUP BY 1,2,3,4,5,6,7,8,9,10;;
  }
  dimension_group: flow_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: timestamp
    sql: ${TABLE}.flow_start_date;;
  }

  dimension: entrypoint {
    type: string
    sql: ${TABLE}.entrypoint ;;
    description: "The Entrypoint Parameter Passed to FxA"
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
    description: "The UTM Source Parameter Passed to FxA"
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
    description: "The UTM Medium Parameter Passed to FxA"
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
    description: "The UTM Term Parameter Passed to FxA"
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
    description: "The UTM Campaign Parameter Passed to FxA"
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
    description: "Full Country Name"
  }

  dimension: browser_name {
    type: string
    sql: ${TABLE}.browser_name ;;
    description: "From The User Agent"
  }

  dimension: browser_version {
    type: string
    sql: ${TABLE}.browser_version ;;
    description: "From The User Agent"
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.os_name ;;
    description: "From The User Agent"
  }

  measure: total_flows_started {
    type: sum
    sql: ${TABLE}.total_flows_started ;;
    description: "Total Unique Flow IDs"
  }

  measure: emails_submitted {
    type: sum
    sql: ${TABLE}.emails_submitted ;;
    description: "Total Unique Flow IDs submitting Email (First FxA Step)"
  }

  measure: emails_engaged {
    type: sum
    sql: ${TABLE}.emails_engaged ;;
    description: "Total Unique Flow IDs engaging Email Form (First FxA Step)"
  }

  measure: registrations_started {
    type: sum
    sql: ${TABLE}.registrations_started ;;
    description: "Total Unique Flow IDs starting registration (new accounts), after email submission"
  }

  measure: logins_started {
    type: sum
    sql: ${TABLE}.logins_started ;;
    description: "Total Unique Flow IDs starting login (existing accounts), after email submission"
  }

  measure: registrations_complete {
    type: sum
    sql: ${TABLE}.registrations_complete ;;
    description: "Total Unique Flow IDs finishing registration (new accounts)"
  }

  measure: logins_complete {
    type: sum
    sql: ${TABLE}.logins_complete ;;
    description: "Total Unique Flow IDs finishing login (existing accounts)"
  }

}
