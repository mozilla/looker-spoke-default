include: "../views/marketing_retention_desktop.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: marketing_retention_desktop {
  label: "MozMark Retention Desktop"
  view_name: marketing_retention_desktop

  sql_always_where: ${period_filtered_measures} in ("this", "last")
                AND ${is_desktop}
                AND ${paid_vs_organic} = "Paid"
                AND ${metric_date} = ${first_seen_date}
                AND ${filter_end_date} >= "2023-01-01";;


  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${marketing_retention_desktop.country} = ${countries.code} ;;
  }
}
