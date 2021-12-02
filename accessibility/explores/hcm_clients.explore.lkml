include: "//looker-hub/firefox_desktop/views/clients_daily_table.view"

view: clients_daily {
  extends: [clients_daily_table]

  dimension: a11y_theme {
    sql: ${TABLE}.a11y_theme ;;
  }

  dimension: a11y_theme_count {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.a11y_theme) ;;
  }

  measure: Count {
    type: number
    sql: COUNT(DISTNCT ${client_id}) ;;
  }
}

explore: hcm_clients {
  view_name: clients_daily
  label: "HCM Clients"

  join: clients_daily_table__a11y_theme {
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${clients_daily.a11y_theme}) AS clients_daily_table__a11y_theme ;;
  }

  fields: [
    "clients_daily.client_id",
    "clients_daily.a11y_theme",
    "clients_daily.os",
    "clients_daily.scalar_a11y_hcm_background",
    "clients_daily.scalar_a11y_hcm_foreground",
    "clients_daily.normalized_channel",
    "clients_daily.submission_date",
    "clients_daily.a11y_theme_count",
    "clients_daily_table__a11y_theme.key",
    "clients_daily_table__a11y_theme.value",
    "clients_daily.Count"
  ]

  sql_always_where: ${clients_daily.submission_date} >= "2021-05-01" ;;
}
