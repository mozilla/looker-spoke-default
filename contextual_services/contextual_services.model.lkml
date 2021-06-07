connection: "bigquery-oauth"
label: "Contextual Services"
include: "//looker-hub/contextual_services/explores/*"
include: "views/*"


explore: +event_aggregates {
  description: "Daily event rollups. This aggregated dataset is faster to query and contains a longer history."
}

explore: +quicksuggest_clicks {
  description: "
    The QuickSuggest click ping is sent when the user clicks on the QuickSuggest link.
    It shares most of the fields as the QuickSuggest impression ping except that it doesn’t include the user search query, nor the matched keywords.
    QuickSuggest click pings may also be sent with a lower latency than impression pings - that is, we may recieve the click before we recieve the impression.
    This data is kept for 30 days."
}

explore: +quicksuggest_impressions {
  description: "
    This impression ping is only sent on two conditions:
    A user completes the search session in the URL bar, i.e. he or she navigates away from the search bar, AND
    a QuickSuggest link was shown in the URL bar at the end of the search session.
    This means that any QuickSuggest link(s) that were displayed while the user was still typing would not trigger this impression ping.
    This data is kept for 30 days."
}

explore: +topsites_clicks {
  description: "A topsites click ping is sent when a user clicks on a sponsored top site. This data is kept for 30 days."
}

explore: +topsites_impressions {
  description: "A topsites impression ping is sent on impressions of sponsored topsites. This data is kept for 30 days."
}
