connection: "telemetry"

include: "views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "dashboards/*.dashboard"

explore: firefox_desktop_cohorts {
  label: "Firefox Dekstop Clients Last Seen"
  group_label: "Firefox Desktop"
  from: clients_last_seen
  hidden: no
}
