view: device_partnership_app_opens {
  derived_table: {
    sql: WITH new_profiles AS (
        SELECT DATE_TRUNC(submission_date, MONTH) as date,
        country_code,
        distribution_id,
        COUNTIF(is_new_profile) as monthly_new_profiles
      FROM
        `moz-fx-data-shared-prod.device_manufacturer_partnerships.fenix_distribution_deal_clients`
      WHERE
        submission_date >= '2025-03-01'
      GROUP BY
        ALL
      ),
      preloads AS (SELECT * FROM
      `moz-fx-data-shared-prod.device_manufacturer_partnerships.fenix_preload_and_open`
      WHERE date >= '2025-03-01')

      SELECT preloads.date AS submission_month,
      preloads.distribution_id,
      preloads.country,
      preloads.country_code,
      preloads.region_name,
      preloads.subregion_name,
      preloads.preloaded,
      new_profiles.monthly_new_profiles
      FROM preloads
      JOIN new_profiles
      USING(date, distribution_id, country_code)
      ;;
  }

  dimension_group: submission_date {
    type: time
    sql: TIMESTAMP(${TABLE}.submission_month) ;;  # Replace with your actual column name
    timeframes: [raw, date, month, quarter, year]
  }

  dimension: distribution_id {
    description: "the partner distribution id in form dt-001"
    type: string
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: country {
    description: "country name"
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: country_code {
    description: "two letter country code"
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: region_name {
    description: "region name"
    type: string
    sql: ${TABLE}.region_name ;;
  }

  dimension: subregion_name {
    description: "subregion_name"
    type: string
    sql: ${TABLE}.subregion_name ;;
  }

  dimension: preloaded {
    description: "the number of devices with Fx preloaded"
    type: number
    sql: ${TABLE}.preloaded ;;
    hidden: yes
  }

  dimension: monthly_new_profiles {
    description: "the number of new profiles that opened the app"
    type: number
    sql: ${TABLE}.monthly_new_profiles ;;
    hidden: yes
  }

  measure: preloads {
    description: "sum of preloaded devices over time"
    type: sum
    sql: ${TABLE}.preloaded ;;
  }

  measure: new_profiles {
    description: "sum of new clients that opened app over time"
    type: sum
    sql: ${TABLE}.monthly_new_profiles ;;
  }

  measure: app_open_rate {
    description: "app_open_rate (new_profiles/preloads) over time"
    type: number
    sql: SAFE_DIVIDE(${new_profiles}, ${preloads}) ;;
    value_format_name: percent_2
  }
}
