include: "../views/ad_activation_performance_table.view.lkml"

explore: apple_search_ads_performance {
  label: "Apple Search Ads (ASA) performance"
  description: "Campaign performance metrics for Apple Search Ads, from spend and downlaods to new profiles and activation"
  view_name: ad_activation_performance_table

}
