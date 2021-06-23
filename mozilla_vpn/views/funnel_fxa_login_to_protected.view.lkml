include: "//looker-hub/mozilla_vpn/views/funnel_fxa_login_to_protected.view"

view: +funnel_fxa_login_to_protected {
  dimension: fxa_uid {
    hidden: yes
  }

  dimension: id {
    hidden: yes
    primary_key: yes
  }

  measure: count {
    label: "Login Attempts"
    type: count
  }

  measure: completed_login_count {
    type: count
    filters: [completed_login: "yes"]
  }

  measure: registered_user_count {
    type: count
    filters: [registered_user: "yes"]
  }

  measure: paid_for_subscription_count {
    type: count
    filters: [paid_for_subscription: "yes"]
  }

  measure: registered_device_count {
    type: count
    filters: [registered_device: "yes"]
  }

  measure: protected_count {
    type: count
    filters: [protected: "yes"]
  }

  measure: frac_completed_login {
    description: "Fraction of first login attempts that completed login"
    type: number
    sql: ${completed_login_count}/${count};;
  }

  measure: frac_registered_user {
    description: "Fraction of first login attempts that returned to the product after login"
    type: number
    sql: ${registered_user_count}/${count};;
  }

  measure: frac_paid_for_subscription {
    description: "Fraction of first login attempts that paid for a subscription"
    type: number
    sql: ${paid_for_subscription_count}/${count};;
  }

  measure: frac_registered_device {
    description: "Fraction of first login attempts that added a device to their account"
    type: number
    sql: ${registered_device_count}/${count};;
  }

  measure: frac_protected {
    description: "Fraction of first login attempts that protected a device (i.e. turned on the product)"
    type: number
    sql: ${protected_count}/${count};;
  }
}
