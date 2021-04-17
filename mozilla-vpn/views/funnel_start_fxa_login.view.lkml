view: funnel_start_fxa_login {
  derived_table: {
    sql:
      SELECT
        -- One row per fxa_uid and produce one row per flow_id where fxa_uid is NULL
        COALESCE(fxa_uid, flow_id) AS id,
        MIN(flow_started) AS start_time,
        fxa_uid,
      FROM
        mozdata.mozilla_vpn.login_flows
      LEFT JOIN
        UNNEST(fxa_uids) AS fxa_uid
      WHERE
        -- This should only count distinct users. The best available approximation of a unique
        -- user without fxa_uid is viewed_email_first_page. This will overcount incomplete login
        -- attempts where session information is not available from prior login attempts (e.g.
        -- switching browsers, expired sessions, etc).
        fxa_uid IS NOT NULL OR viewed_email_first_page
      GROUP BY
        id,
        fxa_uid;;
  }

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id;;
  }

  dimension: fxa_uid {
    hidden: yes
    type: string
    sql: ${TABLE}.fxa_uid;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_time;;
  }

  measure: count {
    type: count
  }

  measure: frac_completed_login {
    description: "Fraction of first login attempts that completed login"
    type: number
    sql: COUNT(
      DISTINCT IF(
        -- Allow up to 2 days since ${start_raw}
        ${funnel_stage_completed_login.first_completed_login_raw} BETWEEN
          ${start_raw}
          AND TIMESTAMP_ADD(${start_raw}, INTERVAL 2 DAY),
        ${funnel_stage_completed_login.fxa_uid},
        NULL
      )
    )/${count};;
  }

  measure: frac_registered_user {
    description: "Fraction of first login attempts that returned to the product after login"
    type: number
    sql: COUNT(
      DISTINCT IF(
        -- Allow up to 2 days since ${start_raw}
        ${funnel_stage_registered_user.created_raw} BETWEEN
          ${start_raw}
          AND TIMESTAMP_ADD(${start_raw}, INTERVAL 2 DAY),
        ${funnel_stage_registered_user.fxa_uid},
        NULL
      )
    )/${count};;
  }

  measure: frac_subscribed {
    description: "Fraction of first login attempts that paid for a subscription"
    type: number
    sql: COUNT(
      DISTINCT IF(
        -- Allow up to 2 days since ${start_raw}
        ${funnel_stage_paid_for_subscription.first_paid_for_subscription_raw} BETWEEN
          ${start_raw}
          AND TIMESTAMP_ADD(${start_raw}, INTERVAL 2 DAY),
        ${funnel_stage_paid_for_subscription.fxa_uid},
        NULL
      )
    )/${count};;
  }

  measure: frac_registered_device {
    description: "Fraction of first login attempts that added a device to their account"
    type: number
    sql: COUNT(
      DISTINCT IF(
        -- Allow up to 2 days since ${start_raw}
        ${funnel_stage_registered_device.first_registered_device_raw} BETWEEN
          ${start_raw}
          AND TIMESTAMP_ADD(${start_raw}, INTERVAL 2 DAY),
        ${funnel_stage_registered_device.fxa_uid},
        NULL
      )
    )/${count};;
  }

  measure: frac_protected {
    description: "Fraction of first login attempts that protected a device (i.e. turned on the product)"
    type: number
    sql: COUNT(
      DISTINCT IF(
        -- Allow up to 2 days since ${start_raw}
        ${funnel_stage_protected.first_protected_raw} BETWEEN
          ${start_raw}
          AND TIMESTAMP_ADD(${start_raw}, INTERVAL 2 DAY),
        ${funnel_stage_protected.fxa_uid},
        NULL
      )
    )/${count};;
  }
}
