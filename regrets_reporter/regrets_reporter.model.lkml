connection: "telemetry"
label: "RegretsReporter"
include: "//looker-hub/regrets_reporter/views/*"

explore: regrets_reporter_summary {
  description: "Usage of the regrets reporter addon"
  always_filter: {
    filters: [regrets_reporter_summary.date_date: "7 days"]
  }
}
