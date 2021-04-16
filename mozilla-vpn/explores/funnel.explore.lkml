include: "../views/*.view"

explore: funnel {
  view_name: funnel_start_fxa_login

  join: funnel_stage_completed_login {
    relationship: many_to_one
    sql_on:
      -- Use key from previous stage to ensure a strict subset
      ${funnel_start_fxa_login.fxa_uid} = ${fxa_uid}
      -- Allow up to 2 days since ${funnel_start_fxa_login.start_raw}
      AND ${first_completed_login_raw} BETWEEN
        ${funnel_start_fxa_login.start_raw}
        AND TIMESTAMP_ADD(${funnel_start_fxa_login.start_raw}, interval 2 day);;
  }

  join: funnel_stage_registered_user {
    from: users
    relationship: many_to_one
    sql_on:
      -- Use key from previous stage to ensure a strict subset
      ${funnel_stage_completed_login.fxa_uid} = ${fxa_uid}
      -- Allow up to 2 days since ${funnel_start_fxa_login.start_raw}
      AND ${created_raw} BETWEEN
        ${funnel_start_fxa_login.start_raw}
        AND TIMESTAMP_ADD(${funnel_start_fxa_login.start_raw}, interval 2 day);;
  }
  join: funnel_stage_paid_for_subscription {
    relationship: many_to_one
    sql_on:
      -- Use key from previous stage to ensure a strict subset
      ${funnel_stage_registered_user.fxa_uid} = ${fxa_uid}
      -- Allow up to 2 days since ${funnel_start_fxa_login.start_raw}
      AND ${first_paid_for_subscription_raw} BETWEEN
        ${funnel_start_fxa_login.start_raw}
        AND TIMESTAMP_ADD(${funnel_start_fxa_login.start_raw}, interval 2 day);;
  }
  join: funnel_stage_registered_device {
    relationship: many_to_one
    sql_on:
      -- Use key from previous stage to ensure a strict subset
      ${funnel_stage_paid_for_subscription.fxa_uid} = ${fxa_uid}
      -- Allow up to 2 days since ${funnel_start_fxa_login.start_raw}
      AND ${first_registered_device_raw} BETWEEN
        ${funnel_start_fxa_login.start_raw}
        AND TIMESTAMP_ADD(${funnel_start_fxa_login.start_raw}, interval 2 day);;
  }
  join: funnel_stage_protected {
    relationship: many_to_one
    sql_on:
      -- Use key from previous stage to ensure a strict subset
      ${funnel_stage_registered_device.fxa_uid} = ${fxa_uid}
      -- Allow up to 2 days since ${funnel_start_fxa_login.start_raw}
      AND ${first_protected_raw} BETWEEN
        ${funnel_start_fxa_login.start_raw}
        AND TIMESTAMP_ADD(${funnel_start_fxa_login.start_raw}, interval 2 day);;
  }
}
