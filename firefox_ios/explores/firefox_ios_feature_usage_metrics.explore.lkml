include: "../views/firefox_ios_feature_usage_metrics.view.lkml"
include: "../views/firefox_ios_dau.view.lkml"

explore: firefox_ios_feature_usage_metrics {

  sql_always_where: ${firefox_ios_dau.submission_date} >= '2022-01-01'
    AND ${firefox_ios_feature_usage_metrics.ping_date} >= '2022-01-01'
    ;;


  join: firefox_ios_dau {
    type: inner
    relationship: one_to_one
    sql_on: ${firefox_ios_feature_usage_metrics.ping_date} = ${firefox_ios_dau.submission_date};;
  }
}
