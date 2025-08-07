view: device_partnership_app_opens {
  derived_table: {
    sql: WITH
####################
#Clients with first session ping
####################
first_session AS (
    SELECT
        normalized_country_code AS country,
        DATE_TRUNC(DATE(submission_timestamp), MONTH) as submission_month,
        metrics.string.first_session_distribution_id AS distribution_id,
        COUNT(DISTINCT client_info.client_id) AS partner_app_open_count,
    FROM
        `mozdata.fenix.first_session`  AS first_session
    WHERE
        metrics.string.first_session_distribution_id IS NOT NULL
        AND metrics.string.first_session_distribution_id NOT IN ('Mozilla', 'MozillaOnline')
        AND DATE(submission_timestamp) >= "2025-01-01"
    GROUP BY
    1, 2, 3
),
####################
#DT 001 Device activations
####################
dt_001_activations AS (
    SELECT
        DATE(CONCAT(date, "-01")) as submission_month,
        "dt-001" AS distribution_id,
        CASE
          WHEN country = 'Germany' THEN 'DE'
          WHEN country = 'United Kingdom' THEN 'GB'
          WHEN country = 'Spain' THEN 'ES'
        END as country,
        SUM(preloaded) AS partner_activated
    FROM
        `mozdata.device_manufacturer_partnerships.preload_and_open_telefonica_dt`
    WHERE
        DATE(CONCAT(date, "-01")) >= "2025-01-01"
    GROUP BY 1, 2, 3
),
####################
#DT 002 Device activations
####################
dt_002_activations AS (
    SELECT
        DATE(CONCAT(date, "-01")) as submission_month,
        "dt-002" AS distribution_id,
        country_code as country,
        SUM(preloaded) AS partner_activated,
        --SUM(opened) AS partner_opened_count
    FROM
        `mozdata.device_manufacturer_partnerships.preload_and_open_dt`
    WHERE
        DATE(CONCAT(date, "-01")) >= "2025-01-01"
    GROUP BY 1, 2, 3
),
######
#dt 003 device activations
######
dt_003_activations AS (
    SELECT
        DATE(CONCAT(date, "-01")) as submission_month,
        "dt-003" AS distribution_id,
        country_code as country,
        SUM(preloaded) AS partner_activated
    FROM
        `mozdata.device_manufacturer_partnerships.preload_and_open_dt`
    WHERE
        DATE(CONCAT(date, "-01")) >= "2025-01-01"
    GROUP BY 1, 2, 3
),
####################
#vivo Device activations
####################
vivo_activations AS (
    SELECT
        DATE(CONCAT(date, "-01")) as submission_month,
        "vivo-001" AS distribution_id,
        country_code AS country,
        SUM(activated) as partner_activated
    FROM
        `mozdata.device_manufacturer_partnerships.shipment_and_activation_vivo`
    WHERE
        DATE(CONCAT(date, "-01")) >= "2025-01-01"
    GROUP BY
    1, 2, 3
)
SELECT
    country,
    submission_month,
    distribution_id,
    first_session.partner_app_open_count,
    partner_activated
FROM first_session
RIGHT JOIN dt_002_activations
USING(country, submission_month, distribution_id)
UNION ALL
SELECT
    country,
    submission_month,
    distribution_id,
    first_session.partner_app_open_count,
    partner_activated
FROM first_session
RIGHT JOIN dt_003_activations
USING(country, submission_month, distribution_id)
UNION ALL
SELECT
    country,
    submission_month,
    distribution_id,
    first_session.partner_app_open_count,
    partner_activated
FROM first_session
RIGHT JOIN dt_001_activations
USING(country, submission_month, distribution_id)
UNION ALL
SELECT
    country,
    submission_month,
    distribution_id,
    first_session.partner_app_open_count,
    partner_activated
FROM first_session
RIGHT JOIN vivo_activations
USING(country, submission_month, distribution_id)
      ;;
  }

  dimension: country {
    description: "two letter country code"
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: submission_month {
    description: "submission month in 'YYYY-MM' format"
    type: date_month
    sql: ${TABLE}.submission_month ;;
  }

  dimension: distribution_id {
    description: "the partner distribution id in form dt-001"
    type: string
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: partner_app_open_count {
    description: "the distinct number of clients that opened app"
    type: number
    sql: ${TABLE}.partner_app_open_count ;;
  }

  dimension: partner_activated {
    description: "the number of clients with the app activated"
    type: number
    sql: ${TABLE}.partner_activated ;;
  }

  dimension: ctr {
    description: "partner_app_count/partner_activated"
    type: number
    sql: SAFE_DIVIDE(${TABLE}.partner_app_open_count, ${TABLE}.partner_activated);;
  }

  measure: total_partner_activated {
    description: "total preloaded clients over time"
    type: sum
    sql: ${TABLE}.partner_activated ;;
  }

  measure: total_partner_app_count {
    description: "total number of clients that opened app over time"
    type: sum
    sql: ${TABLE}.partner_app_open_count ;;
  }

  measure: total_ctr {
    description: "total ctr (partner_app_open_count/partner_activated) over time"
    type: number
    sql: SAFE_DIVIDE(${total_partner_app_count}, ${total_partner_activated}) ;;
  }
}
