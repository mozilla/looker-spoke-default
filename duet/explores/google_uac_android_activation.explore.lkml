include: "/growth/views/android_app_campaign_stats.view.lkml"

explore: google_uac_android_activation {
  label: "Google UAC Android campaign activation"
  description: "Activation and cost for Google UAC campaigns for Firefox Android"
  view_name: android_app_campaign_stats
  hidden: yes
}
