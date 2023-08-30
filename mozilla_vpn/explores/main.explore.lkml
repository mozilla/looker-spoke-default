include: "//looker-hub/mozilla_vpn/explores/*"

explore: +main {
  sql_always_where:  ${main.submission_date} >= '2010-01-01'
    AND (
      -- For version below 2.16 Kotlin and JS were the main Glean integrations
      (CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) < 2 OR (CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) = 2 AND CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_OFFSET(2)] AS INTEGER) < 16 )
        AND (${metadata__header__x_telemetry_agent} LIKE "%Kotlin%" OR ${metadata__header__x_telemetry_agent} LIKE "%JS%"))
      OR
      -- For version avoce 2.16 Kotlin, Swift and Rust are the main Glean integrations
      (CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) > 2 OR (CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) = 2 AND CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_OFFSET(2)] AS INTEGER) >= 16)
        AND (${metadata__header__x_telemetry_agent} LIKE "%Kotlin%" OR ${metadata__header__x_telemetry_agent} LIKE "%Swift%" OR ${metadata__header__x_telemetry_agent} LIKE "%Rust%"))
     ) ;;
}
