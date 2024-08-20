connection: "bigquery-oauth"

label: "Growth"
include: "views/android_app_campaign_stats.view.lkml"
include: "views/ios_app_campaign_stats.view.lkml"
include: "explores/browser_usage.explore.lkml"
include: "explores/device_usage.explore.lkml"
include: "explores/fenix_ltv.explore.lkml"
include: "explores/firefox_desktop_ltv.explore.lkml"
include: "explores/firefox_ios_ltv.explore.lkml"
include: "explores/operating_system_usage.explore.lkml"


explore: android_app_campaign_stats {
  label: "Android App Campaign Stats"
  description: "ROAS and Cost for Google  Ads App Campaigns for Firefox Android"
  view_name: android_app_campaign_stats
}

explore: iOS_app_campaign_stats {
  label: "iOS App Campaign Stats"
  description: "ROAS and Cost for Apple Search Ads App Campaigns for Firefox iOS"
  view_name: ios_app_campaign_stats
}
