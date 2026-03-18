include: "../views/fenix_ltv.view.lkml"
include: "../../fenix/views/firefox_android_clients.view"

explore: fenix_ltv {
  label: "Fenix Lifetime Value (LTV)"

  join: firefox_android_clients {
    type: inner
    sql_on: ${fenix_ltv.sample_id} = ${firefox_android_clients.sample_id} AND ${fenix_ltv.client_id} = ${firefox_android_clients.client_id} ;;
    view_label: "Fenix Client Dimensions"
    relationship: one_to_one
  }

  always_filter: {
    filters: [firefox_android_clients.last_reported_date: "last 365 days"]
  }
}
