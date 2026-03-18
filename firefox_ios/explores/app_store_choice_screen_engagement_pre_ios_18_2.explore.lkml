include: "/firefox_ios/views/app_store_choice_screen_engagement_pre_ios_18_2.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: app_store_choice_screen_engagement_pre_ios_18_2 {
  label: "Browser Choice Screen Engagement (iOS versions before 18.2)."

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${app_store_choice_screen_engagement_pre_ios_18_2.territory} = ${countries.code} ;;
  }

  query: app_store_stats_pivot_on_event {
    description: "Choice Screen Engagement stats (pivot on event)."
    dimensions: [
      app_store_choice_screen_engagement_pre_ios_18_2.date_date,
      app_store_choice_screen_engagement_pre_ios_18_2.app_name,
      app_store_choice_screen_engagement_pre_ios_18_2.event
    ]
    measures: [
      app_store_choice_screen_engagement_pre_ios_18_2.counts,
      app_store_choice_screen_engagement_pre_ios_18_2.unique_devices
    ]
    pivots: [
      app_store_choice_screen_engagement_pre_ios_18_2.event
    ]
  }

  query: events_last_month_unique_devices {
    description: "Events in the last month (unique devices)."
    dimensions: [event]
    measures: [unique_devices]
    filters: [app_store_choice_screen_engagement_pre_ios_18_2.date_date: "1 months"]
  }
}
