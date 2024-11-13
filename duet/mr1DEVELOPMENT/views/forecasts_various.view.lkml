view: forecast_desktopDAU {
  derived_table: {
    sql: SELECT
      a.*,
      b.yhat_upper as upper_bound,
      b.yhat_lower as lower_bound,
      CASE when a.dau > b.yhat_upper THEN 'above trend'
           when a.dau < b.yhat_lower THEN 'below trend'
           when a.dau BETWEEN b.yhat_lower AND b.yhat_upper THEN 'within trend'
           else 'error'
          END
            as status,
      (a.dau - b.yhat_lower) / b.yhat_lower * 100 as lower_diff_pct,
      (a.dau - b.yhat_upper) / b.yhat_upper * 100 as upper_diff_pct

    FROM

    (SELECT
          submission_date,
          sum(dau) as dau
      FROM
          `mozdata.telemetry.firefox_desktop_usage_2021`
      GROUP BY 1) a

    LEFT JOIN

    (SELECT
          date(ds) as date,
          yhat_lower,
          yhat_upper
        FROM
          `mozdata.analysis.loines_mr1_desktop_dau_forecast`) b

    ON (a.submission_date = b.date)
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: status {
    type:string
    sql: ${TABLE}.status;;
  }

######################################################

  measure: dau {
    type:sum
    sql: ${TABLE}.dau;;
  }

  measure: lower_bound {
    type:sum
    sql: ${TABLE}.lower_bound;;
  }

  measure: upper_bound {
    type:sum
    sql: ${TABLE}.upper_bound;;
  }


  measure: lower_diff_pct {
    type:sum
    sql: ${TABLE}.lower_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

  measure: upper_diff_pct {
    type:sum
    sql: ${TABLE}.upper_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

}

######################################################
######################################################
######################################################


view: forecast_desktopNP {
  derived_table: {
    sql: SELECT
      a.*,
      b.yhat_upper as upper_bound,
      b.yhat_lower as lower_bound,
      CASE when a.new_profiles > b.yhat_upper THEN 'above trend'
           when a.new_profiles < b.yhat_lower THEN 'below trend'
           when a.new_profiles BETWEEN b.yhat_lower AND b.yhat_upper THEN 'within trend'
           else 'error'
          END
            as status,
      (a.new_profiles - b.yhat_lower) / b.yhat_lower * 100 as lower_diff_pct,
      (a.new_profiles - b.yhat_upper) / b.yhat_upper * 100 as upper_diff_pct

    FROM

    (SELECT
          submission_date,
          sum(new_profiles) as new_profiles
      FROM
          `mozdata.telemetry.firefox_desktop_usage_2021`
      GROUP BY 1) a

    LEFT JOIN

    (SELECT
          date(ds) as date,
          yhat_lower,
          yhat_upper
        FROM
          `mozdata.analysis.loines_mr1_desktop_new_profiles_forecast`) b
    ON (a.submission_date = b.date)
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: status {
    type:string
    sql: ${TABLE}.status;;
  }

######################################################

  measure: new_profiles {
    type:sum
    sql: ${TABLE}.new_profiles;;
  }

  measure: lower_bound {
    type:sum
    sql: ${TABLE}.lower_bound;;
  }

  measure: upper_bound {
    type:sum
    sql: ${TABLE}.upper_bound;;
  }


  measure: lower_diff_pct {
    type:sum
    sql: ${TABLE}.lower_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

  measure: upper_diff_pct {
    type:sum
    sql: ${TABLE}.upper_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

}





######################################################
######################################################
######################################################


view: forecast_dls {
  derived_table: {
    sql: SELECT
      a.*,
      b.yhat_upper as upper_bound,
      b.yhat_lower as lower_bound,
      CASE when a.non_fx_downloads > b.yhat_upper THEN 'above trend'
           when a.non_fx_downloads < b.yhat_lower THEN 'below trend'
           when a.non_fx_downloads BETWEEN b.yhat_lower AND b.yhat_upper THEN 'within trend'
           else 'error'
          END
            as status,
      (a.non_fx_downloads - b.yhat_lower) / b.yhat_lower * 100 as lower_diff_pct,
      (a.non_fx_downloads - b.yhat_upper) / b.yhat_upper * 100 as upper_diff_pct

    FROM

    (SELECT date as submission_date,
             sum(non_fx_downloads) AS non_fx_downloads
FROM `moz-fx-data-shared-prod.mozilla_org.www_site_landing_page_metrics`
WHERE device_category = 'desktop'
  AND date >= '2021-05-18'
GROUP BY 1) a

    LEFT JOIN

    (SELECT
          date(ds) as date,
          yhat_lower,
          yhat_upper
        FROM
          `mozdata.analysis.loines_mr1_desktop_downloads_forecast`) b
    ON (a.submission_date = b.date)
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: status {
    type:string
    sql: ${TABLE}.status;;
  }

######################################################

  measure: non_fx_downloads {
    type:sum
    sql: ${TABLE}.non_fx_downloads;;
  }

  measure: lower_bound {
    type:sum
    sql: ${TABLE}.lower_bound;;
  }

  measure: upper_bound {
    type:sum
    sql: ${TABLE}.upper_bound;;
  }


  measure: lower_diff_pct {
    type:sum
    sql: ${TABLE}.lower_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

  measure: upper_diff_pct {
    type:sum
    sql: ${TABLE}.upper_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

}


######################################################
######################################################
######################################################


view: forecast_mobile_dau {
  derived_table: {
    sql: SELECT a.*,
       b.yhat_upper AS upper_bound,
       b.yhat_lower AS lower_bound,
       CASE
           WHEN a.dau > b.yhat_upper THEN 'above trend'
           WHEN a.dau < b.yhat_lower THEN 'below trend'
           WHEN a.dau BETWEEN b.yhat_lower AND b.yhat_upper THEN 'within trend'
           ELSE 'error'
       END AS status,
       (a.dau - b.yhat_lower) / b.yhat_lower * 100 AS lower_diff_pct,
       (a.dau - b.yhat_upper) / b.yhat_upper * 100 AS upper_diff_pct
FROM
  (SELECT submission_date,
          CASE
              WHEN canonical_app_name IN ('Firefox for Android (Fenix)',
                                          'Firefox for Android (Fennec)') THEN 'Firefox for Android (Fennec + Fenix)'
              ELSE canonical_app_name
          END AS canonical_app_name,
          sum(dau) AS dau
   FROM `mozdata.telemetry.mobile_usage_2021`
   WHERE submission_date >= '2021-05-18'
   GROUP BY 1,
            2) a
LEFT JOIN
  (SELECT date(ds) AS date,
          canonical_app_name,
          yhat_lower,
          yhat_upper
   FROM `mozdata.analysis.loines_mr1_mobile_dau_forecast`) b ON (a.submission_date = b.date
                                                                 AND a.canonical_app_name = b.canonical_app_name)
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: canonical_app_name {
    type:string
    sql: ${TABLE}.canonical_app_name;;
  }

  dimension: status {
    type:string
    sql: ${TABLE}.status;;
  }

######################################################

  measure: dau {
    type:sum
    sql: ${TABLE}.dau;;
  }

  measure: lower_bound {
    type:sum
    sql: ${TABLE}.lower_bound;;
  }

  measure: upper_bound {
    type:sum
    sql: ${TABLE}.upper_bound;;
  }


  measure: lower_diff_pct {
    type:sum
    sql: ${TABLE}.lower_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

  measure: upper_diff_pct {
    type:sum
    sql: ${TABLE}.upper_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

}



view: forecast_android_installs {
  derived_table: {
    sql: SELECT
      a.*,
      b.yhat_upper as upper_bound,
      b.yhat_lower as lower_bound,
      CASE when a.device_installs > b.yhat_upper THEN 'above trend'
           when a.device_installs < b.yhat_lower THEN 'below trend'
           when a.device_installs BETWEEN b.yhat_lower AND b.yhat_upper THEN 'within trend'
           else 'error'
          END
            as status,
      (a.device_installs - b.yhat_lower) / b.yhat_lower * 100 as lower_diff_pct,
      (a.device_installs - b.yhat_upper) / b.yhat_upper * 100 as upper_diff_pct

    FROM

    (SELECT Date AS submission_date,
          sum(Daily_Device_Installs) AS device_installs
   FROM `moz-fx-data-marketing-prod.google_play_store.Installs_country_v1`
   WHERE Package_Name IN ('org.mozilla.firefox')
   GROUP BY 1) a

    LEFT JOIN

    (SELECT
          date(ds) as date,
          yhat_lower,
          yhat_upper
        FROM
          `mozdata.analysis.loines_mr1_android_installs_forecast`) b

    ON (a.submission_date = b.date)
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: status {
    type:string
    sql: ${TABLE}.status;;
  }

######################################################

  measure: device_installs {
    type:sum
    sql: ${TABLE}.device_installs;;
  }

  measure: lower_bound {
    type:sum
    sql: ${TABLE}.lower_bound;;
  }

  measure: upper_bound {
    type:sum
    sql: ${TABLE}.upper_bound;;
  }


  measure: lower_diff_pct {
    type:sum
    sql: ${TABLE}.lower_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

  measure: upper_diff_pct {
    type:sum
    sql: ${TABLE}.upper_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

}

######################################################
######################################################
######################################################




view: forecast_ios_installs {
  derived_table: {
    sql: SELECT a.*,
       b.yhat_upper AS upper_bound,
       b.yhat_lower AS lower_bound,
       CASE
           WHEN a.installations_opt_in > b.yhat_upper THEN 'above trend'
           WHEN a.installations_opt_in < b.yhat_lower THEN 'below trend'
           WHEN a.installations_opt_in BETWEEN b.yhat_lower AND b.yhat_upper THEN 'within trend'
           ELSE 'error'
       END AS status,
       (a.installations_opt_in - b.yhat_lower) / b.yhat_lower * 100 AS lower_diff_pct,
       (a.installations_opt_in - b.yhat_upper) / b.yhat_upper * 100 AS upper_diff_pct
FROM
  (SELECT date AS submission_date,
          sum(installations_opt_in) AS installations_opt_in
   FROM `moz-fx-data-marketing-prod.apple_app_store.metrics_by_storefront`
   WHERE app_name = 'Firefox'
   GROUP BY 1) a
LEFT JOIN
  (SELECT date(ds) AS date,
          yhat_lower,
          yhat_upper
   FROM `mozdata.analysis.loines_mr1_ios_installs_forecast`) b ON (a.submission_date = b.date)
         ;;
  }

######################################################

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: status {
    type:string
    sql: ${TABLE}.status;;
  }

######################################################

  measure: installations_opt_in {
    type:sum
    sql: ${TABLE}.installations_opt_in;;
  }

  measure: lower_bound {
    type:sum
    sql: ${TABLE}.lower_bound;;
  }

  measure: upper_bound {
    type:sum
    sql: ${TABLE}.upper_bound;;
  }


  measure: lower_diff_pct {
    type:sum
    sql: ${TABLE}.lower_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

  measure: upper_diff_pct {
    type:sum
    sql: ${TABLE}.upper_diff_pct;;
    value_format: "#.00"
    precision: 2
  }

}

######################################################
######################################################
######################################################
