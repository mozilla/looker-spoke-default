view: firefox_android_clients {
  sql_table_name: mozdata.fenix.firefox_android_clients ;;

  dimension: is_activated {
    sql: ${TABLE}.activated ;;
    type: yesno
    description: "Determines if a client is activated based on the activation metric and a 7 day lag."
  }

  dimension: adjust_ad_group {
    sql: ${TABLE}.adjust_ad_group ;;
    type: string
    description: "The Ad Group this client is attributed to, according to Adjust."
  }

  dimension: adjust_campaign {
    sql: ${TABLE}.adjust_campaign ;;
    type: string
    description: "The campaign this client is attributed to, according to Adjust."
  }

  dimension: adjust_creative {
    sql: ${TABLE}.adjust_creative ;;
    type: string
    description: "The creative this client is attributed to, according to Adjust."
  }

  dimension: adjust_network {
    sql: ${TABLE}.adjust_network ;;
    type: string
    description: "The network this client is attributed to, according to Adjust."
  }

  dimension: app_version {
    sql: ${TABLE}.app_version ;;
    type: string
    description: "App display version for this client installation."
  }

  dimension: channel {
    sql: ${TABLE}.channel ;;
    type: string
    description: "Channel where the browser is released."
  }

  dimension: client_id {
    sql: ${TABLE}.client_id ;;
    hidden: yes
    description: "Unique ID for the client installation."
  }

  dimension: device_manufacturer {
    sql: ${TABLE}.device_manufacturer ;;
    type: string
    description: "Manufacturer of the device where the client is installed."
  }

  dimension: device_model {
    sql: ${TABLE}.device_model ;;
    type: string
    description: "Model of the device where the client is installed."
  }

  dimension: country {
    sql: ${TABLE}.first_reported_country ;;
    type: string
    description: "First reported country for the client installation"
  }

  dimension: isp {
    sql: ${TABLE}.first_reported_isp ;;
    type: string
    description: "Name of the first reported isp (Internet Service Provider)."
  }

  dimension: install_source {
    sql: ${TABLE}.install_source ;;
    type: string
    description: "The source of a client installation."
  }

  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
    description: "Client locale."
  }

  dimension: os_version {
    sql: ${TABLE}.os_version ;;
    type: string
    description: "Version of the Operating System where the client is originally installed."
  }

  dimension: sample_id {
    sql: ${TABLE}.sample_id ;;
    type: number
    description: "Sample ID to limit query results during an analysis."
  }

  dimension_group: first_seen {
    sql: ${TABLE}.first_seen_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
    description: "Date when the app first reported a baseline ping for the client."
  }

  dimension_group: last_reported {
    sql: ${TABLE}.last_reported_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
    description: "Last date this client was seen."
  }

  measure: client_count {
    type: count_distinct
    sql: ${TABLE}.client_id ;;
    description: "Count of clients."
  }
}
