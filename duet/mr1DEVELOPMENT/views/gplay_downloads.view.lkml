view: gplay_downloads {
  derived_table: {
    sql: SELECT
          date,
          sum(Daily_Device_Installs) as device_installs,
          sum(Daily_User_Installs) as user_installs
        FROM
          `moz-fx-data-marketing-prod.google_play_store.Installs_country_v1`
        WHERE
          Package_Name = 'org.mozilla.firefox'
          AND date >= '2021-03-23'
        GROUP BY 1
         ;;
  }

######################################################

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

######################################################

  measure: device_installs {
    type:sum
    sql: ${TABLE}.device_installs;;
    drill_fields: [detail*]
  }

  measure: user_installs {
    type:sum
    sql: ${TABLE}.user_installs;;
    drill_fields: [detail*]
  }

######################################################

  set: detail {
    fields: [date]
  }
}
