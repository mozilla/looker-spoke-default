include: "//looker-hub/mozilla_vpn/explores/*"

explore: +main {
  sql_always_where:  ${main.submission_date} >= '2010-01-01'
    AND (
      CASE WHEN (SAFE_CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_ORDINAL(1)] AS INTEGER) < 2 OR (SAFE_CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_ORDINAL(1)] AS INTEGER) = 2 AND SAFE_CAST(SPLIT(${client_info__app_display_version}, '.')[SAFE_ORDINAL(2)] AS INTEGER) < 16 ))
      THEN (${metadata__header__x_telemetry_agent} LIKE ANY ("%Kotlin%", "%JS%"))
      ELSE (${metadata__header__x_telemetry_agent} LIKE ANY ("%Kotlin%", "%Swift%", "%Rust%"))
      END
    ) ;;
}
