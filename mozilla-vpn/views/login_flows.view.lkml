view: login_flows {
  derived_table: {
    sql:
      SELECT
        -- when fxa_uid is missing, produce one row per flow_id
        COALESCE(fxa_uid, flow_id) AS flow_id,
        fxa_uid,
        MIN(flow_started) AS flow_started,
        MIN(flow_completed) AS flow_completed,
      FROM
        mozdata.mozilla_vpn.login_flows
      LEFT JOIN
        UNNEST(fxa_uids) AS fxa_uid
      WHERE
        -- Windows requires two logins, one before downloading the client and one after installing the
        -- client. Only measure the first one here.
        --
        -- When flow_completed is TRUE, the first login succeeded. The best available approximation of
        -- whether a flow that did not succeed was from the first login, is viewed_email_first_page.
        --
        -- Using viewed_email_first_page will undercount in cases where the first login did not succeed
        -- for someone with an existing account, and will overcount in cases where the second login did
        -- not succeed and session information was not available from the first login.
        --
        -- Also, ignore incomplete flows with fxa_uid, and completed flows without fxa_uid
        IF(
          flow_completed IS NULL,
          fxa_uid IS NULL
          AND viewed_email_first_page,
          fxa_uid IS NOT NULL
        )
      GROUP BY
        flow_id,
        fxa_uid;;
  }

  dimension: flow_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.flow_id;;
  }

  dimension: fxa_uid {
    hidden: yes
    type: string
    sql: ${TABLE}.fxa_uid;;
  }

  dimension_group: flow_completed {
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
    sql: ${TABLE}.flow_completed;;
  }

  dimension_group: flow_started {
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
    sql: ${TABLE}.flow_started;;
  }

  measure: count {
    type: count
  }

  measure: completed_login {
    type: count
    sql_distinct_key: ${fxa_uid};;
  }
}
