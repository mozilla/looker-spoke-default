include: "../views/android_onboarding.view.lkml"
include: "//looker-hub/fenix/datagroups/android_onboarding_last_updated.datagroup.lkml"

explore: android_onboarding {
  label: "Android Onboarding Funnel"
  view_name: android_onboarding
  persist_with: android_onboarding_last_updated
}
