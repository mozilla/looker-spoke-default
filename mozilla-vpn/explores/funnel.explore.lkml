include: "../views/*.view"

explore: funnel {
  view_name: funnel_start_fxa_login

  join: funnel_stage_completed_login {
    relationship: many_to_one
    foreign_key: fxa_uid
  }
  join: funnel_stage_registered_user {
    from: users
    relationship: many_to_one
    sql_on: ${funnel_stage_completed_login.fxa_uid} = ${funnel_stage_registered_user.fxa_uid};;
  }
  join: funnel_stage_paid_for_subscription {
    relationship: many_to_one
    foreign_key: funnel_stage_registered_user.fxa_uid
  }
  join: funnel_stage_registered_device {
    relationship: many_to_one
    foreign_key: funnel_stage_paid_for_subscription.fxa_uid
  }
  join: funnel_stage_protected {
    relationship: many_to_one
    foreign_key: funnel_stage_registered_device.fxa_uid
  }
}
