connection: "telemetry"

include: "//looker-hub/kpi/views/automated_kpi_forecasts.view.lkml"
include: "views/automated_kpi_forecasts_confidence_intervals.view.lkml"
include: "views/Automated_KPI_Forecasts.view.lkml"
include: "views/country_level_yoy_metrics.view.lkml"
include: "views/mobile_usage_forecast.view.lkml"

include: "/shared/views/countries.view.lkml"
include: "explores/*"
