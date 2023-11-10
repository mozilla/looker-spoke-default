include: "../views/*"

explore: adjust_installs_no_date_filter {
  label: "Adjust intalls"
  description: "Adjust installs without date filter"
  view_name: kpi_installs
  sql_always_where: ${app} = "Firefox Android and iOS" AND ${os} in ( "ios", "android")
  AND ${network} <> "Untrusted Devices";;
}
