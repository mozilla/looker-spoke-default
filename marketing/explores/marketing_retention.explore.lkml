include: "../views/marketing_retention.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: marketing_retention {
  label: "MozMark Retention"
  view_name: marketing_retention

  sql_always_where: ${metric_date} >= "2023-01-01" AND ${period_filtered_measures} in ("this", "last")
  AND ${paid_vs_organic} = 'Paid';;


  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${marketing_retention.country} = ${countries.code} ;;
  }
}
