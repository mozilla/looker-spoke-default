include: "/firefox_desktop/views/serp_impression.view.lkml"

explore: serp_impression {
  view_name: serp_impression
  label: "SERP Impressions"

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
