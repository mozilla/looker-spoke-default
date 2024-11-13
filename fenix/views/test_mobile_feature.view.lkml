
view: test_mobile_feature {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT submission_date, SUM(DAU) as dau
          FROM `moz-fx-data-shared-prod.telemetry.active_users_aggregates`
          WHERE app_name = 'Fenix'
          --AND channel = 'release'
          AND submission_date >= '2022-12-04'
          GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(metrics.counter.credit_cards_deleted), 0) AS credit_cards_deleted,
          COALESCE(SUM(metrics.quantity.credit_cards_saved_all), 0) AS currently_stored_credit_cards,
          FROM `mozdata.fenix.metrics`
      where DATE(submission_timestamp) >= '2022-12-04'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --credit card deleted
          100*COUNT(DISTINCT CASE WHEN credit_cards_deleted > 0 THEN client_id END) AS credit_cards_deleted_users,
          100*COALESCE(SUM(credit_cards_deleted), 0) AS credit_cards_deleted,
          --credit card currently stored
          100*COUNT(DISTINCT CASE WHEN currently_stored_credit_cards > 0 THEN client_id END) AS currently_stored_credit_cards_users,
          100*COALESCE(SUM(currently_stored_credit_cards), 0) AS currently_stored_credit_cards
          FROM product_features
      where submission_date >= '2022-12-04'
      group by 1)


      select d.submission_date
      -- credit card deleted
      , SAFE_DIVIDE(p.credit_cards_deleted, p.credit_cards_deleted_users) AS credit_cards_deleted_avg
      , dau
      , p.credit_cards_deleted
      , p.currently_stored_credit_cards
      , p.credit_cards_deleted_users
      , 100*SAFE_DIVIDE(p.credit_cards_deleted_users, dau) AS credit_cards_deleted_frac
      -- credit card currently stored
      , SAFE_DIVIDE(p.currently_stored_credit_cards, currently_stored_credit_cards_users) AS currently_stored_credit_cards_avg
      , currently_stored_credit_cards_users
      , 100*SAFE_DIVIDE(currently_stored_credit_cards_users, dau) AS currently_stored_credit_cards_frac
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

  measure: credit_cards_deleted_users {
    type: sum
    sql: ${TABLE}.credit_cards_deleted_users ;;
  }

  measure: currently_stored_credit_cards_users {
    type: sum
    sql: ${TABLE}.currently_stored_credit_cards_users ;;
  }

  measure: credit_cards_deleted {
    type: sum
    sql: ${TABLE}.credit_cards_deleted ;;
  }

  measure: currently_stored_credit_cards {
    type: sum
    sql: ${TABLE}.currently_stored_credit_cards ;;
  }


  set: detail {
    fields: [
        submission_date,
  dau,
  credit_cards_deleted_users,
  currently_stored_credit_cards_users,
  credit_cards_deleted,
  currently_stored_credit_cards
    ]
  }
}
