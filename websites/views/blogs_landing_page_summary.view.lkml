include: "//looker-hub/websites/views/blogs_landing_page_summary.view.lkml"

view: +blogs_landing_page_summary {
  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: standardized_country_name {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: content {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: blog {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: subblog {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: cleaned_landing_page {
    type: string
    sql: ${TABLE}.country ;;
  }


  ######################################################


  measure: sessions {
    label: "Search Counts"
    type: sum
    sql: ${TABLE}.sessions;;
  }

  measure: downloads {
    label: "Search Counts"
    type: sum
    sql: ${TABLE}.downloads;;
  }

  measure: social_share {
    label: "Search Counts"
    type: sum
    sql: ${TABLE}.social_share;;
  }

  measure: newsletter_subscription {
    label: "Search Counts"
    type: sum
    sql: ${TABLE}.newsletter_subscription;;
  }
}