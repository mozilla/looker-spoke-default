include: "../views/daily_connector_costs.view.lkml"

explore: connector_costs {
  persist_with: daily_connector_costs_last_updated
  from:  daily_connector_costs


  aggregate_table: fivetran_costs_monthly_overview {
    query: {
      dimensions: [measured_month]
      measures: [cost_in_USD, paid_active_rows, spent_rate]
    }

    materialization: {
      datagroup_trigger: daily_connector_costs_last_updated
    }
  }
}
