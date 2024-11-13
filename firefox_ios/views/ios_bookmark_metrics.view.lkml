
view: ios_bookmark_metrics {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.firefox_ios.metrics`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2020-08-25'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(metrics.labeled_counter.bookmarks_add[SAFE_OFFSET(0)].value), 0) AS bookmarks_add,
          COALESCE(SUM(metrics.labeled_counter.bookmarks_delete[SAFE_OFFSET(0)].value), 0) AS bookmarks_delete,
          COALESCE(SUM(metrics.labeled_counter.bookmarks_edit[SAFE_OFFSET(0)].value), 0) AS bookmarks_edit,
          COALESCE(SUM(CASE WHEN metrics.boolean.bookmarks_has_mobile_bookmarks THEN 1 ELSE 0 END), 0) AS has_mobile_bookmarks,
          COALESCE(SUM(metrics.quantity.bookmarks_mobile_bookmarks_count), 0) AS mobile_bookmarks_count,
          COALESCE(SUM(metrics.labeled_counter.bookmarks_open[SAFE_OFFSET(0)].value), 0) AS bookmarks_open,
          COALESCE(SUM(metrics.labeled_counter.bookmarks_view_list[SAFE_OFFSET(0)].value), 0) AS bookmarks_view_list

          FROM `mozdata.firefox_ios.metrics`
      where DATE(submission_timestamp) >= '2020-08-25'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --bookmarks_add
          100*COUNT(DISTINCT CASE WHEN bookmarks_add > 0 THEN client_id END) AS bookmarks_add_users,
          100*COALESCE(SUM(bookmarks_add), 0) AS bookmarks_add,

          -- Bookmarks Delete
          100*COUNT(DISTINCT CASE WHEN bookmarks_delete > 0 THEN client_id END) AS bookmarks_delete_users,
          100*COALESCE(SUM(bookmarks_delete), 0) AS bookmarks_delete,

          -- Bookmarks Edit
          100*COUNT(DISTINCT CASE WHEN bookmarks_edit > 0 THEN client_id END) AS bookmarks_edit_users,
          100*COALESCE(SUM(bookmarks_edit), 0) AS bookmarks_edit,

          -- Has Mobile Bookmarks
          100*COUNT(DISTINCT CASE WHEN has_mobile_bookmarks > 0 THEN client_id END) AS has_mobile_bookmarks_users,
          100*COALESCE(SUM(has_mobile_bookmarks), 0) AS has_mobile_bookmarks,

          -- Mobile Bookmarks Count
          100*COUNT(DISTINCT CASE WHEN mobile_bookmarks_count > 0 THEN client_id END) AS mobile_bookmarks_count_users,
          100*COALESCE(SUM(mobile_bookmarks_count), 0) AS mobile_bookmarks_count,

          -- Bookmarks Open
          100*COUNT(DISTINCT CASE WHEN bookmarks_open > 0 THEN client_id END) AS bookmarks_open_users,
          100*COALESCE(SUM(bookmarks_open), 0) AS bookmarks_open,

          -- Bookmarks View List
          100*COUNT(DISTINCT CASE WHEN bookmarks_view_list > 0 THEN client_id END) AS bookmarks_view_list_users,
          100*COALESCE(SUM(bookmarks_view_list), 0) AS bookmarks_view_list

          FROM product_features
      where submission_date >= '2020-08-25'
      group by 1)


      select submission_date,
      dau,
      bookmarks_add_users,
      bookmarks_add,
      bookmarks_delete_users,
      bookmarks_delete,
      bookmarks_edit_users,
      bookmarks_edit,
      has_mobile_bookmarks_users,
      has_mobile_bookmarks,
      mobile_bookmarks_count_users,
      mobile_bookmarks_count,
      bookmarks_open_users,
      bookmarks_open,
      bookmarks_view_list_users,
      bookmarks_view_list
      from dau_segments
      JOIN product_features_agg
      USING (submission_date) ;;
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

  measure: has_mobile_bookmarks_users {
    type: sum
    sql: ${TABLE}.has_mobile_bookmarks_users ;;
  }

  measure: has_mobile_bookmarks {
    type: sum
    sql: ${TABLE}.has_mobile_bookmarks ;;
  }

  measure: mobile_bookmarks_count_users {
    type: sum
    sql: ${TABLE}.mobile_bookmarks_count_users ;;
  }

  measure: mobile_bookmarks_count {
    type: sum
    sql: ${TABLE}.mobile_bookmarks_count ;;
  }

  measure: bookmarks_open_users {
    type: sum
    sql: ${TABLE}.bookmarks_open_users ;;
  }

  measure: bookmarks_open {
    type: sum
    sql: ${TABLE}.bookmarks_open ;;
  }

  measure: bookmarks_view_list_users {
    type: sum
    sql: ${TABLE}.bookmarks_view_list_users ;;
  }

  measure: bookmarks_view_list {
    type: sum
    sql: ${TABLE}.bookmarks_view_list ;;
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
      has_mobile_bookmarks_users,
      has_mobile_bookmarks,
      mobile_bookmarks_count_users,
      mobile_bookmarks_count,
      bookmarks_open_users,
      bookmarks_open,
      bookmarks_view_list_users,
      bookmarks_view_list
    ]
  }
}
