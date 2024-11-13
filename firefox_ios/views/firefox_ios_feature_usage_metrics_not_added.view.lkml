include: "//looker-hub/firefox_ios/views/metrics.view.lkml"


view: firefox_ios_feature_usage_metrics_not_added {
  derived_table: {
    sql:
      WITH _metrics_ping_distinct_client_count AS (
  SELECT
    DATE(submission_timestamp) AS submission_date,
    COUNT(DISTINCT client_info.client_id) AS metrics_ping_distinct_client_count
  FROM
    firefox_ios.metrics
  WHERE
    DATE(submission_timestamp) >= '2023-11-24'
  GROUP BY
    submission_date
),

      product_features AS (
      SELECT
      client_info.client_id,
      DATE(submission_timestamp) AS submission_date,
      /*Credit Card*/
      COALESCE(SUM(metrics.counter.credit_card_deleted), 0) AS credit_card_deleted,
      COALESCE(SUM(metrics.counter.credit_card_modified), 0) AS credit_card_modified,
      COALESCE(SUM(metrics.counter.credit_card_saved), 0) AS credit_card_saved,
      COALESCE(SUM(metrics.quantity.credit_card_saved_all), 0) AS credit_card_saved_all,
      FROM `mozdata.firefox_ios.metrics` AS metric
      WHERE DATE(submission_timestamp) >= '2023-11-24'
      GROUP BY
      client_id,
      submission_date),


      product_features_agg AS (
      SELECT
      submission_date,
      /*Credit Card*/
      COUNT(
      DISTINCT
      CASE
      WHEN credit_card_deleted > 0
      THEN client_id
      END
      ) AS credit_card_deleted_users,
      SUM(credit_card_deleted) AS credit_card_deleted,
      COUNT(
      DISTINCT
      CASE
      WHEN credit_card_modified > 0
      THEN client_id
      END
      ) AS credit_card_modified_users,
      SUM(credit_card_modified) AS credit_card_modified,
      COUNT(
      DISTINCT
      CASE
      WHEN credit_card_saved > 0
      THEN client_id
      END
      ) AS credit_card_saved_users,
      SUM(credit_card_saved) AS credit_card_saved,
      COUNT(
      DISTINCT
      CASE
      WHEN credit_card_saved_all > 0
      THEN client_id
      END
      ) AS credit_card_saved_all_users,
      SUM(credit_card_saved_all) AS credit_card_saved_all
      FROM
      product_features
      GROUP BY
      submission_date

      )

      SELECT
      submission_date,
      metrics_ping_distinct_client_count,
      /*Credit Card*/
      credit_card_deleted_users,
      credit_card_deleted,
      credit_card_modified,
      credit_card_modified_users,
      credit_card_saved,
      credit_card_saved_users,
      credit_card_saved_all,
      credit_card_saved_all_users
      FROM
      _metrics_ping_distinct_client_count
      JOIN
      product_features_agg
      USING
      (submission_date)
      ;;}


  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: metrics_ping_distinct_client_count {
    type: sum
    sql: ${TABLE}.metrics_ping_distinct_client_count ;;
  }

  measure: credit_card_deleted_users {
    type: sum
    sql: ${TABLE}.credit_card_deleted_users ;;
  }

  measure: credit_card_deleted {
    type: sum
    sql: ${TABLE}.credit_card_deleted ;;
  }

  measure: credit_card_modified {
    type: sum
    sql: ${TABLE}.credit_card_modified ;;
  }

  measure: credit_card_modified_users {
    type: sum
    sql: ${TABLE}.credit_card_modified_users ;;
  }

  measure: credit_card_saved {
    type: sum
    sql: ${TABLE}.credit_card_saved ;;
  }

  measure: credit_card_saved_users {
    type: sum
    sql: ${TABLE}.credit_card_saved_users ;;
  }

  measure: credit_card_saved_all {
    type: sum
    sql: ${TABLE}.credit_card_saved_all ;;
  }

  measure: credit_card_saved_all_users {
    type: sum
    sql: ${TABLE}.credit_card_saved_all_users ;;
  }

}
