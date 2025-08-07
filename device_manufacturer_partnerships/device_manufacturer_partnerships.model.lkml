connection: "telemetry"
label: "Device Manufacturer Partnerships"
# Include files from looker-hub or spoke-default below. For example:
# include: "//looker-hub/device_manufacturer_partnerships/explores/*"
# include: "//looker-hub/device_manufacturer_partnerships/dashboards/*"
include: "/device_manufacturer_partnerships/explores/device_partnership_app_opens.explore.lkml"
include: "/device_manufacturer_partnerships/views/device_partnership_app_opens.view.lkml"
include: "explores/*"
# include: "dashboards/*"

# explore: device_partnership_app_opens {
#   from: device_partnership_app_opens
# }
