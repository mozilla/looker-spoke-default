include: "../views/marketing_attributable_dau.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: marketing_attributable_dau {
  label: "MozMark  Attributable DAU"
  view_name: marketing_attributable_dau

sql_always_where: ${period_filtered_measures} in ("this", "last") ;;

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${marketing_attributable_dau.country} = ${countries.code} ;;
  }
}
