include: "//looker-hub/mozilla_vpn/explores/*"

explore: +main {
  sql_always_where:  ${main.submission_date} >= '2010-01-01'
    AND (
      ${metadata__header__x_telemetry_agent} LIKE "%Kotlin%"
      OR ${metadata__header__x_telemetry_agent} LIKE "%JS%"
    ) ;;
}
