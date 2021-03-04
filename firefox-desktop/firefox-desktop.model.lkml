connection: "telemetry"

include: "views/*.view.lkml"                # include all views in the views/ folder in this project

explore: client_counts {
  always_filter: {
    filters: [
      sample_id: "42",
      submission_date: "4 weeks",
    ]
  }
}

explore: event_names {
  from: event_types_legacy
  hidden: yes
}

explore: funnel_analysis {
  from: events
  join: event_1 {
    view_label: "Funnel Event 1"
    from: event_types_legacy
    relationship: many_to_one
    type: cross
  }
  join: event_2 {
    view_label: "Funnel Event 2"
    from: event_types_legacy
    relationship: many_to_one
    type: cross
  }
  join: event_3 {
    view_label: "Funnel Event 3"
    from: event_types_legacy
    relationship: many_to_one
    type: cross
  }
  join: event_4 {
    view_label: "Funnel Event 4"
    from: event_types_legacy
    relationship: many_to_one
    type: cross
  }
  always_filter: {
    filters: [
      submission_date: "1 year",
      event_1.name: "",
      event_2.name: "",
      event_3.name: "",
      event_4.name: ""
    ]
  }
  sql_always_where: funnel_analysis.submission_date > "2010-01-01" ;;
}
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
