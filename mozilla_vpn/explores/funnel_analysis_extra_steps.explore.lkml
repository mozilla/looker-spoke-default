include: "/spoke-default/mozilla_vpn/views/funnel_analysis_extra_steps.view.lkml"

explore: funnel_analysis_extra_steps {
  description: "Count funnel completion over time. Funnels are limited to a single day."
  view_label: " User-Day Funnels"

  always_filter: {
    filters: [
      submission_date: "14 days",
    ]
  }

  join: step_1 {
    relationship: many_to_one
    type: cross
  }

  join: step_2 {
    relationship: many_to_one
    type: cross
  }

  join: step_3 {
    relationship: many_to_one
    type: cross
  }

  join: step_4 {
    relationship: many_to_one
    type: cross
  }

  join: step_5 {
    relationship: many_to_one
    type: cross
  }

  join: step_6 {
    relationship: many_to_one
    type: cross
  }

  join: step_7 {
    relationship: many_to_one
    type: cross
  }

  join: step_8 {
    relationship: many_to_one
    type: cross
  }
  sql_always_where: ${funnel_analysis_extra_steps.submission_date} >= '2010-01-01' ;;
}

# explore: event_names {
#   hidden: yes
# }
