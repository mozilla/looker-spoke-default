include: "../views/cloudflare_device_usg.view.lkml"

explore: cloudflare_device_usage {
  conditionally_filter: {
    filters: [device_usage.location: "ALL",
              device_usage.user_type: "Human"]
  }
}
