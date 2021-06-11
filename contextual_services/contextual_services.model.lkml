connection: "bigquery-oauth"
label: "Contextual Services"
include: "//looker-hub/contextual_services/explores/*"
include: "views/*"


explore: +event_aggregates {
  description: ""
}

explore: +quicksuggest_clicks {
  description: ""
}

explore: +quicksuggest_impressions {
  description: ""
}

explore: +topsites_clicks {
  description: ""
}

explore: +topsites_impressions {
  description: ""
}
