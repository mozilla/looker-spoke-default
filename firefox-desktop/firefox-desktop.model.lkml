connection: "telemetry"

include: "views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "dashboards/*.dashboard"

explore: firefox_desktop_last_seen {
  label: "Firefox Dekstop Clients Last Seen"
  from: clients_last_seen
  hidden: yes
}
