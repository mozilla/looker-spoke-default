connection: "telemetry"
label: "Mozilla Ads Backend Service"

# Include all explores from looker-hub
include: "//looker-hub/ads/explores/*"

# Include specific view from looker-hub
include: "//looker-hub/ads/views/consolidated_ad_metrics_hourly.view.lkml"

explore: consolidated_ad_metrics_hourly {
  from: consolidated_ad_metrics_hourly
  description: "Metrics for Ads Consolidated Hourly"
}
