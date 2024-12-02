# TODO: remove unnecessary view imports
include: "views/dau_newprofile.view.lkml"
include: "views/dev_desktop_dates.view.lkml"
include: "views/dev_desktop_dates_partners.view.lkml"
include: "views/dev_desktop_install.view.lkml"
include: "views/dev_desktop_install_partners.view.lkml"
include: "views/dev_desktop_new_profiles.view.lkml"
include: "views/dev_desktop_session.view.lkml"
include: "views/dev_desktop_usage.view.lkml"
include: "views/dev_desktop_usage_partners.view.lkml"
include: "views/feature_usage.view.lkml"
include: "views/feature_usage_mobile.view.lkml"
include: "views/forecasts_various.view.lkml"
include: "views/gplay_downloads.view.lkml"
include: "views/mozblogs_ga.view.lkml"
include: "views/mozorg_ga.view.lkml"
include: "views/surveys.view.lkml"
include: "views/version_uplift.view.lkml"

explore: version_uplift {
  hidden: yes
  from: version_uplift
}


explore: version_uplift_mobile {
  hidden: yes
  from: version_uplift_mobile
}


explore: surveys {
  hidden: yes
  from: surveys
}


explore: feature_usage {
  hidden: yes
  from: feature_usage
}


explore: gplay_downloads {
  hidden: yes
  from: gplay_downloads
}


explore: mozorg_ga {
  hidden: yes
  from: mozorg_ga
}


explore: mozblogs_ga {
  hidden: yes
  from: mozblogs_ga
}


explore: forecast_desktopDAU {
  hidden: yes
  from: forecast_desktopDAU
}


explore: forecast_desktopNP {
  hidden: yes
  from: forecast_desktopNP
}

explore: dau_desktop {
  hidden: yes
  from: dau_desktop
}

explore: forecast_dls {
  hidden: yes
  from: forecast_dls
}

explore: dau_mobile {
  hidden: yes
  from: dau_mobile
}


explore: forecast_mobile_dau {
  hidden: yes
  from: forecast_mobile_dau
}


explore: install_android {
  hidden: yes
  from: install_android
}


explore: forecast_android_installs {
  hidden: yes
  from: forecast_android_installs
}

explore: install_ios {
  hidden: yes
  from: install_ios
}


explore: forecast_ios_installs {
  hidden: yes
  from: forecast_ios_installs
}


explore: feature_usage_themes {
  hidden: yes
  from: feature_usage_themes
}


explore: tabtray_android {
  hidden: yes
  from: tabtray_android
}

explore: tabtray_ios {
  hidden: yes
  from: tabtray_ios
}

explore: tabs_overall_ios {
  hidden: yes
  from: tabs_overall_ios
}

explore: synced_tabs_ios {
  hidden: yes
  from: synced_tabs_ios
}

explore: search_mobile {
  hidden: yes
  from: search_mobile
}
