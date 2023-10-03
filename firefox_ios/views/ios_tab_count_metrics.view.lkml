
view: ios_tab_count_metrics {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.metrics`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2022-03-22'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(metrics.quantity.tabs_normal_tabs_quantity), 0) AS tabs_normal_tabs_quantity,
          COALESCE(SUM(metrics.quantity.tabs_private_tabs_quantity), 0) AS tabs_private_tabs_quantity,
          COALESCE(SUM(metrics.quantity.tabs_inactive_tabs_count), 0) AS tabs_inactive_tabs_count

          FROM `mozdata.firefox_ios.metrics`
      where DATE(submission_timestamp) >= '2022-03-22'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --tabs_normal_tabs_quantity
          100*COUNT(DISTINCT CASE WHEN tabs_normal_tabs_quantity > 0 THEN client_id END) AS tabs_normal_tabs_quantity_users,
          100*COALESCE(SUM(tabs_normal_tabs_quantity), 0) AS tabs_normal_tabs_quantity,
          -- tabs_private_tabs_quantity
          100*COUNT(DISTINCT CASE WHEN tabs_private_tabs_quantity > 0 THEN client_id END) AS tabs_private_tabs_quantity_users,
          100*COALESCE(SUM(tabs_private_tabs_quantity), 0) AS tabs_private_tabs_quantity,
          --tabs_inactive_tabs_count
          100*COUNT(DISTINCT CASE WHEN tabs_inactive_tabs_count > 0 THEN client_id END) AS tabs_inactive_tabs_count_users,
          100*COALESCE(SUM(tabs_inactive_tabs_count), 0) AS tabs_inactive_tabs_count

          FROM product_features
      where submission_date >= '2022-03-22'
      group by 1)


      select submission_date,
      dau,
      tabs_normal_tabs_quantity_users,
      tabs_normal_tabs_quantity,
      tabs_private_tabs_quantity_users,
      tabs_private_tabs_quantity,
      tabs_inactive_tabs_count_users,
      tabs_inactive_tabs_count

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

  measure: tabs_normal_tabs_quantity_users {
    type: sum
    sql: ${TABLE}.tabs_normal_tabs_quantity_users ;;
  }

  measure: tabs_normal_tabs_quantity {
    type: sum
    sql: ${TABLE}.tabs_normal_tabs_quantity ;;
  }

  measure: tabs_private_tabs_quantity_users {
    type: sum
    sql: ${TABLE}.tabs_private_tabs_quantity_users ;;
  }

  measure: tabs_private_tabs_quantity {
    type: sum
    sql: ${TABLE}.tabs_private_tabs_quantity ;;
  }

  measure: tabs_inactive_tabs_count_users {
    type: sum
    sql: ${TABLE}.tabs_inactive_tabs_count_users ;;
  }

  measure: tabs_inactive_tabs_count {
    type: sum
    sql: ${TABLE}.tabs_inactive_tabs_count ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      tabs_normal_tabs_quantity_users,
      tabs_normal_tabs_quantity,
      tabs_private_tabs_quantity_users,
      tabs_private_tabs_quantity,
      tabs_inactive_tabs_count_users,
      tabs_inactive_tabs_count
    ]
  }
}
