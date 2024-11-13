include: "//looker-hub/search/explores/mobile_search_counts.explore.lkml"
include: "/shared/views/countries.view.lkml"
#include: "//looker-hub/search/datagroups/mobile_search_clients_daily_v1_last_updated.datagroup.lkml"

explore: +mobile_search_counts {
  description: "Mobile search counts and ad clicks.
  Includes searches from ways to search in the browser (called Search Access Points or SAPs),
  like the URL bar and newtab page. Follow-on searches are those that are after entry from a
  SAP, and organic searches are those that occur directly on a search webpage (e.g. www.google.com).
  Warning: Firefox iOS is not able to implement all metrics, like ad clicks."

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_search_clients_engines_sources_daily.country} = ${countries.code} ;;
  }

  #persist_with: mobile_search_clients_daily_v1_last_updated

}
