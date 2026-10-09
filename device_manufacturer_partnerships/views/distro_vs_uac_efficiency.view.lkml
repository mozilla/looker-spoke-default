view: distro_vs_uac_efficiency {
  derived_table: {
    sql: WITH mobile_distro_profiles AS (
        -- New profiles come from the client-level table, which picks up upstream backfills
        -- that the aggregated fenix_distribution_deals table can miss.
        SELECT
          DATE_TRUNC(submission_date, QUARTER) AS quarter,
          country_code,
          distribution_id,
          COUNTIF(is_new_profile) AS new_profiles
        FROM `moz-fx-data-shared-prod.device_manufacturer_partnerships_derived.fenix_distribution_deal_clients_v2`
        WHERE submission_date BETWEEN '2025-01-01' AND DATE_TRUNC(CURRENT_DATE, QUARTER) - INTERVAL 1 DAY
          AND distribution_id IN ('aura-001', 'vivo-001', 'dt-001', 'dt-002', 'dt-003', 'xiaomi-001')
          AND country_code IS NOT NULL
        GROUP BY 1, 2, 3
      ),

      -- W4 retention of profiles acquired in the quarter. Only cohorts that have reached their 28-day mark are present.
      mobile_distro_retention AS (
        SELECT
          DATE_TRUNC(metric_date, QUARTER) AS quarter,
          country AS country_code,
          distribution_id,
          SUM(retained_week_4_new_profiles) AS retained_week_4_new_profiles,
          SUM(new_profiles_metric_date) AS retention_new_profiles
        FROM `moz-fx-data-shared-prod.fenix.retention`
        WHERE metric_date BETWEEN '2025-01-01' AND DATE_TRUNC(CURRENT_DATE, QUARTER) - INTERVAL 1 DAY
          AND normalized_channel = 'release'
          AND distribution_id IN ('aura-001', 'vivo-001', 'dt-001', 'dt-002', 'dt-003', 'xiaomi-001')
          AND country IS NOT NULL
        GROUP BY 1, 2, 3
      ),

      mobile_distro AS (
        SELECT
          quarter,
          country_code,
          distribution_id,
          p.new_profiles,
          r.retained_week_4_new_profiles,
          r.retention_new_profiles,
          ROUND(p.new_profiles * SAFE_DIVIDE(r.retained_week_4_new_profiles, r.retention_new_profiles)) AS retained_users
        FROM mobile_distro_profiles p
        LEFT JOIN mobile_distro_retention r
          USING (quarter, country_code, distribution_id)
      ),

      spends AS (
        SELECT
          date,
          COALESCE(
            UPPER(mozfun.map.get_key(campaigns_v2.campaign_segments, "country_code")),
            UPPER(SPLIT(ads.campaign_name, '_')[SAFE_OFFSET(5)])
          ) AS country,
          SUM(spend) AS total_spend
        FROM `moz-fx-data-shared-prod.google_ads_derived.daily_ad_group_stats_v1` ads
        JOIN `moz-fx-data-shared-prod.google_ads_derived.campaigns_v2` campaigns_v2
          ON SAFE_CAST(ads.campaign_id AS INT) = campaigns_v2.campaign_id
        WHERE date BETWEEN '2025-01-01' AND DATE_TRUNC(CURRENT_DATE, QUARTER) - INTERVAL 1 DAY
          AND ads.account_name = 'Mozilla Firefox UAC'
          AND ads.campaign_name NOT LIKE '%iOS%'
        GROUP BY 1, 2
      ),

      profiles AS (
        SELECT
          first_seen_date,
          country,
          SUM(new_profiles) AS new_profiles
        FROM `moz-fx-data-shared-prod.fenix_derived.new_profiles_v1`
        WHERE first_seen_date BETWEEN '2025-01-01' AND DATE_TRUNC(CURRENT_DATE, QUARTER) - INTERVAL 1 DAY
          AND normalized_channel = 'release'
          AND is_mobile
          AND paid_vs_organic_gclid = 'Paid'
          AND install_source = 'com.android.vending'
        GROUP BY 1, 2
      ),

      retention AS (
        SELECT
          first_seen_date,
          country,
          SUM(retained_week_4_new_profiles) AS retained_week_4,
          SUM(new_profiles_metric_date) AS retention_new_profiles
        FROM `moz-fx-data-shared-prod.fenix.retention`
        WHERE first_seen_date BETWEEN '2025-01-01' AND DATE_TRUNC(CURRENT_DATE, QUARTER) - INTERVAL 1 DAY
          AND install_source = 'com.android.vending'
          AND is_mobile
          AND app_name = 'Fenix'
          AND paid_vs_organic_gclid = 'Paid'
        GROUP BY 1, 2
      ),

      -- Normalize country codes: UK->GB, JA->JP
      spends_norm AS (
        SELECT
          date,
          CASE country WHEN 'UK' THEN 'GB' WHEN 'JA' THEN 'JP' ELSE country END AS country,
          total_spend
        FROM spends
      ),

      daily AS (
        SELECT
          COALESCE(s.date, p.first_seen_date, r.first_seen_date) AS date,
          COALESCE(s.country, p.country, r.country) AS country,
          s.total_spend,
          p.new_profiles,
          r.retained_week_4,
          r.retention_new_profiles
        FROM spends_norm s
        FULL JOIN profiles p
          ON s.date = p.first_seen_date AND s.country = p.country
        FULL JOIN retention r
          ON COALESCE(s.date, p.first_seen_date) = r.first_seen_date
          AND COALESCE(s.country, p.country) = r.country
      ),

      uac AS (
        SELECT
          DATE_TRUNC(date, QUARTER) AS quarter,
          country,
          SUM(total_spend) AS total_spend,
          SUM(new_profiles) AS new_profiles,
          SUM(retained_week_4) AS retained_week_4,
          SUM(retention_new_profiles) AS retention_new_profiles,
          ROUND(SUM(new_profiles) * SAFE_DIVIDE(SUM(retained_week_4), SUM(retention_new_profiles))) AS retained_users
        FROM daily
        WHERE country IS NOT NULL
        GROUP BY 1, 2
      )

      SELECT
        mobile_distro.quarter,
        mobile_distro.country_code,
        mobile_distro.distribution_id,
        mobile_distro.new_profiles AS distro_new_profiles,
        mobile_distro.retained_week_4_new_profiles AS distro_retained_week_4,
        mobile_distro.retention_new_profiles AS distro_retention_new_profiles,
        mobile_distro.retained_users AS distro_retained_users,
        uac.total_spend AS uac_total_spend,
        uac.new_profiles AS uac_new_profiles,
        uac.retained_week_4 AS uac_retained_week_4,
        uac.retention_new_profiles AS uac_retention_new_profiles,
        uac.retained_users AS uac_retained_users
      FROM mobile_distro
      LEFT JOIN uac
        ON mobile_distro.quarter = uac.quarter
        AND mobile_distro.country_code = uac.country
      ;;
    persist_for: "24 hours"
  }

  # One row per quarter, country and distribution_id. UAC columns are country-level and
  # repeat on every distribution_id row for that country, so UAC measures use sum_distinct
  # keyed on quarter + country to avoid counting them more than once.

  dimension: key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(CAST(${TABLE}.quarter AS STRING), '|', ${TABLE}.country_code, '|', ${TABLE}.distribution_id) ;;
  }

  dimension: uac_key {
    hidden: yes
    sql: CONCAT(CAST(${TABLE}.quarter AS STRING), '|', ${TABLE}.country_code) ;;
  }

  dimension_group: quarter {
    type: time
    datatype: date
    convert_tz: no
    timeframes: [raw, quarter, year]
    sql: ${TABLE}.quarter ;;
  }

  dimension: country_code {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country_code ;;
  }

  dimension: distribution_id {
    description: "The partner distribution id, e.g. dt-001."
    type: string
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: distro_new_profiles_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.distro_new_profiles ;;
  }

  dimension: distro_retained_week_4_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.distro_retained_week_4 ;;
  }

  dimension: distro_retention_new_profiles_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.distro_retention_new_profiles ;;
  }

  dimension: distro_retained_users_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.distro_retained_users ;;
  }

  dimension: uac_total_spend_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.uac_total_spend ;;
  }

  dimension: uac_new_profiles_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.uac_new_profiles ;;
  }

  dimension: uac_retained_week_4_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.uac_retained_week_4 ;;
  }

  dimension: uac_retention_new_profiles_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.uac_retention_new_profiles ;;
  }

  dimension: uac_retained_users_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.uac_retained_users ;;
  }

  # Mobile Distro measures

  measure: distro_new_profiles {
    group_label: "Mobile Distro"
    label: "Mobile Distro: New Profiles"
    type: sum
    sql: ${distro_new_profiles_raw} ;;
    value_format_name: decimal_0
  }

  measure: distro_retained_week_4 {
    group_label: "Mobile Distro"
    label: "Mobile Distro: Week 4 Retained (Cohort)"
    description: "Numerator of new profile retention: new profiles still active in week 4."
    type: sum
    sql: ${distro_retained_week_4_raw} ;;
    value_format_name: decimal_0
  }

  measure: distro_retention_new_profiles {
    group_label: "Mobile Distro"
    label: "Mobile Distro: Retention Cohort Size"
    description: "Denominator of new profile retention: new profiles whose cohort has reached its 28-day mark."
    type: sum
    sql: ${distro_retention_new_profiles_raw} ;;
    value_format_name: decimal_0
  }

  measure: distro_new_profile_retention {
    group_label: "Mobile Distro"
    label: "Mobile Distro: New Profile Retention"
    description: "Week 4 retained / retention cohort size."
    type: number
    sql: SAFE_DIVIDE(${distro_retained_week_4}, ${distro_retention_new_profiles}) ;;
    value_format_name: percent_1
  }

  measure: distro_retained_users {
    group_label: "Mobile Distro"
    label: "Mobile Distro: Retained Users"
    description: "New profiles x new profile retention, computed per quarter, country and distribution_id, then summed."
    type: sum
    sql: ${distro_retained_users_raw} ;;
    value_format_name: decimal_0
  }

  # UAC measures (country-level, deduplicated across distribution_id)

  measure: uac_total_spend {
    group_label: "UAC"
    label: "UAC: Total Spend"
    type: sum_distinct
    sql_distinct_key: ${uac_key} ;;
    sql: ${uac_total_spend_raw} ;;
    value_format_name: usd_0
  }

  measure: uac_new_profiles {
    group_label: "UAC"
    label: "UAC: New Profiles"
    type: sum_distinct
    sql_distinct_key: ${uac_key} ;;
    sql: ${uac_new_profiles_raw} ;;
    value_format_name: decimal_0
  }

  measure: uac_retained_week_4 {
    group_label: "UAC"
    label: "UAC: Week 4 Retained (Cohort)"
    description: "Numerator of new profile retention: new profiles still active in week 4."
    type: sum_distinct
    sql_distinct_key: ${uac_key} ;;
    sql: ${uac_retained_week_4_raw} ;;
    value_format_name: decimal_0
  }

  measure: uac_retention_new_profiles {
    group_label: "UAC"
    label: "UAC: Retention Cohort Size"
    description: "Denominator of new profile retention: new profiles whose cohort has reached its 28-day mark."
    type: sum_distinct
    sql_distinct_key: ${uac_key} ;;
    sql: ${uac_retention_new_profiles_raw} ;;
    value_format_name: decimal_0
  }

  measure: uac_new_profile_retention {
    group_label: "UAC"
    label: "UAC: New Profile Retention"
    description: "Week 4 retained / retention cohort size."
    type: number
    sql: SAFE_DIVIDE(${uac_retained_week_4}, ${uac_retention_new_profiles}) ;;
    value_format_name: percent_1
  }

  measure: uac_retained_users {
    group_label: "UAC"
    label: "UAC: Retained Users"
    description: "New profiles x new profile retention, computed per quarter and country, then summed."
    type: sum_distinct
    sql_distinct_key: ${uac_key} ;;
    sql: ${uac_retained_users_raw} ;;
    value_format_name: decimal_0
  }

  measure: uac_cost_per_new_profile {
    group_label: "UAC"
    label: "UAC: Cost Per New Profile"
    type: number
    sql: SAFE_DIVIDE(${uac_total_spend}, ${uac_new_profiles}) ;;
    value_format_name: usd
  }

  measure: uac_cost_per_retained_user {
    group_label: "UAC"
    label: "UAC: Cost Per Retained User"
    type: number
    sql: SAFE_DIVIDE(${uac_total_spend}, ${uac_retained_users}) ;;
    value_format_name: usd
  }

  measure: retention_difference {
    label: "Retention Difference (Distro - UAC)"
    description: "Mobile Distro new profile retention minus UAC new profile retention, in percentage points."
    type: number
    sql: ${distro_new_profile_retention} - ${uac_new_profile_retention} ;;
    value_format: "+0.0%;-0.0%;0.0%"
  }
}
