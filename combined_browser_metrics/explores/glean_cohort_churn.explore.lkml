include: "../views/glean_cohort_daily_churn.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: glean_cohort_daily_churn {
  view_name: glean_cohort_daily_churn

  always_filter: {
    filters: [glean_cohort_daily_churn.cohort_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${glean_cohort_daily_churn.country} = ${countries.code} ;;
  }

}
