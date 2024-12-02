view: firefox_whats_new_page_summary {
  derived_table: {
    sql:
      with wnp_visits as (
          SELECT
              date,
              visit_identifier,
              hit_number,
              bounces,
              first_interaction,
              TRIM(page_path_level1, '/') AS locale,
              page_level_2 AS version,
              country,
              IF(hit_number = first_interaction AND bounces = 1, TRUE, FALSE) AS is_bounce
         FROM `moz-fx-data-marketing-prod.ga.www_site_hits`
         WHERE page_name LIKE '/firefox/%/whatsnew%'
           AND hit_type = 'PAGE'
           AND page_level_1 = 'firefox'
           AND page_level_3 = 'whatsnew'
        )
    select date, country, locale, version,
           COUNT(distinct visit_identifier) as visits,
           COUNT(distinct case when is_bounce = TRUE then visit_identifier end) as bounces
    from wnp_visits
    group by 1, 2, 3, 4
        ;;
  }

  dimension_group: date {
    type: time
    # view_label: "Date/Period Selection"
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }
  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: visits {
    description: "Unique visits to the wnp page"
    type: sum
    sql: ${TABLE}.visits ;;
  }

  measure: bounces {
    description: "Bounces on the wnp page"
    type: sum
    sql: ${TABLE}.bounces ;;
  }
}
