include: "../views/azure_billing.view.lkml"

explore: azure_billing {
  label: "Azure Billed Costs (Available Exports)"
  description: "Actual Azure charges from current export snapshots. Check subscription coverage and the latest usage date."
  always_filter: {
    filters: [azure_billing.usage_date: "30 days"]
  }
}
