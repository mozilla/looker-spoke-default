include: "//looker-hub/firefox_ios/views/app_store_choice_screen_engagement.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: app_store_choice_screen_engagement {
  label: "Browser Choice Screen Engagement (iOS versions before 18.2)"

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${app_store_choice_screen_engagement.territory} = ${countries.code} ;;
  }
}
