include: "../views//cohort_churn.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: cohort_churn {
  view_name: cohort_churn

  always_filter: {
    filters: [cohort_churn.activity_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cohort_churn.country} = ${countries.code} ;;
  }

}
