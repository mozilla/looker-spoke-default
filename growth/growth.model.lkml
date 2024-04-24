connection: "bigquery-oauth"

label: "Growth"
include: "views/android_app_campaign_stats.view.lkml"
include: "explores/*"

explore: android_app_campaign_stats {
  label: "Android App Campaign Stats"
  description: "ROAS and Cost for Google  Ads App Campaigns for Firefox Android"
  view_name: android_app_campaign_stats
}
