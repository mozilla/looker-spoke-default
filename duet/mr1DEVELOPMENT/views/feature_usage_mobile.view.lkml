view: tabtray_android {
  derived_table: {
    sql: WITH EVENTS AS
        (SELECT date(submission_timestamp) AS dt,
                metadata.geo.country,
                client_info.app_display_version,
                client_info.client_id,
                event.category AS event_category,
                event.name AS event_name,
                event.extra AS event_extra,
         FROM `moz-fx-data-shared-prod.org_mozilla_firefox.events` AS e
         CROSS JOIN UNNEST(e.events) AS event
         WHERE date(submission_timestamp) >= '2021-05-18'
           AND sample_id = 1 ), EVENT_BY_CLIENT AS
        (SELECT dt,
                client_id,
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
                sum(CASE
                        WHEN event_category = 'tabs_tray'
                             AND event_name = 'opened' THEN 1
                        ELSE 0
                    END) AS tabtray_opened,
                sum(CASE
                        WHEN event_category = 'tabs_tray'
                             AND event_name = 'new_private_tab_tapped' THEN 1
                        ELSE 0
                    END) AS tabtray_opened_privatetab,
                sum(CASE
                        WHEN event_category = 'tabs_tray'
                             AND event_name = 'new_tab_tapped' THEN 1
                        ELSE 0
                    END) AS tabtray_opened_newtab
         FROM EVENTS
         GROUP BY 1,
                  2,
                  3),
                                EVENT_BY_CLIENT_CAPPED AS
        (SELECT dt,
                client_id,
                country,
                CASE
                    WHEN tabtray_opened < 1000 THEN tabtray_opened
                    ELSE 1000
                END AS tabtray_opened,
                CASE
                    WHEN tabtray_opened_privatetab < 1000 THEN tabtray_opened_privatetab
                    ELSE 1000
                END AS tabtray_opened_privatetab,
                CASE
                    WHEN tabtray_opened_newtab < 1000 THEN tabtray_opened_newtab
                    ELSE 1000
                END AS tabtray_opened_newtab
         FROM EVENT_BY_CLIENT),
                                event_rollups AS
        (SELECT dt,
                country,
                count(*) AS event_cc,
                sum(CASE
                        WHEN tabtray_opened > 0 THEN 1
                        ELSE 0
                    END) AS tabtray_opened_cc,
                sum(CASE
                        WHEN tabtray_opened_privatetab > 0 THEN 1
                        ELSE 0
                    END) AS tabtray_opened_privatetab_cc,
                sum(CASE
                        WHEN tabtray_opened_newtab > 0 THEN 1
                        ELSE 0
                    END) AS tabtray_opened_newtab_cc,
                sum(tabtray_opened) AS tabtray_opened_total,
                sum(tabtray_opened_privatetab) AS tabtray_opened_privatetab_total,
                sum(tabtray_opened_newtab) AS tabtray_opened_newtab_total
         FROM EVENT_BY_CLIENT_CAPPED
         GROUP BY 1,
                  2),
                                baseline_rollups AS
        (SELECT submission_date,
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
                count(*) AS dau
         FROM `moz-fx-data-shared-prod.org_mozilla_firefox.baseline_clients_daily`
         WHERE submission_date >= '2021-05-18'
           AND sample_id = 1
         GROUP BY 1,
                  2)
      SELECT a.*,
             coalesce(b.event_cc, 0) AS event_cc,
             coalesce(b.tabtray_opened_cc, 0) AS tabtray_opened_cc,
             coalesce(b.tabtray_opened_privatetab_cc, 0) AS tabtray_opened_privatetab_cc,
             coalesce(b.tabtray_opened_newtab_cc, 0) AS tabtray_opened_newtab_cc,
             coalesce(b.tabtray_opened_total, 0) AS tabtray_opened_total,
             coalesce(b.tabtray_opened_privatetab_total, 0) AS tabtray_opened_privatetab_total,
             coalesce(b.tabtray_opened_newtab_total, 0) AS tabtray_opened_newtab_total
      FROM baseline_rollups a
      LEFT JOIN event_rollups b ON (a.submission_date = b.dt
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

  measure: dau {
    type:sum
    sql: ${TABLE}.dau;;
  }

  measure: event_cc {
    type:sum
    sql: ${TABLE}.event_cc;;
  }

  measure: tabtray_opened_cc {
    type:sum
    sql: ${TABLE}.tabtray_opened_cc;;
  }

  measure: tabtray_opened_privatetab_cc {
    type:sum
    sql: ${TABLE}.tabtray_opened_privatetab_cc;;
  }

  measure: tabtray_opened_newtab_cc {
    type:sum
    sql: ${TABLE}.tabtray_opened_newtab_cc;;
  }

}

#################################################################################
#################################################################################
#################################################################################


view: tabtray_ios {
  derived_table: {
    sql: WITH EVENTS AS
        (SELECT date(submission_timestamp) AS dt,
                metadata.geo.country,
                client_info.app_display_version,
                client_info.client_id,
                event.category AS event_category,
                event.name AS event_name,
                event.extra AS event_extra,
         FROM `moz-fx-data-shared-prod.org_mozilla_ios_firefox.events` AS e
         CROSS JOIN UNNEST(e.events) AS event
         WHERE date(submission_timestamp) >= '2021-05-18'
           AND sample_id = 1 ), EVENT_BY_CLIENT AS
        (SELECT dt,
                client_id,
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
                sum(CASE
                        WHEN event_category = 'tabs'
                             AND event_name = 'open_tab_tray' THEN 1
                        ELSE 0
                    END) AS tabtray_opened
         FROM EVENTS
         GROUP BY 1,
                  2,
                  3),
                                EVENT_BY_CLIENT_CAPPED AS
        (SELECT dt,
                client_id,
                country,
                CASE
                    WHEN tabtray_opened < 1000 THEN tabtray_opened
                    ELSE 1000
                END AS tabtray_opened
         FROM EVENT_BY_CLIENT),
                                event_rollups AS
        (SELECT dt,
                country,
                count(*) AS event_cc,
                sum(CASE
                        WHEN tabtray_opened > 0 THEN 1
                        ELSE 0
                    END) AS tabtray_opened_cc,
                sum(tabtray_opened) AS tabtray_opened_total
         FROM EVENT_BY_CLIENT_CAPPED
         GROUP BY 1,
                  2),
                                baseline_rollups AS
        (SELECT submission_date,
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
                count(*) AS dau
         FROM `moz-fx-data-shared-prod.org_mozilla_ios_firefox.baseline_clients_daily`
         WHERE submission_date >= '2021-05-18'
           AND sample_id = 1
         GROUP BY 1,
                  2
         ORDER BY 1,
                  2)
      SELECT a.*,
             coalesce(b.event_cc, 0) AS event_cc,
             coalesce(b.tabtray_opened_cc, 0) AS tabtray_opened_cc,
             coalesce(b.tabtray_opened_total, 0) AS tabtray_opened_total
      FROM baseline_rollups a
      LEFT JOIN event_rollups b ON (a.submission_date = b.dt
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

  measure: dau {
    type:sum
    sql: ${TABLE}.dau;;
  }

  measure: event_cc {
    type:sum
    sql: ${TABLE}.event_cc;;
  }

  measure: tabtray_opened_cc {
    type:sum
    sql: ${TABLE}.tabtray_opened_cc;;
  }

}

#################################################################################
#################################################################################
#################################################################################


view: tabs_overall_ios {
  derived_table: {
    sql: WITH exploded_tabs AS
        (SELECT date(m.submission_timestamp) AS dt,
                m.client_info.client_id,
                m.metadata.geo.country,
                t.key AS tabtype,
                t.value AS tabcount
         FROM `moz-fx-data-shared-prod.org_mozilla_ios_firefox.metrics` AS m
         CROSS JOIN UNNEST(m.metrics.labeled_counter.tabs_open) AS t
         WHERE date(submission_timestamp) >= '2021-05-18'
           AND sample_id = 1 ),
           client_tabs AS
        (SELECT dt,
                client_id,
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
                sum(tabcount) AS tabcount,
                sum(CASE
                        WHEN tabtype = 'normal-tab' THEN tabcount
                        ELSE 0
                    END) AS normal_tabcount,
                sum(CASE
                        WHEN tabtype = 'private-tab' THEN tabcount
                        ELSE 0
                    END) AS private_tabcount
         FROM exploded_tabs
         GROUP BY 1,
                  2,
                  3),
           client_tabs_capped AS
        (SELECT dt,
                client_id,
                country,
                CASE
                    WHEN tabcount < 2000 THEN tabcount
                    ELSE 1000
                END AS tabcount,
                CASE
                    WHEN normal_tabcount < 2000 THEN normal_tabcount
                    ELSE 1000
                END AS normal_tabcount,
                CASE
                    WHEN private_tabcount < 2000 THEN private_tabcount
                    ELSE 1000
                END AS private_tabcount
         FROM client_tabs),
           event_rollups AS
        (SELECT dt,
                country,
                count(*) AS event_cc,
                sum(CASE
                        WHEN tabcount > 0 THEN 1
                        ELSE 0
                    END) AS tabcount_cc,
                sum(CASE
                        WHEN normal_tabcount > 0 THEN 1
                        ELSE 0
                    END) AS normal_tabcount_cc,
                sum(CASE
                        WHEN private_tabcount > 0 THEN 1
                        ELSE 0
                    END) AS private_tabcount_cc,
                sum(tabcount) AS tabcount_total,
                sum(normal_tabcount) AS normal_tabcount_total,
                sum(private_tabcount) AS private_tabcount_total
         FROM client_tabs_capped
         GROUP BY 1,
                  2),
           baseline_rollups AS
        (SELECT submission_date,
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
                count(*) AS dau
         FROM `moz-fx-data-shared-prod.org_mozilla_ios_firefox.baseline_clients_daily`
         WHERE submission_date >= '2021-05-18'
           AND sample_id = 1
         GROUP BY 1,
                  2)
      SELECT a.*,
             coalesce(b.tabcount_cc, 0) AS tabcount_cc,
             coalesce(b.normal_tabcount_cc, 0) AS normal_tabcount_cc,
             coalesce(b.private_tabcount_cc, 0) AS private_tabcount_cc,
             coalesce(b.tabcount_total, 0) AS tabcount_total,
             coalesce(b.normal_tabcount_total, 0) AS normal_tabcount_total,
             coalesce(b.private_tabcount_total, 0) AS private_tabcount_total
      FROM baseline_rollups a
      LEFT JOIN event_rollups b ON (a.submission_date = b.dt
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

  measure: dau {
    type:sum
    sql: ${TABLE}.dau;;
  }

  measure: private_tabcount_cc {
    type:sum
    sql: ${TABLE}.private_tabcount_cc;;
  }

  measure: tabcount_total {
    type:sum
    sql: ${TABLE}.tabcount_total;;
  }

  measure: normal_tabcount_total {
    type:sum
    sql: ${TABLE}.normal_tabcount_total;;
  }

  measure: private_tabcount_total {
    type:sum
    sql: ${TABLE}.private_tabcount_total;;
  }

}

#################################################################################
#################################################################################
#################################################################################



view: synced_tabs_ios {
  derived_table: {
    sql: WITH sync_tab_opens AS
        (SELECT date(submission_timestamp) AS dt,
                CASE
                    WHEN metadata.geo.country IN ('AR',
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
                                                  'MX') THEN metadata.geo.country
                    ELSE 'ROW'
                END AS country,
                count(DISTINCT client_info.client_id) AS sync_tab_opened_cc
         FROM `moz-fx-data-shared-prod.org_mozilla_ios_firefox.metrics`
         WHERE date(submission_timestamp) >= '2021-05-18'
           AND sample_id = 1
           AND metrics.counter.sync_open_tab > 0
         GROUP BY 1,
                  2),
           baseline AS
        (SELECT submission_date,
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
                count(*) AS dau
         FROM `moz-fx-data-shared-prod.org_mozilla_ios_firefox.baseline_clients_daily`
         WHERE submission_date >= '2021-05-18'
           AND sample_id = 1
         GROUP BY 1,
                  2)
      SELECT a.*,
             coalesce(b.sync_tab_opened_cc, 0) AS sync_tab_opened_cc
      FROM baseline a
      LEFT JOIN sync_tab_opens b ON (a.submission_date = b.dt
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

  measure: dau {
    type:sum
    sql: ${TABLE}.dau;;
  }

  measure: sync_tab_opened_cc {
    type:sum
    sql: ${TABLE}.sync_tab_opened_cc;;
  }

}

#################################################################################
#################################################################################
#################################################################################



view: search_mobile {
  derived_table: {
    sql: WITH searches_all AS
        (SELECT submission_date,
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
                CASE
                    WHEN normalized_app_name = 'Fenix'
                         AND os = 'Android' THEN 'Firefox for Android (Fenix)'
                    WHEN normalized_app_name = 'Fennec'
                         AND os = 'iOS' THEN 'Firefox for iOS'
                    ELSE 'Other'
                END AS canonical_name,
                sum(SAP) AS SAP_total,
                sum(CASE
                        WHEN SAP > 0 THEN client_count
                        ELSE 0
                    END) AS SAP_clients
         FROM `moz-fx-data-shared-prod.search.mobile_search_aggregates`
         WHERE submission_date >= '2021-05-18'
           AND channel = 'release'
           AND ((normalized_app_name = 'Fenix'
                 AND os = 'Android')
                OR (normalized_app_name = 'Fennec'
                    AND os = 'iOS'))
         GROUP BY 1,
                  2,
                  3),
           fenix_rollups AS
        (SELECT submission_date,
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
                'Firefox for Android (Fenix)' AS canonical_name,
                count(*) AS dau
         FROM `moz-fx-data-shared-prod.org_mozilla_firefox.baseline_clients_daily`
         WHERE submission_date >= '2021-05-18'
         GROUP BY 1,
                  2,
                  3),
           ios_rollups AS
        (SELECT submission_date,
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
                'Firefox for iOS' AS canonical_name,
                count(*) AS dau
         FROM `moz-fx-data-shared-prod.org_mozilla_ios_firefox.baseline_clients_daily`
         WHERE submission_date >= '2021-05-18'
         GROUP BY 1,
                  2,
                  3)
      SELECT a.*,
             coalesce(b.SAP_total, 0) AS SAP_total,
             coalesce(b.SAP_clients, 0) AS SAP_clients
      FROM (
              (SELECT *
               FROM fenix_rollups)
            UNION ALL
              (SELECT *
               FROM ios_rollups)) a
      LEFT JOIN searches_all b ON (a.submission_date = b.submission_date
                                   AND a.country = b.country
                                   AND a.canonical_name = b.canonical_name)
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

  dimension: canonical_name {
    type: string
    sql: ${TABLE}.canonical_name ;;
  }

######################################################

  measure: dau {
    type:sum
    sql: ${TABLE}.dau;;
  }

  measure: SAP_total {
    type:sum
    sql: ${TABLE}.SAP_total;;
  }

  measure: SAP_clients {
    type:sum
    sql: ${TABLE}.SAP_clients;;
  }

}

#################################################################################
#################################################################################
#################################################################################
