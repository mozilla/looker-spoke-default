include: "//looker-hub/mozilla_vpn/explores/events.explore.lkml"

explore: event_counts {
  sql_always_where:  ${events.submission_date} >= '2010-01-01'
      -- For version below 2.16 Kotlin and JS were the main Glean integrations
      (CAST(SPLIT(${events.client_info__app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) < 2 OR (CAST(SPLIT(${events.client_info__app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) = 2 AND CAST(SPLIT(${events.client_info__app_display_version}, '.')[SAFE_OFFSET(2)] AS INTEGER) < 16 )
        AND (${events.metadata__header__x_telemetry_agent} LIKE "%Kotlin%" OR ${events.metadata__header__x_telemetry_agent} LIKE "%JS%"))
      OR
      -- For version above 2.16 Kotlin, Swift and Rust are the main Glean integrations
      (CAST(SPLIT(${events.client_info__app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) > 2 OR (CAST(SPLIT(${events.client_info__app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) = 2 AND CAST(SPLIT(${events.client_info__app_display_version}, '.')[SAFE_OFFSET(2)] AS INTEGER) >= 16)
        AND (${events.metadata__header__x_telemetry_agent} LIKE "%Kotlin%" OR ${events.metadata__header__x_telemetry_agent} LIKE "%Swift%" OR ${events.metadata__header__x_telemetry_agent} LIKE "%Rust%")) ;;
}
