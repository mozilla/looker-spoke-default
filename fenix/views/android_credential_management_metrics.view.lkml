
view: android_credential_management_metrics {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.metrics`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-09-04'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,

          --Credential Management: Logins
          COALESCE(SUM(metrics.counter.logins_deleted), 0) AS logins_deleted,
          COALESCE(SUM(metrics.counter.logins_modified), 0) AS logins_modified,
          COALESCE(SUM(metrics.quantity.logins_saved_all), 0) AS currently_stored_logins,

          --Credential Management: Credit Cards
          COALESCE(SUM(metrics.counter.credit_cards_deleted), 0) AS credit_cards_deleted,
          COALESCE(SUM(metrics.quantity.credit_cards_saved_all), 0) AS currently_stored_credit_cards,

          --Credential Management: Addresses
          COALESCE(SUM(metrics.counter.addresses_deleted), 0) AS addresses_deleted,
          COALESCE(SUM(metrics.counter.addresses_updated), 0) AS addresses_modified,
          COALESCE(SUM(metrics.quantity.addresses_saved_all), 0) AS currently_stored_addresses,


          FROM `mozdata.fenix.metrics`
      where DATE(submission_timestamp) >= '2021-09-04'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,

          /*Logins*/
          --logins deleted
          100*COUNT(DISTINCT CASE WHEN logins_deleted > 0 THEN client_id END) AS logins_deleted_users,
          100*COALESCE(SUM(logins_deleted), 0) AS logins_deleted,
          --logins modified
          100*COUNT(DISTINCT CASE WHEN logins_modified > 0 THEN client_id END) AS logins_modified_users,
          100*COALESCE(SUM(logins_modified), 0) AS logins_modified,
          --logins currently stored
          100*COUNT(DISTINCT CASE WHEN currently_stored_logins > 0 THEN client_id END) AS currently_stored_logins_users,
          100*COALESCE(SUM(currently_stored_logins), 0) AS currently_stored_logins,

          /*Credit Card*/
          --credit card deleted
          100*COUNT(DISTINCT CASE WHEN credit_cards_deleted > 0 THEN client_id END) AS credit_cards_deleted_users,
          100*COALESCE(SUM(credit_cards_deleted), 0) AS credit_cards_deleted,
          --credit card currently stored
          100*COUNT(DISTINCT CASE WHEN currently_stored_credit_cards > 0 THEN client_id END) AS currently_stored_credit_cards_users,
          100*COALESCE(SUM(currently_stored_credit_cards), 0) AS currently_stored_credit_cards,

          /*Address*/
          --address deleted
          100*COUNT(DISTINCT CASE WHEN addresses_deleted > 0 THEN client_id END) AS addresses_deleted_users,
          100*COALESCE(SUM(addresses_deleted), 0) AS addresses_deleted,
          --address modified
          100*COUNT(DISTINCT CASE WHEN addresses_modified > 0 THEN client_id END) AS addresses_modified_users,
          100*COALESCE(SUM(addresses_modified), 0) AS addresses_modified,
          -- addresses currently stored
          100*COUNT(DISTINCT CASE WHEN currently_stored_addresses > 0 THEN client_id END) AS currently_stored_addresses_users,
          100*COALESCE(SUM(currently_stored_addresses), 0) AS currently_stored_addresses

      FROM product_features
      where submission_date >= '2021-09-04'
      group by 1)


      select d.submission_date
      , dau
      /*logins*/
      , logins_deleted_users
      , logins_deleted
      , logins_modified_users
      , logins_modified
      , currently_stored_logins_users
      , currently_stored_logins

      /*credit card*/
      , credit_cards_deleted_users
      , credit_cards_deleted
      , currently_stored_credit_cards_users
      , currently_stored_credit_cards

      /*addresses*/
      , addresses_deleted_users
      , addresses_deleted
      , addresses_modified_users
      , addresses_modified
      , currently_stored_addresses_users
      , currently_stored_addresses

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

  measure: logins_deleted_users {
    type: sum
    sql: ${TABLE}.logins_deleted_users ;;
  }

  measure: logins_deleted {
    type: sum
    sql: ${TABLE}.logins_deleted ;;
  }

  measure: logins_modified_users {
    type: sum
    sql: ${TABLE}.logins_modified_users ;;
  }

  measure: logins_modified {
    type: sum
    sql: ${TABLE}.logins_modified ;;
  }

  measure: currently_stored_logins_users {
    type: sum
    sql: ${TABLE}.currently_stored_logins_users ;;
  }

  measure: currently_stored_logins {
    type: sum
    sql: ${TABLE}.currently_stored_logins ;;
  }

  measure: credit_cards_deleted_users {
    type: sum
    sql: ${TABLE}.credit_cards_deleted_users ;;
  }

  measure: credit_cards_deleted {
    type: sum
    sql: ${TABLE}.credit_cards_deleted ;;
  }

  measure: currently_stored_credit_cards_users {
    type: sum
    sql: ${TABLE}.currently_stored_credit_cards_users ;;
  }

  measure: currently_stored_credit_cards {
    type: sum
    sql: ${TABLE}.currently_stored_credit_cards ;;
  }

  measure: addresses_deleted_users {
    type: sum
    sql: ${TABLE}.addresses_deleted_users ;;
  }

  measure: addresses_deleted {
    type: sum
    sql: ${TABLE}.addresses_deleted ;;
  }

  measure: addresses_modified_users {
    type: sum
    sql: ${TABLE}.addresses_modified_users ;;
  }

  measure: addresses_modified {
    type: sum
    sql: ${TABLE}.addresses_modified ;;
  }

  measure: currently_stored_addresses_users {
    type: sum
    sql: ${TABLE}.currently_stored_addresses_users ;;
  }

  measure: currently_stored_addresses {
    type: sum
    sql: ${TABLE}.currently_stored_addresses ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      logins_deleted_users,
      logins_deleted,
      logins_modified_users,
      logins_modified,
      currently_stored_logins_users,
      currently_stored_logins,
      credit_cards_deleted_users,
      credit_cards_deleted,
      currently_stored_credit_cards_users,
      currently_stored_credit_cards,
      addresses_deleted_users,
      addresses_deleted,
      addresses_modified_users,
      addresses_modified,
      currently_stored_addresses_users,
      currently_stored_addresses
    ]
  }
}
