include: "//looker-hub/firefox_desktop/explores/metric_definitions_desktop_engagement_v1.explore.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/desktop_engagement_last_updated.datagroup.lkml"


explore: metric_definitions_desktop_engagement_v1_excl_other_os {

  extends: [metric_definitions_desktop_engagement_v1]
  view_name: metric_definitions_desktop_engagement_v1

  persist_with: desktop_engagement_last_updated

 sql_always_where: ${metric_definitions_desktop_engagement_v1.normalized_os} != 'Other' ;;
 }
