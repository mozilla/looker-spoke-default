include: "../views/firefox_ios_ltv.view.lkml"
include: "../../firefox_ios/views/firefox_ios_clients.view.lkml"

explore: firefox_ios_ltv {
    label: "Firefox iOS Lifetime Value (LTV)"

    join: firefox_ios_clients {
    type: inner
    sql_on: ${firefox_ios_ltv.sample_id} = ${firefox_ios_clients.sample_id} AND ${firefox_ios_ltv.client_id} = ${firefox_ios_clients.client_id} ;;
    view_label: "Firefox IOS Clients"
    relationship: one_to_one
  }

}
