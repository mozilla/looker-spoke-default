view: whats_new_page_events {
  derived_table: {
    sql:
      SELECT date,
             locale,
             page_level_2 AS version,
             country,
             event_label,
             sum(total_events) as total_events,
            sum(unique_events) as unique_events
     FROM `moz-fx-data-marketing-prod.ga_derived.www_site_events_metrics_v1`
     WHERE page_name LIKE '/firefox/%/whatsnew%'
    AND page_level_1 = 'firefox'
    AND page_level_3 = 'whatsnew'
     GROUP by 1, 2, 3, 4, 5
      ;;
  }

  dimension_group: date {
    sql: ${TABLE}.date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }


  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
  }

  dimension: version {
    sql: ${TABLE}.version ;;
    type: string
  }

  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
  }
  dimension: event_label {
    sql: ${TABLE}.event_label ;;
    type: string
  }
  measure:  total_events {
    label: "Total whats new page events"
    type: sum
    sql: ${TABLE}.total_events ;;
  }

  measure:  unique_events {
    label: "Unique whats new page events"
    type: sum
    sql: ${TABLE}.unique_events ;;
  }
 }
