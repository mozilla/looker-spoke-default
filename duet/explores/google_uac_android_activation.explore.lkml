include: "/growth/views/android_app_campaign_stats.view.lkml"

view: google_uac_android_activation {
  extends: [android_app_campaign_stats]
}

explore: google_uac_android_activation {
  label: "Google UAC Android campaign activation"
  description: "Activation and cost for Google UAC campaigns for Firefox Android"
  view_name: google_uac_android_activation
  hidden: yes
}
