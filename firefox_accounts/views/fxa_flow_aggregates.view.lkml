# note, this is intended to be a temporary solution for counting registrations and logins in a way that can be segmented by entrypoint and UTM parameters
# we are working on refactoring the FxA tables more generally.

view: fxa_flow_aggregates {
  derived_table: {
    interval_trigger: "24 hours"
    increment_key: "flow_start_date"
    # go back 2 days to allow recent flows to complete
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
              FROM firefox_accounts.fxa_content_auth_oauth_events
              WHERE DATE(timestamp) >= DATE(2022,9,1)
              AND event_type = 'fxa_email_first - view'
              GROUP BY 1
          ),

      flow_agg AS (
        SELECT
          f.*,
          event_type,
          COUNT(*) as n_events
        FROM flow_ids f
        LEFT JOIN firefox_accounts.fxa_content_auth_oauth_events e
        USING(flow_id)
        WHERE DATE(e.timestamp) >= DATE(2022,9,1)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12
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
      GROUP BY 1,2,3,4,5,6,7,8,9,10;;
  }

  dimension: flow_start_date {
    type: date
    datatype: date
    sql: ${TABLE}.flow_start_date ;;
  }

  dimension: entrypoint {
    type: string
    sql: ${TABLE}.entrypoint ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: browser_name {
    type: string
    sql: ${TABLE}.browser_name ;;
  }

  dimension: browser_version {
    type: string
    sql: ${TABLE}.browser_version ;;
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.os_name ;;
  }

  measure: total_flows_started {
    type: sum
    sql: ${TABLE}.total_flows_started ;;
  }

  measure: emails_submitted {
    type: sum
    sql: ${TABLE}.emails_submitted ;;
  }

  measure: emails_engaged {
    type: sum
    sql: ${TABLE}.emails_engaged ;;
  }

  measure: registrations_started {
    type: sum
    sql: ${TABLE}.registrations_started ;;
  }

  measure: logins_started {
    type: sum
    sql: ${TABLE}.logins_started ;;
  }

  measure: registrations_complete {
    type: sum
    sql: ${TABLE}.registrations_complete ;;
  }

  measure: logins_complete {
    type: sum
    sql: ${TABLE}.logins_complete ;;
  }

}
