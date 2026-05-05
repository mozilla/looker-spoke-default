include: "../views/auth_entrypoint_conversion.view.lkml"

explore: auth_entrypoint_conversion {
  label: "Auth Entrypoint Conversion"
  description: "Started and completed authentication flows by entrypoint, OAuth client, service, and device type."

  always_filter: {
    filters: [auth_entrypoint_conversion.flow_date: "14 days"]
  }
}
