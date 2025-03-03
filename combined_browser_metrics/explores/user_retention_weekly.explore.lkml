include: "../views/cohort_weekly_statistics.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: user_retention_weekly {
    view_name: cohort_weekly_statistics

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cohort_daily_statistics.country} = ${countries.code} ;;
  }
}
