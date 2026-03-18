
view: ios_awesomebar_location_events {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.events_unnested`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2022-05-16'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          CASE WHEN event_category = 'awesomebar' AND event_name = 'drag_location_bar' THEN 1 ELSE 0 END as drag_location_bar,
          CASE WHEN event_category = 'awesomebar' AND event_name = 'location' AND extra.value = 'top' THEN 1 ELSE 0 END as location_top,
          CASE WHEN event_category = 'awesomebar' AND event_name = 'location' AND extra.value = 'bottom' THEN 1 ELSE 0 END as location_bottom

          FROM `mozdata.firefox_ios.events_unnested`
          LEFT JOIN UNNEST(event_extra) AS extra
      where DATE(submission_timestamp) >= '2022-05-16'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date,
      --drag_location_bar
      100*SUM(drag_location_bar) as drag_location_bar,
      100*COUNT(DISTINCT CASE WHEN drag_location_bar > 0 THEN client_id END) AS drag_location_bar_users,
      -- location_top
      100*SUM(location_top) as location_top,
      100*COUNT(DISTINCT CASE WHEN location_top > 0 THEN client_id END) AS location_top_users,
      -- location_bottom
      100*SUM(location_bottom) as location_bottom,
      100*COUNT(DISTINCT CASE WHEN location_bottom > 0 THEN client_id END) AS location_bottom_users

      FROM product_features
      where submission_date >= '2022-05-16'
      group by 1
      )

      select d.submission_date,
          dau,
          drag_location_bar,
          drag_location_bar_users,
          location_top,
          location_top_users,
          location_bottom,
          location_bottom_users

      from dau_segments d
      LEFT JOIN product_features_agg p
      ON d.submission_date = p.submission_date
      ORDER BY d.submission_date ;;
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

  measure: drag_location_bar {
    type: sum
    sql: ${TABLE}.drag_location_bar ;;
  }

  measure: drag_location_bar_users {
    type: sum
    sql: ${TABLE}.drag_location_bar_users ;;
  }

  measure: location_top {
    type: sum
    sql: ${TABLE}.location_top ;;
  }

  measure: location_top_users {
    type: sum
    sql: ${TABLE}.location_top_users ;;
  }

  measure: location_bottom {
    type: sum
    sql: ${TABLE}.location_bottom ;;
  }

  measure: location_bottom_users {
    type: sum
    sql: ${TABLE}.location_bottom_users ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      drag_location_bar,
      drag_location_bar_users,
      location_top,
      location_top_users,
      location_bottom,
      location_bottom_users
    ]
  }
}
