view: funnel_stage_registered_device {
  derived_table: {
    sql:
      SELECT
        fxa_uid,
        MIN(`timestamp`) AS first_registered_device
      FROM
        mozdata.mozilla_vpn.add_device_events
      GROUP BY
        fxa_uid;;
  }

  dimension: fxa_uid {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.fxa_uid;;
  }

  dimension_group: first_registered_device {
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
    sql: ${TABLE}.first_registered_device;;
  }

  measure: count {
    type: count
  }
}
