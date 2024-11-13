
view: ios_credit_card_metrics {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.metrics`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2023-06-23'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(CASE WHEN metrics.boolean.credit_card_autofill_enabled THEN 1 ELSE 0 END), 0) AS credit_card_autofill_enabled,
          COALESCE(SUM(CASE WHEN metrics.boolean.credit_card_sync_enabled THEN 1 ELSE 0 END), 0) AS credit_card_sync_enabled
          FROM `mozdata.firefox_ios.metrics`
      where DATE(submission_timestamp) >= '2023-06-23'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --credit card autofill enabled
          100*COUNT(DISTINCT CASE WHEN credit_card_autofill_enabled > 0 THEN client_id END) AS credit_card_autofill_enabled_users,
          100*COALESCE(SUM(credit_card_autofill_enabled), 0) AS credit_card_autofill_enabled,
          --credit_card_sync_enabled
          100*COUNT(DISTINCT CASE WHEN credit_card_sync_enabled > 0 THEN client_id END) AS credit_card_sync_enabled_users,
          100*COALESCE(SUM(credit_card_sync_enabled), 0) AS credit_card_sync_enabled
          FROM product_features
      where submission_date >= '2023-06-23'
      group by 1)


      select submission_date
      , dau
      , credit_card_autofill_enabled_users
      , credit_card_autofill_enabled
      , credit_card_sync_enabled_users
      , credit_card_sync_enabled
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

  measure: credit_card_autofill_enabled_users {
    type: sum
    sql: ${TABLE}.credit_card_autofill_enabled_users ;;
  }

  measure: credit_card_autofill_enabled {
    type: sum
    sql: ${TABLE}.credit_card_autofill_enabled ;;
  }

  measure: credit_card_sync_enabled_users {
    type: sum
    sql: ${TABLE}.credit_card_sync_enabled_users ;;
  }

  measure: credit_card_sync_enabled {
    type: sum
    sql: ${TABLE}.credit_card_sync_enabled ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      credit_card_autofill_enabled_users,
      credit_card_autofill_enabled,
      credit_card_sync_enabled_users,
      credit_card_sync_enabled
    ]
  }
}
