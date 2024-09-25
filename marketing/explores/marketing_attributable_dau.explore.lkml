include: "../views/marketing_attributable_dau.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: marketing_attributable_dau {
  label: "MozMark DAU"
  view_name: marketing_attributable_dau

  always_filter: {
    filters: [
      marketing_attributable_dau.app_name: "Firefox Desktop, Firefox Desktop BrowserStack, Fenix, Fenix BrowserStack, Firefox iOS, Firefox iOS BrowserStack,
    Focus Android,  Focus iOS, Focus iOS BrowserStack"]
  }

  sql_always_where:
  AND ${paid_vs_organic} = "Paid";;

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${marketing_attributable_dau.country} = ${countries.code} ;;
  }
}
