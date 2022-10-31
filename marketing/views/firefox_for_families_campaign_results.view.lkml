view: firefox_for_families_campaign_results {
  derived_table: {
    sql: WITH marketing_attributable_metrics AS (
      WITH dau_client AS (
        SELECT
          submission_date,
          client_id,
          COUNTIF(days_since_seen < 1) AS dau,
          COUNTIF(first_seen_date = submission_date) AS new_profiles
        FROM
          `moz-fx-data-shared-prod.telemetry.fenix_clients_last_seen`
        WHERE
          submission_date BETWEEN '2022-08-01' AND CURRENT_DATE
          AND days_since_seen < 1
          AND country IN ('US', 'CA', 'GB', 'DE', 'FR', 'IT', 'ES', 'AT', 'CH', 'BE', 'NL')
        GROUP BY
          1,
          2
      ),
      search AS (
        SELECT
          submission_date,
          client_id,
          SUM(search_count) AS search_count,
          SUM(ad_click) AS ad_clicks
        FROM
          `moz-fx-data-shared-prod.search_derived.mobile_search_clients_daily_v1`
        WHERE
          submission_date BETWEEN '2022-08-01' AND CURRENT_DATE
          AND normalized_app_name = 'Fenix'
          AND os = 'Android'
          AND country IN ('US', 'CA', 'GB', 'DE', 'FR', 'IT', 'ES', 'AT', 'CH', 'BE', 'NL')
        GROUP BY
          1,
          2
      ),
      first_seen AS (
        SELECT
          client_id,
          country,
          MIN(first_seen_date) AS first_seen_date
        FROM
          mozdata.fenix.baseline_clients_first_seen
        WHERE
          first_seen_date >= '2022-08-01'
          AND submission_date BETWEEN '2022-08-01' AND CURRENT_DATE
          AND country IN ('US', 'CA', 'GB', 'DE', 'FR', 'IT', 'ES', 'AT', 'CH', 'BE', 'NL')
        GROUP BY
          1,
          2
      ),
      adjust_client AS (
        SELECT
          client_info.client_id AS client_id,
          ARRAY_AGG(metrics.string.first_session_network)[SAFE_OFFSET(0)] AS adjust_network,
          ARRAY_AGG(metrics.string.first_session_adgroup)[SAFE_OFFSET(0)] AS adjust_adgroup,
          ARRAY_AGG(metrics.string.first_session_campaign)[SAFE_OFFSET(0)] AS adjust_campaign,
          ARRAY_AGG(metrics.string.first_session_creative)[SAFE_OFFSET(0)] AS adjust_creative,
          MIN(DATE(submission_timestamp)) AS first_session_date
        FROM
          `mozdata.fenix.first_session`
        WHERE
          DATE(submission_timestamp) BETWEEN '2022-08-01' AND CURRENT_DATE
          AND metrics.string.first_session_network IS NOT NULL
          AND metrics.string.first_session_network <> ''
        GROUP BY
          1
      )
      SELECT
        submission_date,
        first_seen_date AS cohort_date,
        client_id,
        country,
        adjust_network,
        adjust_adgroup,
        adjust_campaign,
        adjust_creative,
        new_profiles,
        dau,
        coalesce(search_count, 0) AS search_count,
        coalesce(ad_clicks, 0) AS ad_clicks
      FROM
        dau_client
      FULL OUTER JOIN
        search
      USING
        (client_id, submission_date)
      JOIN
        first_seen
      USING
        (client_id)
      JOIN
        adjust_client
      USING
        (client_id)
      ),
      actuals AS (
      SELECT
      CASE WHEN country IN ('US', 'CA') THEN 'North America'
        WHEN country IN ('GB', 'DE', 'FR') THEN 'Tier 1 Europe' -- Germany, France, UK
        WHEN country IN ('IT', 'ES', 'AT', 'CH', 'BE', 'NL') THEN 'European Expansion' -- Italy, Spain, Austria, Switzerland, Belgium, Netherlands
        ELSE 'other' END as country,
      FORMAT_DATE('%Y-%m', submission_date) as month,
      SUM(dau) as cdou, SUM(ad_clicks) as ad_clicks
      FROM marketing_attributable_metrics
      WHERE submission_date >= '2022-08-01'
      AND cohort_date >= '2022-08-01'
      AND adjust_network = 'Google Ads ACI'
      GROUP BY 1, 2
      ),
      forecast AS (
        SELECT
          firefox_for_families_forecasted_expectations.Country_Group  AS country,
          (FORMAT_DATE('%Y-%m', CAST(firefox_for_families_forecasted_expectations.Date AS DATE))) AS month,
          SUM(CASE WHEN metric = 'CDOU all clients' THEN cast(value as numeric) END) as forecast_cdou,
          SUM(CASE WHEN metric = 'Total Ad Clicks' THEN cast(value as numeric) END) as forecast_ad_clicks
      FROM `mozdata.analysis.marketing_firefox_for_families_forecasted_expectations`  AS firefox_for_families_forecasted_expectations
      WHERE LENGTH(firefox_for_families_forecasted_expectations.Country_Group ) <> 0 AND LENGTH(firefox_for_families_forecasted_expectations.Metric ) <> 0 AND (firefox_for_families_forecasted_expectations.Country_Group ) IS NOT NULL AND (firefox_for_families_forecasted_expectations.Metric ) IS NOT NULL
      GROUP BY
          1,
          2
      )
      SELECT country, month, cdou, ad_clicks, forecast_cdou, forecast_ad_clicks
      FROM actuals
      JOIN forecast USING (country, month)
      ORDER BY month, country
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: cdou {
    type: number
    hidden: yes
    sql: ${TABLE}.cdou ;;
  }

  measure: cdou_sum {
    label: "CDOU Actual"
    type: sum
    sql: ${TABLE}.cdou ;;
  }

  dimension: ad_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.ad_clicks ;;
  }

  measure: ad_clicks_sum {
    label: "Ad Clicks Actual"
    type: sum
    sql: ${TABLE}.ad_clicks ;;
  }

  dimension: forecast_cdou {
    type: number
    hidden: yes
    sql: ${TABLE}.forecast_cdou ;;
  }

  measure: forecast_cdou_sum {
    label: "CDOU Forecasted"
    type: sum
    sql: ${TABLE}.forecast_cdou ;;
  }

  dimension: forecast_ad_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.forecast_ad_clicks ;;
  }

  measure: forecast_ad_clicks_sum {
    label: "Ad Clicks Forecasted"
    type: sum
    sql: ${TABLE}.forecast_ad_clicks ;;
  }

  set: detail {
    fields: [
      country,
      month,
      cdou,
      ad_clicks,
      forecast_cdou,
      forecast_ad_clicks
    ]
  }
}
