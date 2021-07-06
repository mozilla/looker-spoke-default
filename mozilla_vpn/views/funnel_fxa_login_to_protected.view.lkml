include: "//looker-hub/mozilla_vpn/views/funnel_fxa_login_to_protected.view"

view: +funnel_fxa_login_to_protected {
  dimension: fxa_uid {
    hidden: yes
  }

  dimension: id {
    hidden: yes
    primary_key: yes
  }

  dimension: completed_login {
    label: "Stage 1 Completed Login"
    description: "completed login within 2 days of first login attempt"
  }

  # this field is renamed to make the meaning more clear in context
  dimension: registered_user {
    hidden: yes
  }
  dimension: returned_from_login {
    label: "Stage 2 Returned from FxA Login"
    description: "completed previous stages and returned from login within 2 days of first login attempt"
    sql: ${registered_user};;
    type: yesno
  }

  dimension: paid_for_subscription {
    label: "Stage 3 Completed Login"
    description: "completed previous stages and paid for a subscription within 2 days of first login attempt"
  }

  dimension: registered_device {
    label: "Stage 4 Completed Login"
    description: "completed previous stages and registered a device within 2 days of first login attempt"
  }

  dimension: protected {
    label: "Stage 5 Protected"
    description: "completed previous stages and was protected by the product within 2 days of first login attempt"
  }

  measure: count {
    label: "First Login Attempts"
    type: count
  }
}
