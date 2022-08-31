include: "//looker-hub/firefox_desktop/views/crashes_daily.view.lkml"
include: "../views/crash_usage.view.lkml"
include: "/shared/views/countries.view.lkml"


explore: crash_usage {
  label: "Crashes"
  description: "Crash counts for Desktop Firefox, derived from the crash ping."

  join: crashes_daily {
    sql_on: ${crashes_daily.client_id} = ${crash_usage.client_id}
            AND ${crashes_daily.submission_date} = ${crash_usage.submission_date} ;;
    relationship: one_to_one
    fields: []
  }

  join: buildhub {
    sql_on: ${crash_usage.version} = ${buildhub.version} AND ${crash_usage.channel} = ${buildhub.channel} ;;
    relationship: many_to_one
    fields: []
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${crash_usage.country_code} = ${countries.code} ;;
  }

  sql_always_where: {% condition crash_usage.date %} TIMESTAMP(${crash_usage.submission_date}) {% endcondition %}
    AND {% condition crash_usage.date %} TIMESTAMP(${crashes_daily.submission_date}) {% endcondition %}
    AND {% condition crash_usage.sample_id %} ${crash_usage.sample_id_dim} {% endcondition %}
    AND {% condition crash_usage.sample_id %} ${crashes_daily.sample_id} {% endcondition %};;

  always_filter: {
    filters: [
      crash_usage.date: "28 days",
    ]
  }
}
