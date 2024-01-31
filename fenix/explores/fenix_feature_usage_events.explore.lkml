include: "../views/fenix_feature_usage_events.view.lkml"
include: "../views/fenix_dau.view.lkml"

explore: fenix_feature_usage_events {from: feature_usage_events

    sql_always_where: ${fenix_dau.submission_date} >= '2010-01-01'
    AND ${fenix_feature_usage_events.submission_date} >= '2010-01-01'
    ;;

    always_filter: {
      filters: [
        fenix_dau.submission_date: "28 days ago for 27 days",
        fenix_feature_usage_events.submission_date: "28 days ago for 27 days",
      ]
    }

    join: fenix_dau {
      type: left_outer
      relationship: one_to_one
      sql_on: ${fenix_feature_usage_events.submission_date} = ${fenix_dau.submission_date} ;;
  }
}
