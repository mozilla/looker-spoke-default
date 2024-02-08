include: "//looker-hub/firefox_desktop/views/*"
include: "/firefox_desktop/views/*"

explore: serp_impression {
  view_name: serp_impression
  label: "SERP Impressions"

  # Main join key is impression ID.
  # Also join on submission_date/normalized_channel/sample_id to propagate partitioning/clustering
  join: serp_components {
    sql_on: ${serp_impression.impression_id} = ${serp_components.impression_id}
      and ${serp_impression.submission_date} = ${serp_components.submission_date}
      and ${serp_impression.normalized_channel} = ${serp_components.normalized_channel}
      and ${serp_impression.sample_id} = ${serp_components.sample_id} ;;
    relationship: one_to_many
  }

  always_filter: {
    filters: [serp_impression.submission_date:"28 days"
    ]
  }
}
