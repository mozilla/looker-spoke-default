include: "/kpi/views/browser_kpi_forecasts_2025.view.lkml"
include: "../../combined_browser_metrics/views/active_users_aggregates.view.lkml"
include: "../datagroups/daily_active_users_by_product_category_last_updated.datagroup.lkml"

explore: browser_kpi_forecasts_2025 {
  label: "Browser KPI Forecasts 2025"
  description: "Browser KPI Forecasts 2025"
  view_name: browser_kpi_forecasts_2025

  aggregate_table: rollup__forecast_name__submission_day_date__desktop {
    query: {
      dimensions: [forecast_name, submission_day_date]
      measures: [actual_dau28ma_2024, actual_dau28ma_2025, forecast_dau28ma, most_recent_actuals]
      filters: [
        browser_kpi_forecasts_2025.forecast_name: "actuals,AUG holiday smart AUG,AUG holiday smart PRIOR FORECAST",
        browser_kpi_forecasts_2025.product: "desktop"
      ]
    }

    materialization: {
      datagroup_trigger: daily_active_users_by_product_category_last_updated
    }
  }

  aggregate_table: rollup__forecast_name__submission_day_date__mobile {
    query: {
      dimensions: [forecast_name, submission_day_date]
      measures: [actual_dau28ma_2024, actual_dau28ma_2025, forecast_dau28ma, most_recent_actuals]
      filters: [
        browser_kpi_forecasts_2025.forecast_name: "actuals,AUG holiday smart AUG,AUG holiday smart PRIOR FORECAST",
        browser_kpi_forecasts_2025.product: "mobile"
      ]
    }

    materialization: {
      datagroup_trigger: daily_active_users_by_product_category_last_updated
    }
  }

  aggregate_table: rollup__forecast_name__submission_day_date__mobile_desktop {
    query: {
      dimensions: [forecast_name, submission_day_date]
      measures: [actual_dau28ma_2024, actual_dau28ma_2025, forecast_dau28ma, most_recent_actuals]
      filters: [
        browser_kpi_forecasts_2025.forecast_name: "actuals,AUG holiday smart AUG,AUG holiday smart PRIOR FORECAST",
        browser_kpi_forecasts_2025.product: "mobile,desktop"
      ]
    }

    materialization: {
      datagroup_trigger: daily_active_users_by_product_category_last_updated
    }
  }
}
