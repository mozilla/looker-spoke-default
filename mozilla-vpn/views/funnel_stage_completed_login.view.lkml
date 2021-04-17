view: funnel_stage_completed_login {
  derived_table: {
    sql:
      SELECT
        fxa_uid,
        MIN(flow_completed) AS first_completed_login,
      FROM
        mozdata.mozilla_vpn.login_flows
      LEFT JOIN
        UNNEST(fxa_uids) AS fxa_uid
      WHERE
        fxa_uid IS NOT NULL
        AND flow_completed IS NOT NULL
      GROUP BY
        fxa_uid;;
  }

  dimension: fxa_uid {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.fxa_uid;;
  }

  dimension_group: first_completed_login {
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
    sql: ${TABLE}.first_completed_login;;
  }

  measure: count {
    type: count
  }
}
