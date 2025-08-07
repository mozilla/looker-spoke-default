connection: "bigquery-oauth"

label: "Growth"
include: "views/android_app_campaign_stats.view.lkml"
include: "views/ios_app_campaign_stats.view.lkml"
include: "views/fenix_new_profile_activation_clients.view.lkml"
include: "explores/*"


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


explore: fenix_new_profile_activation_clients {
  label: "Clients Activation"
  description: "New profiles table with activation flag"
  view_name: fenix_new_profile_activation_clients
}
