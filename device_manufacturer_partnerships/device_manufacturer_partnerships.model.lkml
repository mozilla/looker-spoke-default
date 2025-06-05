connection: "telemetry"
label: "Device Manufacturer Partnerships"
# Include files from looker-hub or spoke-default below. For example:
# include: "//looker-hub/device_manufacturer_partnerships/explores/*"
# include: "//looker-hub/device_manufacturer_partnerships/dashboards/*"
include: "views/*"
# include: "explores/*"
# include: "dashboards/*"

explore: click_through_rates {
  from: dt_ctr
}
