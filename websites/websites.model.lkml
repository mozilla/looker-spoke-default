connection: "telemetry"
label: "Websites"

include: "dashboards/*"
include: "explores/*"
include: "views/ga4_blog_performance.view.lkml"
include: "views/blogs_daily_summary.view.lkml"
include: "views/blogs_landing_page_summary.view.lkml"
include: "views/firefox_whats_new_page_summary.view.lkml"
include: "views/firefox_whatsnew_summary.view.lkml"
include: "views/moz_org_landing_page_metrics.view.lkml"
include: "views/moz_org_metrics_summary.view.lkml"
include: "views/moz_org_page_metrics.view.lkml"
include: "views/website_conv_with_pop.view.lkml"
include: "views/whats_new_page_events.view.lkml"
include: "views/www_site_events_metrics.view.lkml"

include: "//looker-hub/websites/views/firefox_com_ga4_www_site_downloads.view.lkml"
include: "//looker-hub/websites/views/firefox_com_ga4_sessions.view.lkml"
include: "//looker-hub/websites/views/firefox_com_page_metrics.view.lkml"
include: "//looker-hub/websites/views/firefox_com_metrics_summary.view.lkml"
include: "//looker-hub/websites/views/firefox_com_landing_page_metrics.view.lkml"
include: "//looker-hub/websites/views/firefox_com_www_site_events_metrics.view.lkml"

explore: ga4_blog_performance{}
explore: blogs_daily_summary{}
explore: blogs_landing_page_summary{}
explore: moz_org_landing_page_metrics{}
explore: moz_org_metrics_summary{}
explore: moz_org_page_metrics{}
explore: whats_new_page_events {}
explore: firefox_whats_new_page_summary {}
explore: website_conv_with_pop {}
explore: www_site_events_metrics {}
explore: firefox_whatsnew_summary {}

explore: firefox_com_ga4_www_site_downloads {}
explore: firefox_com_ga4_sessions {}
explore: firefox_com_page_metrics {}
explore: firefox_com_metrics_summary {}
explore: firefox_com_landing_page_metrics {}
explore: firefox_com_www_site_events_metrics {}
