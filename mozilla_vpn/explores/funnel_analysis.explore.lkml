include: "//looker-hub/mozilla_vpn/explores/funnel_analysis.explore.lkml"

explore: +funnel_analysis {
  sql_always_where: ${funnel_analysis.submission_date} >= '2010-01-01'
    AND (
      -- For version below 2.16 Kotlin and JS were the main Glean integrations
      (CAST(SPLIT(${funnel_analysis.app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) < 2 OR (CAST(SPLIT(${funnel_analysis.app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) = 2 AND CAST(SPLIT(${funnel_analysis.app_display_version}, '.')[SAFE_OFFSET(2)] AS INTEGER) < 16 )
        AND (${funnel_analysis.telemetry_agent} LIKE "%Kotlin%" OR ${funnel_analysis.telemetry_agent} LIKE "%JS%"))
      OR
      -- For version above 2.16 Kotlin, Swift and Rust are the main Glean integrations
      (CAST(SPLIT(${funnel_analysis.app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) > 2 OR (CAST(SPLIT(${funnel_analysis.app_display_version}, '.')[SAFE_OFFSET(1)] AS INTEGER) = 2 AND CAST(SPLIT(${funnel_analysis.app_display_version}, '.')[SAFE_OFFSET(2)] AS INTEGER) >= 16)
        AND (${funnel_analysis.telemetry_agent} LIKE "%Kotlin%" OR ${funnel_analysis.telemetry_agent} LIKE "%Swift%" OR ${funnel_analysis.telemetry_agent} LIKE "%Rust%"))
    ) ;;
}
