include: "../views/cloudflare_os_usg.view.lkml"

explore: operating_system_usage {
  conditionally_filter: {
    filters: [operating_system_usage.location: "ALL",
              operating_system_usage.device_type: "ALL",
              operating_system_usage.dte_date: "30 days"]
  }
}
