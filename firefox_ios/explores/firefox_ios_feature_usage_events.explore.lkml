include: "../views/firefox_ios_feature_usage_events.view.lkml"
include: "../views/firefox_ios_dau.view.lkml"

explore: firefox_ios_feature_usage_events {from: feature_usage_events

  sql_always_where: ${firefox_ios_dau.submission_date} >= '2010-01-01'
    AND ${firefox_ios_feature_usage_events.submission_date} >= '2010-01-01'
    ;;

  always_filter: {
    filters: [
      firefox_ios_dau.submission_date: "28 days ago for 27 days",
      firefox_ios_feature_usage_events.submission_date: "28 days ago for 27 days",
    ]
  }

  join: firefox_ios_dau {
    type: left_outer
    relationship: one_to_one
    sql_on: ${firefox_ios_feature_usage_events.submission_date} = ${firefox_ios_dau.submission_date} ;;
  }
}
