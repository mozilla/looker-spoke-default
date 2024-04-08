include: "../views/cloudflare_browser_usg.view.lkml"

explore: cloudflare_browser_usage {
  conditionally_filter: {
    filters: [browser_usage.device_type: "ALL",
              browser_usage.location: "ALL",
              browser_usage.operating_system: "ALL]
  }
}
