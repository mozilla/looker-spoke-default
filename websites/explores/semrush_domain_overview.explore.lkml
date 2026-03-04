include: "//looker-hub/websites/explores/semrush_domain_overview.explore.lkml"
include: "../views/semrush_domain_overview.view.lkml"
include: "../views/marketing_country_tier_mapping.view.lkml"

explore: +semrush_domain_overview {
  sql_always_where: ${semrush_domain_overview.submission_date} >= '2026-02-25' ;;

  join: marketing_country_tier_mapping {
    type: left_outer
    relationship: many_to_one
    sql_on: ${semrush_domain_overview.country_code} = ${marketing_country_tier_mapping.country_code} ;;
  }
}
