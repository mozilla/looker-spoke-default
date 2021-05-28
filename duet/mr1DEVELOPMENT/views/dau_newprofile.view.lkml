view: dau_desktop {
  derived_table: {
    sql:
    WITH BASE AS
  (SELECT submission_date,
          os AS Desktop_OS,
          CASE
              WHEN country IN ('AR',
                               'PH',
                               'TR',
                               'CO',
                               'US',
                               'DE',
                               'FR',
                               'CN',
                               'PL',
                               'IN',
                               'RU',
                               'BR',
                               'IT',
                               'ID',
                               'GB',
                               'ES',
                               'JP',
                               'CA',
                               'VN',
                               'MX') THEN country
              ELSE 'ROW'
          END AS country,
          sum(dau) AS dau,
          sum(new_profiles) AS new_profiles
   FROM `mozdata.telemetry.firefox_desktop_usage_2021`
   WHERE submission_date >= '2019-12-20'
   GROUP BY 1,
            2,
            3
   ORDER BY 1,
            2,
            3),
     BASE_APPENDED AS
  (SELECT *,
          EXTRACT(DAYOFYEAR
                  FROM date(submission_date)) AS doy,
          EXTRACT(YEAR
                  FROM date(submission_date)) AS YEAR,
          AVG(dau) OVER (PARTITION BY Desktop_OS,
                                      country
                         ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS dau_smoothed,
                        AVG(new_profiles) OVER (PARTITION BY Desktop_OS,
                                                             country
                                                ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS new_profiles_smoothed
   FROM BASE)
SELECT a.submission_date,
       a.Desktop_OS,
       a.country,
       a.dau AS dau_2021,
       a.new_profiles AS new_profiles_2021,
       a.dau_smoothed AS dau_smoothed_2021,
       a.new_profiles_smoothed AS new_profiles_smoothed_2021,
       b.dau AS dau_2020,
       b.new_profiles AS new_profiles_2020,
       b.dau_smoothed AS dau_smoothed_2020,
       b.new_profiles_smoothed AS new_profiles_smoothed_2020
FROM
  (SELECT *
   FROM BASE_APPENDED
   WHERE YEAR = 2021) a
LEFT JOIN
  (SELECT *
   FROM BASE_APPENDED
   WHERE YEAR = 2020) b ON (a.doy = b.doy
                            AND a.Desktop_OS = b.Desktop_OS
                            AND a.country = b.country)
       ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: desktop_OS {
    type: string
    sql: ${TABLE}.desktop_OS ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

######################################################

  measure: DAU_2021 {
    type:sum
    sql: ${TABLE}.DAU_2021;;
  }

  measure: new_profiles_2021 {
    type: sum
    sql: ${TABLE}.new_profiles_2021;;
  }

  measure: DAU_smoothed_2021 {
    type:sum
    sql: ${TABLE}.DAU_smoothed_2021;;
  }

  measure: new_profiles_smoothed_2021 {
    type: sum
    sql: ${TABLE}.new_profiles_smoothed_2021;;
  }

  measure: DAU_2020 {
    type:sum
    sql: ${TABLE}.DAU_2020;;
  }

  measure: new_profiles_2020 {
    type: sum
    sql: ${TABLE}.new_profiles_2020;;
  }

  measure: DAU_smoothed_2020 {
    type:sum
    sql: ${TABLE}.DAU_smoothed_2020;;
  }

  measure: new_profiles_smoothed_2020 {
    type: sum
    sql: ${TABLE}.new_profiles_smoothed_2020;;
  }


######################################################

}


######################################################
######################################################
######################################################


view: dau_mobile {
  derived_table: {
    sql:
    WITH BASE AS
  (SELECT submission_date,
          canonical_app_name,
          CASE
              WHEN country IN ('AR',
                               'PH',
                               'TR',
                               'CO',
                               'US',
                               'DE',
                               'FR',
                               'CN',
                               'PL',
                               'IN',
                               'RU',
                               'BR',
                               'IT',
                               'ID',
                               'GB',
                               'ES',
                               'JP',
                               'CA',
                               'VN',
                               'MX') THEN country
              ELSE 'ROW'
          END AS country,
          sum(dau) AS dau
   FROM `mozdata.telemetry.mobile_usage_2021`
   WHERE submission_date >= '2019-12-20'
   GROUP BY 1,
            2, 3
   ORDER BY 1,
            2, 3),
     BASE_APPENDED AS
  (SELECT *,
          EXTRACT(DAYOFYEAR
                  FROM date(submission_date)) AS doy,
          EXTRACT(YEAR
                  FROM date(submission_date)) AS YEAR
   FROM BASE)
SELECT a.submission_date,
       a.canonical_app_name,
       a.country,
       a.dau AS dau_2021,
       b.dau AS dau_2020
FROM
  (SELECT *
   FROM BASE_APPENDED
   WHERE YEAR = 2021) a
LEFT JOIN
  (SELECT *
   FROM BASE_APPENDED
   WHERE YEAR = 2020) b ON (a.doy = b.doy
                            AND a.country = b.country AND a.canonical_app_name = b.canonical_app_name)
       ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: canonical_app_name {
    type: string
    sql: ${TABLE}.canonical_app_name ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

######################################################

  measure: DAU_2021 {
    type:sum
    sql: ${TABLE}.DAU_2021;;
  }

  measure: DAU_2020 {
    type:sum
    sql: ${TABLE}.DAU_2020;;
  }

}


######################################################
######################################################
######################################################

view: install_android {
  derived_table: {
    sql:
    WITH BASE AS
  (SELECT Date AS submission_date,
          EXTRACT(DAYOFYEAR
                  FROM date(Date)) AS doy,
          EXTRACT(YEAR
                  FROM date(Date)) AS YEAR,
          CASE
              WHEN Country IN ('AR',
                               'PH',
                               'TR',
                               'CO',
                               'US',
                               'DE',
                               'FR',
                               'CN',
                               'PL',
                               'IN',
                               'RU',
                               'BR',
                               'IT',
                               'ID',
                               'GB',
                               'ES',
                               'JP',
                               'CA',
                               'VN',
                               'MX') THEN Country
              ELSE 'ROW'
          END AS country,
          sum(Daily_Device_Installs) AS device_installs
   FROM `moz-fx-data-marketing-prod.google_play_store.Installs_country_v1`
   WHERE Package_Name IN ('org.mozilla.firefox')
     AND Date >= '2019-12-20'
   GROUP BY 1,
            2,
            3,
            4)
SELECT a.submission_date,
       a.country,
       a.device_installs AS device_installs_2021,
       b.device_installs AS device_installs_2020
FROM
  (SELECT *
   FROM BASE
   WHERE YEAR = 2021) a
LEFT JOIN
  (SELECT *
   FROM BASE
   WHERE YEAR = 2020) b ON (a.doy = b.doy
                            AND a.country = b.country)
       ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

######################################################

  measure: device_installs_2021 {
    type:sum
    sql: ${TABLE}.device_installs_2021;;
  }

  measure: device_installs_2020 {
    type: sum
    sql: ${TABLE}.device_installs_2020;;
  }


######################################################

}




######################################################
######################################################
######################################################




view: install_ios {
  derived_table: {
    sql:
    WITH BASE AS
      (SELECT date AS submission_date,
              EXTRACT(DAYOFYEAR
                      FROM date(date)) AS doy,
              EXTRACT(YEAR
                      FROM date(date)) AS YEAR,
              CASE
                  WHEN storefront = 'United States' THEN 'US'
                  WHEN storefront = 'India' THEN 'IN'
                  WHEN storefront = 'Germany' THEN 'DE'
                  WHEN storefront = 'Brazil' THEN 'BR'
                  WHEN storefront = 'France' THEN 'FR'
                  WHEN storefront = 'Mexico' THEN 'MX'
                  WHEN storefront = 'Italy' THEN 'IT'
                  WHEN storefront = 'Spain' THEN 'ES'
                  WHEN storefront = 'United Kingdom' THEN 'UK'
                  WHEN storefront = 'Poland' THEN 'PL'
                  WHEN storefront = 'Indonesia' THEN 'ID'
                  WHEN storefront = 'Canada' THEN 'CA'
                  WHEN storefront = 'Japan' THEN 'JP'
                  WHEN storefront = 'Russia' THEN 'RU'
                  WHEN storefront = 'Colombia' THEN 'CO'
                  WHEN storefront = 'Turkey' THEN 'TR'
                  WHEN storefront = 'Philippines' THEN 'PH'
                  WHEN storefront = 'Argentina' THEN 'AR'
                  WHEN storefront = 'Vietnam' THEN 'VN'
                  WHEN storefront = 'China mainland' THEN 'CN'
                  ELSE 'ROW'
              END AS country,
              sum(installations_opt_in) AS installations_opt_in
       FROM `moz-fx-data-marketing-prod.apple_app_store.metrics_by_storefront`
       WHERE app_name = 'Firefox'
       GROUP BY 1,
                2,
                3,
                4)
    SELECT a.submission_date,
           a.country,
           a.installations_opt_in AS installations_opt_in_2021,
           b.installations_opt_in AS installations_opt_in_2020
    FROM
      (SELECT *
       FROM BASE
       WHERE YEAR = 2021) a
    LEFT JOIN
      (SELECT *
       FROM BASE
       WHERE YEAR = 2020) b ON (a.doy = b.doy
                                AND a.country = b.country)
           ;;
  }


######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

######################################################

  measure: installations_opt_in_2021 {
    type:sum
    sql: ${TABLE}.installations_opt_in_2021;;
  }

  measure: installations_opt_in_2020 {
    type: sum
    sql: ${TABLE}.installations_opt_in_2020;;
  }


######################################################

}
