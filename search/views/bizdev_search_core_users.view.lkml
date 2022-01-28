view: bizdev_search_core_users {
  derived_table: {
    # TODO: Make this a PDT
    # increment_key: "submission_month"
    # increment_offset: 1
    # sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH)  ;;
    sql: SELECT
              client_id,
              DATE_TRUNC(submission_date, MONTH) as month,
              normalized_engine,
              country,
              count(DISTINCT submission_date) AS days_of_use,
              COALESCE(SUM(sap), 0) AS searches,
              COALESCE(SUM(search_with_ads), 0) AS search_with_ads,
              COALESCE(SUM(ad_click), 0) AS ad_click
         FROM
              search.search_clients_engines_sources_daily
        -- WHERE
        --     {% incrementcondition %} submission_date {%  endincrementcondition %}
        --     -- AND submission_date >= DATE("2019-01-01")
         GROUP BY 1, 2, 3, 4
       ;;
  }

  dimension_group: submission {
    sql: ${TABLE}.month ;;
    type: time
    timeframes: [
      month,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: normalized_engine {
    type: string
    sql: ${TABLE}.normalized_engine ;;
  }

  dimension: ad_click_bucket {
    type: string
    sql:  CASE
              WHEN ${TABLE}.ad_click >= 10 THEN 'Highest (10+)'
              WHEN ${TABLE}.ad_click > 0 THEN 'Moderate (1-9)'
              ELSE 'None'
          END ;;
  }

  dimension: product_usage {
    type: string
    sql:  CASE
              WHEN days_of_use >= 21 THEN 'Heavy-Browser'
              ELSE 'Light-Browser'
          END ;;
  }

  measure: searches {
    type: sum
    sql: ${TABLE}.searches ;;
  }

  measure: search_with_ads {
    type: sum
    sql: ${TABLE}.search_with_ads ;;
  }

  measure: ad_clicks {
    type: sum
    sql: ${TABLE}.ad_click ;;
  }

  measure: days_of_use {
    type: sum
    sql: ${TABLE}.days_of_use ;;
  }

  measure: clients {
    type: count_distinct
    sql: ${TABLE}.client_id ;;
  }

}
