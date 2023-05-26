include: "//looker-hub/mozilla_vpn/explores/funnel_analysis.explore.lkml"

explore: +funnel_analysis {
  sql_always_where: ${funnel_analysis.submission_date} >= '2010-01-01'
    AND (
      ${funnel_analysis.telemetry_agent} LIKE "%Kotlin%"
      OR ${funnel_analysis.telemetry_agent} LIKE "%JS%"
    ) ;;
}
