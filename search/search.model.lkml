connection: "telemetry"
label: "Search"
include: "//looker-hub/search/explores/*"
include: "views/*"

explore: +desktop_search_counts {
  description: "Desktop search counts and ad clicks.
    Includes searches from ways to search in the browser (called Search Access Points or SAPs),
    like the URL bar and newtab page. Follow-on searches are those that are after entry from a
    SAP, and organic searches are those that occur directly on a search webpage (e.g. www.google.com)."
}

explore: +mobile_search_counts {
  description: "Mobile search counts and ad clicks.
    Includes searches from ways to search in the browser (called Search Access Points or SAPs),
    like the URL bar and newtab page. Follow-on searches are those that are after entry from a
    SAP, and organic searches are those that occur directly on a search webpage (e.g. www.google.com).
    Warning: Firefox iOS is not able to implement all metrics, like ad clicks."
}
