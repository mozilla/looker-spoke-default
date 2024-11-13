include: "/firefox_desktop/views/serp_impression.view.lkml"

explore: serp_impression {
  view_name: serp_impression
  label: "SERP Impressions"
  view_label: "SERP Impressions"
  description: "
    SERP page features, SERP ad impressions and engagements, other SERP components.
    For metrics at the level of SERP page loads, use the 'SERP Impression' fields only.
    For impression and engagement metrics by ad component, use the 'Ad Components' fields
    along with the Ad Component dimension.
  "

  join: serp_impression__ad_components {
    view_label: "Ad Components"
    sql: CROSS JOIN UNNEST(${serp_impression.ad_components}) AS serp_impression__ad_components ;;
    relationship: one_to_many
  }

  always_filter: {
    filters: [serp_impression.submission_date:"28 days"
    ]
  }
}
