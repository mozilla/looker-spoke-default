
view: android_bookmark_metrics {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.metrics`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-01-01'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
      client_info.client_id,
      DATE(submission_timestamp) as submission_date,

      COALESCE(SUM(metrics.labeled_counter.metrics_bookmarks_add[SAFE_OFFSET(0)].value), 0) AS bookmarks_add,
      COALESCE(SUM(metrics.labeled_counter.metrics_bookmarks_delete[SAFE_OFFSET(0)].value), 0) AS bookmarks_delete,
      COALESCE(SUM(metrics.labeled_counter.metrics_bookmarks_edit[SAFE_OFFSET(0)].value), 0) AS bookmarks_edit,
      COALESCE(SUM(metrics.labeled_counter.metrics_bookmarks_open[SAFE_OFFSET(0)].value), 0) AS bookmarks_open,

      COALESCE(SUM(metrics.counter.metrics_desktop_bookmarks_count), 0) AS metrics_desktop_bookmarks_count,
      COALESCE(SUM(metrics.counter.metrics_mobile_bookmarks_count), 0) AS metrics_mobile_bookmarks_count,
      COALESCE(SUM(CASE WHEN metrics.boolean.metrics_has_desktop_bookmarks IS TRUE THEN 1 ELSE 0 END), 0) AS metrics_has_desktop_bookmarks,
      COALESCE(SUM(CASE WHEN metrics.boolean.metrics_has_mobile_bookmarks IS TRUE THEN 1 ELSE 0 END), 0) AS metrics_has_mobile_bookmarks

      FROM `mozdata.fenix.metrics`
      where DATE(submission_timestamp) >= '2021-01-01'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
      submission_date,
      --bookmarks_add
      100*COUNT(DISTINCT CASE WHEN bookmarks_add > 0 THEN client_id END) AS bookmarks_add_users,
      100*COALESCE(SUM(bookmarks_add), 0) AS bookmarks_add,
      --bookmarks_delete
      100*COUNT(DISTINCT CASE WHEN bookmarks_delete > 0 THEN client_id END) AS bookmarks_delete_users,
      100*COALESCE(SUM(bookmarks_delete), 0) AS bookmarks_delete,
      --bookmarks_edit
      100*COUNT(DISTINCT CASE WHEN bookmarks_edit > 0 THEN client_id END) AS bookmarks_edit_users,
      100*COALESCE(SUM(bookmarks_edit), 0) AS bookmarks_edit,
      --bookmarks_open
      100*COUNT(DISTINCT CASE WHEN bookmarks_open > 0 THEN client_id END) AS bookmarks_open_users,
      100*COALESCE(SUM(bookmarks_open), 0) AS bookmarks_open,

      --metrics_desktop_bookmarks_count
      100*COUNT(DISTINCT CASE WHEN metrics_desktop_bookmarks_count > 0 THEN client_id END) AS metrics_desktop_bookmarks_count_users,
      100*COALESCE(SUM(metrics_desktop_bookmarks_count), 0) AS metrics_desktop_bookmarks_count,
      --metrics_mobile_bookmarks_count
      100*COUNT(DISTINCT CASE WHEN metrics_mobile_bookmarks_count > 0 THEN client_id END) AS metrics_mobile_bookmarks_count_users,
      100*COALESCE(SUM(metrics_mobile_bookmarks_count), 0) AS metrics_mobile_bookmarks_count,
      --metrics_has_desktop_bookmarks
      100*COUNT(DISTINCT CASE WHEN metrics_has_desktop_bookmarks > 0 THEN client_id END) AS metrics_has_desktop_bookmarks_users,
      100*COALESCE(SUM(metrics_has_desktop_bookmarks), 0) AS metrics_has_desktop_bookmarks,
      --metrics_has_mobile_bookmarks
      100*COUNT(DISTINCT CASE WHEN metrics_has_mobile_bookmarks > 0 THEN client_id END) AS metrics_has_mobile_bookmarks_users,
      100*COALESCE(SUM(metrics_has_mobile_bookmarks), 0) AS metrics_has_mobile_bookmarks,

      FROM product_features
      where submission_date >= '2021-01-01'
      group by 1)


      select d.submission_date
      , dau
      , bookmarks_add_users
      , bookmarks_add
      , bookmarks_delete_users
      , bookmarks_delete
      , bookmarks_edit_users
      , bookmarks_edit
      , bookmarks_open_users
      , bookmarks_open
      , metrics_desktop_bookmarks_count_users
      , metrics_desktop_bookmarks_count
      , metrics_mobile_bookmarks_count_users
      , metrics_mobile_bookmarks_count
      , metrics_has_desktop_bookmarks_users
      , metrics_has_desktop_bookmarks
      , metrics_has_mobile_bookmarks_users
      , metrics_has_mobile_bookmarks
      from dau_segments d
      LEFT JOIN product_features_agg p
      ON d.submission_date = p.submission_date ;;
  }


  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: bookmarks_add_users {
    type: sum
    sql: ${TABLE}.bookmarks_add_users ;;
  }

  measure: bookmarks_add {
    type: sum
    sql: ${TABLE}.bookmarks_add ;;
  }

  measure: bookmarks_delete_users {
    type: sum
    sql: ${TABLE}.bookmarks_delete_users ;;
  }

  measure: bookmarks_delete {
    type: sum
    sql: ${TABLE}.bookmarks_delete ;;
  }

  measure: bookmarks_edit_users {
    type: sum
    sql: ${TABLE}.bookmarks_edit_users ;;
  }

  measure: bookmarks_edit {
    type: sum
    sql: ${TABLE}.bookmarks_edit ;;
  }

  measure: bookmarks_open_users {
    type: sum
    sql: ${TABLE}.bookmarks_open_users ;;
  }

  measure: bookmarks_open {
    type: sum
    sql: ${TABLE}.bookmarks_open ;;
  }

  measure: metrics_desktop_bookmarks_count_users {
    type: sum
    sql: ${TABLE}.metrics_desktop_bookmarks_count_users ;;
  }

  measure: metrics_desktop_bookmarks_count {
    type: sum
    sql: ${TABLE}.metrics_desktop_bookmarks_count ;;
  }

  measure: metrics_mobile_bookmarks_count_users {
    type: sum
    sql: ${TABLE}.metrics_mobile_bookmarks_count_users ;;
  }

  measure: metrics_mobile_bookmarks_count {
    type: sum
    sql: ${TABLE}.metrics_mobile_bookmarks_count ;;
  }

  measure: metrics_has_desktop_bookmarks_users {
    type: sum
    sql: ${TABLE}.metrics_has_desktop_bookmarks_users ;;
  }

  measure: metrics_has_desktop_bookmarks {
    type: sum
    sql: ${TABLE}.metrics_has_desktop_bookmarks ;;
  }

  measure: metrics_has_mobile_bookmarks_users {
    type: sum
    sql: ${TABLE}.metrics_has_mobile_bookmarks_users ;;
  }

  measure: metrics_has_mobile_bookmarks {
    type: sum
    sql: ${TABLE}.metrics_has_mobile_bookmarks ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      bookmarks_add_users,
      bookmarks_add,
      bookmarks_delete_users,
      bookmarks_delete,
      bookmarks_edit_users,
      bookmarks_edit,
      bookmarks_open_users,
      bookmarks_open,
      metrics_desktop_bookmarks_count_users,
      metrics_desktop_bookmarks_count,
      metrics_mobile_bookmarks_count_users,
      metrics_mobile_bookmarks_count,
      metrics_has_desktop_bookmarks_users,
      metrics_has_desktop_bookmarks,
      metrics_has_mobile_bookmarks_users,
      metrics_has_mobile_bookmarks
    ]
  }
}
