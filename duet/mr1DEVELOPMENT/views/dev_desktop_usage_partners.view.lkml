view: dev_desktop_usage_partners {
  derived_table: {
    sql:
    WITH tbl AS (
SELECT first_seen_date AS submission_date,
       CASE
           WHEN country IN ('US',
                                 'GB',
                                 'DE',
                                 'FR',
                                 'CA',
                                 'BR',
                                 'MX',
                                 'CN',
                                 'IN',
                                 'AU',
                                 'NL',
                                 'ES',
                                 'RU') THEN country
           ELSE 'ROW'
       END AS normalized_country_code_subset,
CASE
           WHEN os IN ('Windows',
                       'Windows_NT')
                AND os_version = 10 THEN 'Win10/11'
           WHEN os IN ('Windows',
                       'Windows_NT')
                AND os_version = 6.1 THEN 'Win7'
           WHEN os IN ('Windows',
                       'Windows_NT')
                AND os_version IN (6.2,
                                   6.3) THEN 'Win8/8.1'
           WHEN os IN ('Windows',
                       'Windows_NT')
                AND os_version NOT IN (10,
                                       6.1,
                                       6.2,
                                       6.3) THEN 'Win Other'
           WHEN os IN ('Linux') THEN 'Linux'
           WHEN os IN ('Mac',
                       'Darwin') THEN 'MacOS'
           ELSE 'Other'
       END AS os_group,
      funnel_derived,
      partner_org,
      distribution_model,
       distribution_id,
       count(*) AS new_profiles,
       SUM(CASE
               WHEN qualified_second_day = TRUE THEN 1
               ELSE 0
           END) AS returned_second_day,
       SUM(CASE
               WHEN qualified_week4 = TRUE THEN 1
               ELSE 0
           END) AS retained_week4
FROM `mozdata.telemetry.clients_first_seen_28_days_later`
WHERE first_seen_date >= '2021-01-01'
  AND DATE_DIFF(current_date(), first_seen_date, DAY) > 1
GROUP BY 1,
         2,
         3,
         4,
         5,
         6, 7
        )
    SELECT
      *,

      AVG(new_profiles) OVER
      (PARTITION BY funnel_derived, normalized_country_code_subset,
      os_group, partner_org, distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      AS new_profiles_smoothed,

      AVG(returned_second_day) OVER
      (PARTITION BY funnel_derived, normalized_country_code_subset,
      os_group, partner_org, distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      AS returned_second_day_smoothed,
      AVG(retained_week4) OVER
      (PARTITION BY funnel_derived, normalized_country_code_subset,
      os_group, partner_org, distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      AS retained_week4_smoothed
      FROM tbl
      ;;
  }



  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz:  no
    datatype:  date
    description: "Date when we recieved the first Telemetry ping from user. Is renamed from first_seen_date"
  }

  dimension: normalized_country_code_subset {
    sql: ${TABLE}.normalized_country_code_subset
      ;;
    type: string
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code. Other then those 8 countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: ${TABLE}.funnel_derived
      ;;
    type: string
    description: "defining membership in the different firefox acquisition funnels"
  }

  dimension: os_group {
    sql: ${TABLE}.os_group
      ;;
    type: string
    description: "os grouping"
  }

  dimension: partner_org {
    sql: ${TABLE}.partner_org
      ;;
    type: string
    description: "which partner org acquisition is from - only valid for funnel_derived = partner, otherwise will be non-distribution"
  }

  dimension: distribution_model {
    sql: ${TABLE}.distribution_model
      ;;
    type: string
    description: "how partner distributes FF - only valid for funnel_derived = partner, otherwise will be non-distribution"
  }

  dimension: distribution_id {
    sql: ${TABLE}.distribution_id
      ;;
    type: string
    description: "raw distribution id"
  }

  dimension: tmp_piechart_breakdown {
    sql: CASE WHEN ${TABLE}.partner_org IN ('Mozilla - China', 'Microsoft (store)')
         THEN ${TABLE}.partner_org ELSE ${TABLE}.distribution_model END
      ;;
    type: string
    description: "temp breakdown for a pie chart mixing partner org and distribution model"
  }

  measure: new_profiles {
    type: sum
    sql: ${TABLE}.new_profiles ;;
    description: "Total number of new profiles"
  }

  measure: returned_second_day {
    type: sum
    sql: ${TABLE}.returned_second_day ;;
    description: "Total number of new profiles who returned for a second session within 28 days"
  }

  measure: retained_week4 {
    type: sum
    sql: ${TABLE}.retained_week4;;
    description: "Total number of new profiles who were week 4 retained: active (sent main ping) between days 21-28"
  }

  measure: new_profiles_smoothed {
    type: sum
    sql: ${TABLE}.new_profiles_smoothed ;;
    description: "Total number of new profiles smoothed"
  }

  measure: returned_second_day_smoothed {
    type: sum
    sql: ${TABLE}.returned_second_day_smoothed ;;
    description: "metric 7 day smoothed"
  }

  measure: retained_week4_smoothed {
    type: sum
    sql: ${TABLE}.retained_week4_smoothed;;
    description: "metric 7 day smoothed"
  }

  # placeholder to put empty slot into visualization until installs data drops
  measure: tmp_installs_placeholder {
    type: sum
    sql: 0;;
    description: "placeholder for installs"
  }

  # parameters below

  dimension: join_field {
    type: yesno
    description: "Always set to true. Allows to merge explores."
    sql: TRUE ;;
  }

  filter: analysis_period {
    type: date
    description: "the start date and end date of the window being checked. will be dashboard or user inputed, not referring to data in the table"
  }

  parameter: year_over_year {
    type: yesno
    description: "Flag to determine whether data from last year should be used"
    default_value: "no"
  }
}
