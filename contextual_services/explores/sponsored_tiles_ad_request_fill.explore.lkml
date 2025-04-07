include: "/contextual_services/views/sponsored_tiles_ad_request_fill.view.lkml"
include: "//looker-hub/contextual_services/datagroups/sponsored_tiles_ad_request_fill_last_updated.datagroup.lkml"

explore: sponsored_tiles_ad_request_fill {

  view_name: sponsored_tiles_ad_request_fill
  view_label: "Sponsored Tiles Ad Request Fill"
  description: "Sponsored Tiles adMarketplace advertiser request fill and related metrics."

  # always_filter: {
  #   filters: [
  #     revenue_data_admarketplace.date_date: "3 months"
  #   ]
  # }

  persist_with: sponsored_tiles_ad_request_fill_last_updated
}
