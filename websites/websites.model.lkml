connection: "telemetry"
label: "Websites"

include: "./views/*.view.lkml"

explore: blogs_daily_summary{}
explore: blogs_landing_page_summary{}
explore: moz_org_landing_page_metrics{}
explore: moz_org_metrics_summary{}
explore: moz_org_page_metrics{}
