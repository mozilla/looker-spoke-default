connection: "telemetry"
label: "Websites"

include: "dashboards/*"
include: "explores/*"
include: "views/blogs_daily_summary.view.lkml"
include: "views/blogs_landing_page_summary.view.lkml"
include: "views/firefox_whats_new_page_summary.view.lkml"
include: "views/firefox_whatsnew_summary.view.lkml"
include: "views/google_search_console_by_page.view.lkml"
include: "views/google_search_console_by_site.view.lkml"
include: "views/limited_historical_google_search_console_by_page.view.lkml"
include: "views/limited_historical_google_search_console_by_site.view.lkml"
include: "views/moz_org_landing_page_metrics.view.lkml"
include: "views/moz_org_metrics_summary.view.lkml"
include: "views/moz_org_page_metrics.view.lkml"
include: "views/web_sessions.view.lkml"
include: "views/website_conv_with_pop.view.lkml"
include: "views/whats_new_page_events.view.lkml"
include: "views/www_site_events_metrics.view.lkml"


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
