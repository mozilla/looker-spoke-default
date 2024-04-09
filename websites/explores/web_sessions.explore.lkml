include: "../views/web_sessions.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: web_sessions {
  view_name: web_sessions

  always_filter: {
    filters: [
      web_sessions.submission_date_filter: "28 days",
      web_sessions.app_id: ""
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${web_sessions.normalized_country_code} = ${countries.code} ;;
  }

}
