connection: "telemetry"
label: "Fivetran"

include: "explores/connector_costs.explore"
include: "dashboards/fivetran_connector_costs.dashboard"
include: "//looker-hub/fivetran/datagroups/daily_connector_costs_v1_last_updated.datagroup.lkml"
