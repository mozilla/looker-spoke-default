include: "../views/new_profile_activation_table.view.lkml"
include: "/shared/views/*"

explore: firefox_ios_new_profile_activation {
  label: "Activation Metric for Firefox for iOS"
  view_name: new_profile_activation_table

  always_filter: {
    filters: [new_profile_activation_table.submission_date: "7 days",]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${new_profile_activation_table.country} = ${countries.code} ;;
  }
}
