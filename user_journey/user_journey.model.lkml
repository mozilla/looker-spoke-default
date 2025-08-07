connection: "telemetry"

include: "//looker-hub/user_journey/views/events_daily.view.lkml"
include: "views/cohort_analysis/cohort_analysis.view.lkml"
include: "views/cohort_analysis/cohort_event_types.view.lkml"
include: "views/cohort_analysis/days_since_message.view.lkml"
include: "views/cohort_analysis/search_clients_last_seen.view.lkml"
include: "views/event_counts/onboarding_v1.view.lkml"
include: "views/funnel_analysis/browser_properties.view.lkml"
include: "views/funnel_analysis/days_of_use.view.lkml"
include: "views/funnel_analysis/event_types.view.lkml"
include: "views/funnel_analysis/funnel_analysis.view.lkml"
include: "views/event_type.view.lkml"
include: "views/raw_event_types.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/onboarding_table_last_updated.datagroup.lkml"

explore: funnel_analysis {
  view_label: " User-Day Funnels"
  join: experiments {
    relationship: one_to_one
    type: cross
    sql_where:
      {% if experiments.branch._is_filtered or experiments.experiment._is_filtered %}
        {% unless experiments.branch._is_selected and experiments.experiment._is_selected %}
          ERROR("""
            Must include both experiment and branch in the query as either selected fields or pivoted fields. This is to prevent incorrect counting of users.
            """)
        {% endunless %}
      {% elsif experiments.branch._is_selected %}
        {% unless experiments.experiment._is_selected %}
          ERROR("""
            When using branch in a query, must also include experiment as a selected field.
            This is to prevent the incorrect counting of users.
            """)
        {% endunless %}
      {% endif %};;
  }
  join: days_of_use {
    view_label: "Days of Use"
    relationship: one_to_one
    type: left_outer
    sql_on: ${funnel_analysis.sample_id} = ${days_of_use.sample_id}
        AND ${funnel_analysis.client_id} = ${days_of_use.client_id}
        AND (${funnel_analysis.submission_date} = DATE_SUB(${days_of_use.submission_date}, INTERVAL 56 DAY)
              OR (${days_of_use.submission_date} = DATE_SUB(current_date, INTERVAL 2 DAY)
                  AND DATE_ADD(${funnel_analysis.submission_date}, INTERVAL 56 DAY) >  DATE_SUB(current_date, INTERVAL 2 DAY)));;
  }
  join: browser_properties {
    relationship: one_to_one
    type: left_outer
    sql_where: browser_properties.submission_date BETWEEN DATE_SUB(DATE({% date_start funnel_analysis.date %}), INTERVAL {% parameter browser_properties.diff_days %} DAY) AND DATE_SUB(DATE({% date_end funnel_analysis.date %}), INTERVAL {% parameter browser_properties.diff_days %} DAY);;
    sql_on: ${funnel_analysis.sample_id} = ${browser_properties.sample_id}
      AND ${funnel_analysis.client_id} = ${browser_properties.client_id}
      AND ${funnel_analysis.submission_date} = DATE_SUB(${browser_properties.submission_date}, INTERVAL {% parameter browser_properties.diff_days %} DAY);;
    fields: [
      browser_properties.fraction_is_default_browser,
      browser_properties.is_default_browser,
      browser_properties.count_is_default_browser,
      browser_properties.scalar_parent_os_environment_is_taskbar_pinned,
      browser_properties.fraction_is_taskbar_pinned,
      browser_properties.count_is_taskbar_pinned,
      diff_days]
  }
  join: event_type_1 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_2 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_3 {
    relationship: many_to_one
    type: cross
  }
  join: event_type_4 {
    relationship: many_to_one
    type: cross
  }
  always_filter: {
    filters: [
      date: "14 days",
      # Caret tells Looker to use "Is Equal To" matching rather than "Matches (advanced)"
      event_type_1.message_id: "ABOUT^_WELCOME",
      event_type_1.event_type: "IMPRESSION",
    ]
  }

  query: about_welcome_click {
    filters: [
      funnel_analysis.submission_date: "14 days",
      event_type_1.event_type: "IMPRESSION",
      event_type_1.message_id: "ABOUT^_WELCOME",
      event_type_2.event_type: "CLICK^_BUTTON",
      event_type_2.message_id: "ABOUT^_WELCOME",
    ]
    pivots: []
    dimensions: [funnel_analysis.submission_date]
    measures: [funnel_analysis.count_user_days_event1, funnel_analysis.count_user_days_event2]
    label: "About Welcome Funnel: Impression to Click"
  }

  query: about_welcome_click_dou {
    filters: [
      funnel_analysis.submission_date: "14 days",
      event_type_1.event_type: "IMPRESSION",
      event_type_1.message_id: "ABOUT^_WELCOME",
      event_type_2.event_type: "CLICK^_BUTTON",
      event_type_2.message_id: "ABOUT^_WELCOME",
      funnel_analysis.completed_event_1: "yes",
      days_of_use.7_day_avg_days_of_use: ">0"
    ]
    pivots: [completed_event_2]
    dimensions: [funnel_analysis.submission_date, completed_event_2]
    measures: [days_of_use.7_day_avg_days_of_use]
    label: "About Welcome Funnel: 7-day DOU"
  }

  sql_always_where: funnel_analysis.submission_date > "2010-01-01" ;;
}

explore: cohort_analysis {
  view_label: " User Properties"
  from: cohort
  join: cohort_event_type_1 {
    view_label: "Cohort 1"
    relationship: one_to_one
    type: cross
  }
  join: cohort_event_type_2 {
    view_label: "Cohort 2"
    relationship: one_to_one
    type: cross
  }
  join: cohort_event_type_3 {
    view_label: "Cohort 3"
    relationship: one_to_one
    type: cross
  }
  join: cohort_event_type_4 {
    view_label: "Cohort 4"
    relationship: one_to_one
    type: cross
  }
  join: days_since_message {
    relationship: many_to_one
    type: cross
  }
  join: search_clients_last_seen {
    fields: []
    relationship: one_to_one
    type: left_outer
    sql_on: ${cohort_analysis.sample_id} = ${search_clients_last_seen.sample_id}
        AND ${cohort_analysis.client_id} = ${search_clients_last_seen.client_id}
        AND (${cohort_analysis.submission_date} = DATE_SUB(${search_clients_last_seen.submission_date}, INTERVAL 56 DAY)
              OR (${search_clients_last_seen.submission_date} = DATE_SUB(current_date, INTERVAL 2 DAY)
                  AND DATE_ADD(${cohort_analysis.submission_date}, INTERVAL 56 DAY) >  DATE_SUB(current_date, INTERVAL 2 DAY)));;
  }
  sql_always_where: cohort_analysis.submission_date > "2010-01-01" ;;
  always_filter: {
    filters: [
      date: "14 days",
      days_since_message.time_period: "7",
      cohort_event_type_1.event_type: "IMPRESSION",
      cohort_event_type_1.message_id: "ABOUT^_WELCOME",
    ]
  }
  query: about_welcome_cohorts {
    dimensions: [days_since_message.days_since_message]
    measures: [
      cohort_event_type_1.average_days_of_use,
      cohort_event_type_2.average_days_of_use,
      cohort_event_type_3.average_days_of_use,
    ]
    label: "About Welcome - Cohorts"
    description: "Average days of use for two weeks"
    filters: [
      date: "21 days",
      days_since_message.time_period: "14",
      cohort_event_type_1.event_type: "IMPRESSION",
      cohort_event_type_1.message_id: "ABOUT^_WELCOME",
      cohort_event_type_2.event_type: "CLICK^_BUTTON",
      cohort_event_type_2.message_id: "ABOUT^_WELCOME",
      cohort_event_type_3.event_type: "SESSION^_END",
      cohort_event_type_3.message_id: "ABOUT^_WELCOME",
    ]
    limit: 100
  }
}

explore: event_counts {
  from: onboarding_v1
  persist_with: onboarding_table_last_updated

  join: onboarding_v1__experiments {
    type: cross
    relationship: one_to_many
    view_label: "Experiments"
  }
  join: message_id_ranks {
    fields: [rank]
    type: inner
    relationship: many_to_one
    sql_on: ${event_counts.message_id} = ${message_id_ranks.message_id} ;;
  }

  always_filter: {
    filters: [
      submission_timestamp_date: "14 days",
    ]
  }

  query: top_ten_messages {
    pivots: [event_counts.message_id]
    dimensions: [event_counts.submission_timestamp_date, event_counts.message_id]
    measures: [event_counts.event_count]
    filters: [
      event_counts.submission_timestamp_date: "21 days",
      event_counts.event: "IMPRESSION",
      message_id_ranks.rank: "<=10"
    ]
    label: "Top 10 Impression Events"
    limit: 500
  }
  sql_always_where: DATE(submission_timestamp) > '2020-01-01'
    ;;
}


# The following are used just for suggestions

explore: event_names {
  hidden: yes
  from: raw_event_types
}

explore: events_daily_sample {
  hidden: yes
  from: events_daily
  sql_always_where:
    events_daily_sample.submission_date >= DATE_SUB(current_date, INTERVAL 7 DAY)
    AND events_daily_sample.sample_id = 42;;
}

explore: event_property_page {
  from: raw_event_types
  hidden: yes
  sql_always_where: property_name = 'page';;
}

explore: event_property_source {
  hidden: yes
  from: raw_event_types
  sql_always_where: property_name = 'source';;
}

explore: event_property_domState {
  hidden: yes
  from: raw_event_types
  sql_always_where: property_name = 'domState';;
}

explore: event_property_reason {
  hidden: yes
  from: raw_event_types
  sql_always_where: property_name = 'reason';;
}

explore: event_property_display {
  hidden: yes
  from: raw_event_types
  sql_always_where: property_name = 'display';;
}

explore: experiment_names {
  hidden: yes
}
