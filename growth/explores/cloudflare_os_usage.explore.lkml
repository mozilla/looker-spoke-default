include: "../views/cloudflare_os_usg.view.lkml"

explore: cloudflare_os_usage {
  conditionally_filter: {
    filters: [operating_system_usage.location: "ALL",
              operating_system_usage.device_type: "ALL"]
  }
}
