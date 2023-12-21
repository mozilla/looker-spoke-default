include: "../views/use_counters.view.lkml"
include: "/shared/views/*"

explore: fenix_and_firefox_use_counters {
  view_name: ff_use_counters

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${ff_use_counters.country} = ${countries.code} ;;
  }

}
