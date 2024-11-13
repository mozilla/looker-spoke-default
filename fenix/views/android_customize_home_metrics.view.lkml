
view: android_customize_home_metrics {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.metrics`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-09-21'
          AND sample_id = 0
          GROUP BY 1),


      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(CASE WHEN metrics.boolean.customize_home_contile THEN 1 ELSE 0 END)) AS customize_home_contile,
          COALESCE(SUM(CASE WHEN metrics.boolean.customize_home_jump_back_in THEN 1 ELSE 0 END)) AS customize_home_jump_back_in,
          COALESCE(SUM(CASE WHEN metrics.boolean.customize_home_most_visited_sites THEN 1 ELSE 0 END)) AS customize_home_most_visited_sites,
          COALESCE(SUM(CASE WHEN metrics.boolean.customize_home_pocket THEN 1 ELSE 0 END)) AS customize_home_pocket,
          COALESCE(SUM(CASE WHEN metrics.boolean.customize_home_recently_saved THEN 1 ELSE 0 END)) AS customize_home_recently_saved,
          COALESCE(SUM(CASE WHEN metrics.boolean.customize_home_recently_visited THEN 1 ELSE 0 END)) AS customize_home_recently_visited
          FROM `mozdata.fenix.metrics`
      where DATE(submission_timestamp) >= '2021-09-21'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --customize_home_contile
          100*COUNT(DISTINCT CASE WHEN customize_home_contile > 0 THEN client_id END) AS customize_home_contile_users,
          100*COALESCE(SUM(customize_home_contile), 0) AS customize_home_contile,
          --customize_home_jump_back_in_users
          100*COUNT(DISTINCT CASE WHEN customize_home_jump_back_in > 0 THEN client_id END) AS customize_home_jump_back_in_users,
          100*COALESCE(SUM(customize_home_jump_back_in), 0) AS customize_home_jump_back_in,
          --customize_home_most_visited_sites_users
          100*COUNT(DISTINCT CASE WHEN customize_home_most_visited_sites > 0 THEN client_id END) AS customize_home_most_visited_sites_users,
          100*COALESCE(SUM(customize_home_most_visited_sites), 0) AS customize_home_most_visited_sites,
          --customize_home_pocket_users
          100*COUNT(DISTINCT CASE WHEN customize_home_pocket > 0 THEN client_id END) AS customize_home_pocket_users,
          100*COALESCE(SUM(customize_home_pocket), 0) AS customize_home_pocket,
          --customize_home_recently_saved_users
          100*COUNT(DISTINCT CASE WHEN customize_home_recently_saved > 0 THEN client_id END) AS customize_home_recently_saved_users,
          100*COALESCE(SUM(customize_home_recently_saved), 0) AS customize_home_recently_saved,
          --customize_home_recently_visited_users
          100*COUNT(DISTINCT CASE WHEN customize_home_recently_visited > 0 THEN client_id END) AS customize_home_recently_visited_users,
          100*COALESCE(SUM(customize_home_recently_visited), 0) AS customize_home_recently_visited
      FROM product_features
      where submission_date >= '2021-09-21'
      group by 1)


      select d.submission_date,
      dau,
      customize_home_contile_users,
      customize_home_contile,
      customize_home_jump_back_in_users,
      customize_home_jump_back_in,
      customize_home_most_visited_sites_users,
      customize_home_most_visited_sites,
      customize_home_pocket_users,
      customize_home_pocket,
      customize_home_recently_saved_users,
      customize_home_recently_saved,
      customize_home_recently_visited_users,
      customize_home_recently_visited
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

  measure: customize_home_contile_users {
    type: sum
    sql: ${TABLE}.customize_home_contile_users ;;
  }

  measure: customize_home_contile {
    type: sum
    sql: ${TABLE}.customize_home_contile ;;
  }

  measure: customize_home_jump_back_in_users {
    type: sum
    sql: ${TABLE}.customize_home_jump_back_in_users ;;
  }

  measure: customize_home_jump_back_in {
    type: sum
    sql: ${TABLE}.customize_home_jump_back_in ;;
  }

  measure: customize_home_most_visited_sites_users {
    type: sum
    sql: ${TABLE}.customize_home_most_visited_sites_users ;;
  }

  measure: customize_home_most_visited_sites {
    type: sum
    sql: ${TABLE}.customize_home_most_visited_sites ;;
  }

  measure: customize_home_pocket_users {
    type: sum
    sql: ${TABLE}.customize_home_pocket_users ;;
  }

  measure: customize_home_pocket {
    type: sum
    sql: ${TABLE}.customize_home_pocket ;;
  }

  measure: customize_home_recently_saved_users {
    type: sum
    sql: ${TABLE}.customize_home_recently_saved_users ;;
  }

  measure: customize_home_recently_saved {
    type: sum
    sql: ${TABLE}.customize_home_recently_saved ;;
  }

  measure: customize_home_recently_visited_users {
    type: sum
    sql: ${TABLE}.customize_home_recently_visited_users ;;
  }

  measure: customize_home_recently_visited {
    type: sum
    sql: ${TABLE}.customize_home_recently_visited ;;
  }

  set: detail {
    fields: [
      dau,
      customize_home_contile_users,
      customize_home_contile,
      customize_home_jump_back_in_users,
      customize_home_jump_back_in,
      customize_home_most_visited_sites_users,
      customize_home_most_visited_sites,
      customize_home_pocket_users,
      customize_home_pocket,
      customize_home_recently_saved_users,
      customize_home_recently_saved,
      customize_home_recently_visited_users,
      customize_home_recently_visited
    ]
  }
}
