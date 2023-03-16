# note, this is intended to be a temporary solution for counting registrations and logins in a way that can be segmented by entrypoint and UTM parameters
# we are working on refactoring the FxA tables more generally.

view: fxa_flow_aggregates {
  derived_table: {
    interval_trigger: "24 hours"
    increment_key: "flow_start_date"
    increment_offset: 2
    sql: WITH
          flow_ids AS (
              SELECT
                  flow_id,
                  ANY_VALUE(entrypoint) AS entrypoint,
                  ANY_VALUE(utm_source) AS utm_source,
                  ANY_VALUE(utm_medium) AS utm_medium,
                  ANY_VALUE(utm_term) AS utm_term,
                  ANY_VALUE(utm_campaign) AS utm_campaign,
                  ANY_VALUE(country) AS country,
                  ANY_VALUE(ua_browser) AS browser_name,
                  ANY_VALUE(ua_version) AS browser_version,
                  ANY_VALUE(os_name) AS os_name,
                  MIN(DATE(timestamp)) AS flow_start_date,
              FROM firefox_accounts.fxa_all_events
              WHERE DATE(timestamp) >= DATE(2022,9,1)
              AND event_type = 'fxa_email_first - view'
              AND fxa_log IN ('content', 'auth', 'oauth')
              GROUP BY 1
          ),

      flow_agg AS (
        SELECT
          f.flow_id,
          f.entrypoint,
          f.utm_source,
          f.utm_medium,
          f.utm_term,
          f.utm_campaign,
          f.country,
          f.browser_name,
          f.browser_version,
          f.os_name,
          TIMESTAMP(f.flow_start_date) AS flow_start_date,
          e.event_type,
          COUNT(*) as n_events
        FROM flow_ids f
        LEFT JOIN firefox_accounts.fxa_all_events e
        USING(flow_id)
        WHERE DATE(e.timestamp) >= DATE(2022,9,1)
        AND e.fxa_log IN ('content', 'auth', 'oauth')
      GROUP BY
          f.flow_id,
          f.entrypoint,
          f.utm_source,
          f.utm_medium,
          f.utm_term,
          f.utm_campaign,
          f.country,
          f.browser_name,
          f.browser_version,
          f.os_name,
          f.flow_start_date,
          e.event_type
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
        COUNTIF(event_type = 'fxa_email_first - submit') AS emails_submitted,
        COUNTIF(event_type = 'fxa_email_first - engage') AS emails_engaged,
        COUNTIF(event_type = 'fxa_reg - view') AS registrations_started,
        COUNTIF(event_type = 'fxa_login - view') AS logins_started,
        COUNTIF(event_type = 'fxa_reg - complete') AS registrations_complete,
        COUNTIF(event_type = 'fxa_login - complete') AS logins_complete,
      FROM flow_agg
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
