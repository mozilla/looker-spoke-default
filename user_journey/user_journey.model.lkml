connection: "telemetry"

include: "//looker-hub/user_journey/views/events_daily.view.lkml"
include: "/user_journey/views/*/*.view.lkml"                # include all views in the views/ folder in this project
include: "/user_journey/views/*.view.lkml"

explore: funnel_analysis {
  view_label: " User-Day Funnels"
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
  view_label: " User-Days"
  from: cohort
  join: message_ids {
    relationship: many_to_one
    type: cross
  }
  join: days_since_message {
    relationship: many_to_one
    type: cross
  }
  join: clients_last_seen {
    view_label: "Days of Use"
    relationship: one_to_one
    type: left_outer
    sql_on: ${cohort_analysis.sample_id} = ${clients_last_seen.sample_id}
        AND ${cohort_analysis.client_id} = ${clients_last_seen.client_id}
        AND (${cohort_analysis.submission_date} = DATE_SUB(${clients_last_seen.submission_date}, INTERVAL 56 DAY)
              OR (${clients_last_seen.submission_date} = DATE_SUB(current_date, INTERVAL 2 DAY)
                  AND DATE_ADD(${cohort_analysis.submission_date}, INTERVAL 56 DAY) >  DATE_SUB(current_date, INTERVAL 2 DAY)));;
  }
  sql_always_where: cohort_analysis.submission_date > "2010-01-01" ;;
  always_filter: {
    filters: [
      date: "14 days",
      days_since_message.time_period: "7",
      message_ids.message_event: "ABOUT^_WELCOME - IMPRESSION",
    ]
  }
  query: about_welcome_cohorts {
    pivots: [message_ids.message_event]
    dimensions: [days_since_message.days_since_message, message_ids.message_event]
    measures: [clients_last_seen.average_days_of_use]
    label: "About Welcome - Cohorts"
    description: "Average days of use for two weeks"
    filters: [
      date: "21 days",
      days_since_message.time_period: "14",
      message_ids.message_event: "ABOUT^_WELCOME - IMPRESSION,ABOUT^_WELCOME - CLICK^_BUTTON,ABOUT^_WELCOME - SESSION^_END"
    ]
    limit: 100
  }
}

explore: event_counts {
  from: onboarding_v1
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
