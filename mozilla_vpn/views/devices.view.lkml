include: "//looker-hub/mozilla_vpn/views/devices.view"

view: +devices {
  dimension: id {
    primary_key: yes
    hidden: yes
  }

  # this field is renamed to make the meaning more clear in context
  dimension_group: updated_at {
    hidden: yes
  }
  dimension_group: modified {
    sql: ${updated_at_raw};;
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
  }

  dimension: user_id {
    hidden: yes
  }

  measure: count {
    type: count
  }
}
