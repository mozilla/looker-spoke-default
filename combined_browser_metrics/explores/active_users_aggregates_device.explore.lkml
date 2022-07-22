include: "../views//active_users_aggregates_device.view.lkml"
include: "/shared/views/*"

explore: active_users_aggregates_device {
  always_filter: {
    filters: [active_users_aggregates_device.submission_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates_device.country} = ${countries.code} ;;
  }

}
