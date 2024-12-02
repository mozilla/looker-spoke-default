include: "../views/use_counters.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: fenix_and_firefox_use_counters {
  view_name: fenix_and_firefox_use_counters

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${fenix_and_firefox_use_counters.country} = ${countries.code} ;;
  }

}
