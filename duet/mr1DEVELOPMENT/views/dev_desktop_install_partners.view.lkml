view: dev_desktop_install_partners {
  derived_table: {
    sql:
    WITH tbl AS
      (SELECT DATE(submission_timestamp) AS submission_date,
              CASE
                  WHEN normalized_country_code IN ('US','GB','DE','FR','CA','BR','MX',
                                                   'CN','IN','AU','NL','ES','RU') THEN normalized_country_code
                  ELSE 'ROW'
              END AS normalized_country_code_subset,
              CASE
                  WHEN CONCAT(split(os_version, '.')[offset(0)], '.', split(os_version, '.')[offset(1)]) = '10.0' THEN 'Win10/11'
                  WHEN CONCAT(split(os_version, '.')[offset(0)], '.', split(os_version, '.')[offset(1)]) = '6.1' THEN 'Win7'
                  WHEN CONCAT(split(os_version, '.')[offset(0)], '.', split(os_version, '.')[offset(1)]) IN ('6.2',
                                                                                                             '6.3') THEN 'Win8/8.1'
                  ELSE 'Win Other'
              END AS os_group,
              CASE
                  WHEN (silent = FALSE
                        OR silent IS NULL)
                       AND DATE_DIFF(-- Only use builds from the last month
     DATE(submission_timestamp), SAFE.PARSE_DATE('%Y%m%d', SUBSTR(build_id, 0, 8)), WEEK) <= 6
                       AND IF((attribution IS NULL
                               OR attribution = ''
                               OR attribution = '0'), NULL, SPLIT(SPLIT(attribution, '26ua%3D')[SAFE_OFFSET(1)], '%')[SAFE_OFFSET(0)]) != 'firefox'
                       AND IF((attribution IS NULL
                               OR attribution = ''
                               OR attribution = '0'), NULL, SPLIT(SPLIT(attribution, '26ua%3D')[SAFE_OFFSET(1)], '%')[SAFE_OFFSET(0)]) IS NOT NULL
                       AND (distribution_id IS NULL
                            OR distribution_id = '0'
                            OR (distribution_id IN ('mozilla-win-eol-esr115',
                                                    'mozilla-mac-eol-esr1',
                                                    'mozilla-mac-eol-esr115')-- exclude ESR migrations

      OR distribution_id IN ('mozilla101','mozilla102','mozilla139','mozilla138',
      'mozilla86','mozilla116','mozilla63','mozilla88',
      'mozilla118','mozilla134','mozilla105','mozilla94',
      'mozilla117','mozilla14','mozilla93','mozilla15',
      'mozilla114','mozilla104','mozilla103','mozilla111',
      'mozilla81','mozilla50','mozilla76','mozilla113',
      'mozilla90','mozilla80','mozilla87','mozilla97',
      'mozilla100','mozilla77','mozilla75','mozilla78',
      'mozilla110','mozilla52','mozilla79','mozilla106',
      'mozilla85','mozilla53','mozilla115','mozilla112',
      'mozilla98','mozilla99','mozilla28','mozilla12',
      'mozilla84','mozilla11','mozilla26','mozilla68',
      'mozilla83','mozilla91','mozilla94-default',
      'mozilla121','mozilla41','mozilla92','mozilla82',
      'mozilla96','mozilla132','mozilla67','mozilla61',
      'mozilla13','mozilla51','mozilla19','mozilla66',
      'mozilla131','mozilla89','mozilla104-utility-existing',
      'mozilla35','mozilla130','mozilla32','mozilla120',
      'mozilla34','mozilla38','mozilla119','mozilla36',
      'mozilla43','mozilla21','mozilla45','mozilla95',
      'mozilla-cliqz-001','mozilla60','mozilla122',
      'mozilla25','mozilla135','mozilla102-no-thanks',
      'mozilla22','mozilla-cliqz-008','mozilla86-utility-existing',
      'mozilla-cliqz-005','mozilla18','mozilla40',
      'mozilla-cliqz-006')-- exclude known funnelcakes
      )) THEN 'mozorg windows funnel'
      WHEN distribution_id IS NOT NULL
      AND distribution_id != '0'
      AND (distribution_id NOT IN ('mozilla-win-eol-esr115',
      'mozilla-mac-eol-esr1',
      'mozilla-mac-eol-esr115')-- exclude ESR migrations

      AND distribution_id NOT IN ('mozilla101','mozilla102','mozilla139','mozilla138',
      'mozilla86','mozilla116','mozilla63','mozilla88',
      'mozilla118','mozilla134','mozilla105','mozilla94',
      'mozilla117','mozilla14','mozilla93','mozilla15',
      'mozilla114','mozilla104','mozilla103','mozilla111',
      'mozilla81','mozilla50','mozilla76','mozilla113',
      'mozilla90','mozilla80','mozilla87','mozilla97',
      'mozilla100','mozilla77','mozilla75','mozilla78',
      'mozilla110','mozilla52','mozilla79','mozilla106',
      'mozilla85','mozilla53','mozilla115','mozilla112',
      'mozilla98','mozilla99','mozilla28','mozilla12',
      'mozilla84','mozilla11','mozilla26','mozilla68',
      'mozilla83','mozilla91','mozilla94-default',
      'mozilla121','mozilla41','mozilla92','mozilla82',
      'mozilla96','mozilla132','mozilla67','mozilla61',
      'mozilla13','mozilla51','mozilla19','mozilla66',
      'mozilla131','mozilla89','mozilla104-utility-existing',
      'mozilla35','mozilla130','mozilla32','mozilla120',
      'mozilla34','mozilla38','mozilla119','mozilla36',
      'mozilla43','mozilla21','mozilla45','mozilla95',
      'mozilla-cliqz-001','mozilla60','mozilla122',
      'mozilla25','mozilla135','mozilla102-no-thanks',
      'mozilla22','mozilla-cliqz-008','mozilla86-utility-existing',
      'mozilla-cliqz-005','mozilla18','mozilla40',
      'mozilla-cliqz-006')-- exclude known funnelcakes
      ) THEN 'partner'
      ELSE 'other'
      END AS funnel_derived,
      CASE
      WHEN distribution_id IN ('1und1',
      'gmx',
      'gmxcouk',
      'gmxes',
      'gmxfr',
      'mail.com',
      'webde') THEN 'United Internet'
      WHEN distribution_id IN ('yandex-drp',
      'yandex-portals',
      'yandex-ru',
      'yandex-ru-mz',
      'yandex-tr',
      'yandex-ua',
      'yandex',
      'yandex-uk',
      'yandex-tr-tamindir',
      'mailru-001',
      'orku-001') THEN 'Yandex'
      WHEN distribution_id IN ('seznam') THEN 'Seznam'
      WHEN distribution_id IN ('softonic-004',
      'softonic-003',
      'softonic-002',
      'softonic-005',
      'softonic-009',
      'softonic-006',
      'softonic-008') THEN 'Softonic'
      WHEN distribution_id IN ('yahoo',
      'yahoode',
      'yahoofr',
      'yahootw',
      'yahoohk',
      'yahoogb',
      'yahooca',
      'yahooid') THEN 'Yahoo'
      WHEN distribution_id IN ('aol',
      'aoluk',
      'aolde') THEN 'AOL'
      WHEN distribution_id IN ('mozilla-chipde-001') THEN 'Chipde'
      WHEN distribution_id IN ('canonical',
      'canonical-001',
      'canonical-002') THEN 'Linux - Canonical'
      WHEN distribution_id IN ('mint-001',
      'mint') THEN 'Linux - Mint'
      WHEN distribution_id IN ('fedora',
      'redhat',
      'archlinux',
      'altlinux',
      'alpinelinux',
      'almalinux',
      'artixlinux',
      'MX-Linux',
      'rocky-linux',
      'gentoo',
      'openSUSE',
      'suse') THEN 'Linux - Misc.'
      WHEN distribution_id IN ('mozilla-deb',
      'Debian',
      'debian') THEN 'Linux - Deb (store)'
      WHEN distribution_id IN ('mozilla-flatpak') THEN 'Linux - Flatpak (store)'
      WHEN distribution_id IN ('mozilla-MSIX') THEN 'Microsoft (store)'
      WHEN distribution_id IN ('euballot') THEN 'Microsoft (EU ballot)'
      WHEN distribution_id IN ('toshiba-001') THEN 'Toshiba'
      WHEN distribution_id IN ('acer',
      'acer-001',
      'acer-002',
      'acer-g-003',
      'acer-003',
      'acer-004') THEN 'Acer'
      WHEN distribution_id IN ('wildtangent-001') THEN 'Wild Tangent'
      WHEN distribution_id IN ('sweetlabs-b-oem2',
      'sweetlabs-oem2',
      'sweetlabs-b-r-oem2',
      'sweetlabs-b-oem1',
      'sweetlabs-b-oem3',
      'sweetlabs-b-r-oem1',
      'sweetlabs-oem1') THEN 'Sweetlabs'
      WHEN distribution_id IN ('playanext-wt-001',
      'playanext-wt-us-001') THEN 'Playanext'
      WHEN distribution_id IN ('isltd-g-001',
      'isltd-g-aura-001',
      'isltd-y-aura-001',
      'isltd-y-001',
      'isltd-001',
      'isltd-002',
      'isltd-003') THEN 'Ironsource'
      WHEN distribution_id IN ('MozillaOnline') THEN 'Mozilla - China'
      WHEN distribution_id IN ('mozilla-win-eol-esr115',
      'mozilla-mac-eol-esr1',
      'mozilla-mac-eol-esr115') THEN 'Mozilla - ESR migration'
      WHEN distribution_id IN ('mozilla-EMEfree',
      'EMEfree') THEN 'Mozilla - EME free'
      WHEN distribution_id IN ('mozilla101','mozilla102','mozilla139','mozilla138',
      'mozilla86','mozilla116','mozilla63','mozilla88',
      'mozilla118','mozilla134','mozilla105','mozilla94',
      'mozilla117','mozilla14','mozilla93','mozilla15',
      'mozilla114','mozilla104','mozilla103','mozilla111',
      'mozilla81','mozilla50','mozilla76','mozilla113',
      'mozilla90','mozilla80','mozilla87','mozilla97',
      'mozilla100','mozilla77','mozilla75','mozilla78',
      'mozilla110','mozilla52','mozilla79','mozilla106',
      'mozilla85','mozilla53','mozilla115','mozilla112',
      'mozilla98','mozilla99','mozilla28','mozilla12',
      'mozilla84','mozilla11','mozilla26','mozilla68',
      'mozilla83','mozilla91','mozilla94-default',
      'mozilla121','mozilla41','mozilla92','mozilla82',
      'mozilla96','mozilla132','mozilla67','mozilla61',
      'mozilla13','mozilla51','mozilla19','mozilla66',
      'mozilla131','mozilla89','mozilla104-utility-existing',
      'mozilla35','mozilla130','mozilla32','mozilla120',
      'mozilla34','mozilla38','mozilla119','mozilla36',
      'mozilla43','mozilla21','mozilla45','mozilla95',
      'mozilla-cliqz-001','mozilla60','mozilla122',
      'mozilla25','mozilla135','mozilla102-no-thanks',
      'mozilla22','mozilla-cliqz-008','mozilla86-utility-existing',
      'mozilla-cliqz-005','mozilla18','mozilla40',
      'mozilla-cliqz-006')-- exclude known funnelcakes
      THEN 'Mozilla - Funnelcakes'
      WHEN (distribution_id IS NULL
      OR distribution_id = '0') THEN 'non-distribution'
      ELSE 'Uncategorized'
      END AS partner_org,
      CASE
      WHEN distribution_id IN ('1und1',
      'gmx',
      'gmxcouk',
      'gmxes',
      'gmxfr',
      'mail.com',
      'webde') THEN 'partner website'
      WHEN distribution_id IN ('yandex-drp',
      'yandex-portals',
      'yandex-ru',
      'yandex-ru-mz',
      'yandex-tr',
      'yandex-ua',
      'yandex',
      'yandex-uk',
      'yandex-tr-tamindir',
      'mailru-001',
      'orku-001') THEN 'partner website'
      WHEN distribution_id IN ('seznam') THEN 'partner website'
      WHEN distribution_id IN ('softonic-004',
      'softonic-003',
      'softonic-002',
      'softonic-005',
      'softonic-009',
      'softonic-006',
      'softonic-008') THEN 'partner website'
      WHEN distribution_id IN ('yahoo',
      'yahoode',
      'yahoofr',
      'yahootw',
      'yahoohk',
      'yahoogb',
      'yahooca',
      'yahooid') THEN 'partner website'
      WHEN distribution_id IN ('aol',
      'aoluk',
      'aolde') THEN 'partner website'
      WHEN distribution_id IN ('mozilla-chipde-001') THEN 'partner website'
      WHEN distribution_id IN ('canonical',
      'canonical-001',
      'canonical-002') THEN 'OS pre-installed'
      WHEN distribution_id IN ('mint-001',
      'mint') THEN 'OS pre-installed'
      WHEN distribution_id IN ('fedora',
      'redhat',
      'archlinux',
      'altlinux',
      'alpinelinux',
      'almalinux',
      'artixlinux',
      'MX-Linux',
      'rocky-linux',
      'gentoo',
      'openSUSE',
      'suse') THEN 'OS pre-installed'
      WHEN distribution_id IN ('mozilla-deb',
      'Debian',
      'debian') THEN 'secondary store'
      WHEN distribution_id IN ('mozilla-flatpak') THEN 'secondary store'
      WHEN distribution_id IN ('mozilla-MSIX') THEN 'secondary store'
      WHEN distribution_id IN ('euballot') THEN 'secondary store'
      WHEN distribution_id IN ('toshiba-001') THEN 'OEM pre-installed'
      WHEN distribution_id IN ('acer',
      'acer-001',
      'acer-002') THEN 'OEM pre-installed'
      WHEN distribution_id IN ('acer-g-003',
      'acer-003',
      'acer-004') THEN 'OEM onboarding'
      WHEN distribution_id IN ('wildtangent-001') THEN 'OEM onboarding'
      WHEN distribution_id IN ('sweetlabs-b-oem2',
      'sweetlabs-oem2',
      'sweetlabs-b-r-oem2',
      'sweetlabs-b-oem1',
      'sweetlabs-b-oem3',
      'sweetlabs-b-r-oem1',
      'sweetlabs-oem1') THEN 'OEM onboarding'
      WHEN distribution_id IN ('playanext-wt-001',
      'playanext-wt-us-001') THEN 'OEM onboarding'
      WHEN distribution_id IN ('isltd-g-001',
      'isltd-g-aura-001',
      'isltd-y-aura-001',
      'isltd-y-001',
      'isltd-001',
      'isltd-002',
      'isltd-003') THEN 'OEM onboarding'
      WHEN distribution_id IN ('MozillaOnline') THEN 'partner website'
      WHEN distribution_id IN ('mozilla-win-eol-esr115',
      'mozilla-mac-eol-esr1',
      'mozilla-mac-eol-esr115') THEN 'mozilla internal accounting'
      WHEN distribution_id IN ('mozilla-EMEfree',
      'EMEfree') THEN 'Mozilla - EME free'
      WHEN distribution_id IN ('mozilla101','mozilla102','mozilla139','mozilla138',
      'mozilla86','mozilla116','mozilla63','mozilla88',
      'mozilla118','mozilla134','mozilla105','mozilla94',
      'mozilla117','mozilla14','mozilla93','mozilla15',
      'mozilla114','mozilla104','mozilla103','mozilla111',
      'mozilla81','mozilla50','mozilla76','mozilla113',
      'mozilla90','mozilla80','mozilla87','mozilla97',
      'mozilla100','mozilla77','mozilla75','mozilla78',
      'mozilla110','mozilla52','mozilla79','mozilla106',
      'mozilla85','mozilla53','mozilla115','mozilla112',
      'mozilla98','mozilla99','mozilla28','mozilla12',
      'mozilla84','mozilla11','mozilla26','mozilla68',
      'mozilla83','mozilla91','mozilla94-default',
      'mozilla121','mozilla41','mozilla92','mozilla82',
      'mozilla96','mozilla132','mozilla67','mozilla61',
      'mozilla13','mozilla51','mozilla19','mozilla66',
      'mozilla131','mozilla89','mozilla104-utility-existing',
      'mozilla35','mozilla130','mozilla32','mozilla120',
      'mozilla34','mozilla38','mozilla119','mozilla36',
      'mozilla43','mozilla21','mozilla45','mozilla95',
      'mozilla-cliqz-001','mozilla60','mozilla122',
      'mozilla25','mozilla135','mozilla102-no-thanks',
      'mozilla22','mozilla-cliqz-008','mozilla86-utility-existing',
      'mozilla-cliqz-005','mozilla18','mozilla40',
      'mozilla-cliqz-006')-- exclude known funnelcakes
      THEN 'mozilla internal accounting'
      WHEN (distribution_id IS NULL
      OR distribution_id != '0') THEN 'non-distribution'
      ELSE 'Uncategorized'
      END AS distribution_model,
      CASE WHEN distribution_id = '0' THEN null ELSE distribution_id
        END AS distribution_id,

      SUM(CASE
      WHEN succeeded = TRUE
      AND had_old_install IS NOT TRUE THEN 1
      ELSE 0
      END) AS new_installs,
      SUM(CASE
      WHEN succeeded = TRUE
      AND had_old_install = TRUE THEN 1
      ELSE 0
      END) AS paveover_installs,
      SUM(CASE
      WHEN succeeded = TRUE THEN 1
      ELSE 0
      END) AS installs
      FROM `mozdata.firefox_installer.install`
      WHERE date(submission_timestamp) >= '2021-01-01'
      AND DATE_DIFF(current_date(), date(submission_timestamp), DAY) > 1
      GROUP BY 1,
      2,
      3,
      4,
      5,
      6, 7),
    tbl2 AS
      (SELECT *,
      AVG(new_installs) OVER (PARTITION BY funnel_derived,
      normalized_country_code_subset,
      os_group,
      partner_org,
      distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS new_installs_smoothed,
      AVG(paveover_installs) OVER (PARTITION BY funnel_derived,
      normalized_country_code_subset,
      os_group,
      partner_org,
      distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS paveover_installs_smoothed,
      AVG(installs) OVER (PARTITION BY funnel_derived,
      normalized_country_code_subset,
      os_group,
      partner_org,
      distribution_model, distribution_id
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS installs_smoothed
      FROM tbl)

    SELECT
      *
    FROM
      tbl2
    WHERE
      submission_date IN (SELECT distinct first_seen_date
                          FROM `mozdata.telemetry.clients_first_seen_28_days_later`
                          WHERE first_seen_date >= '2021-01-01'
                          AND DATE_DIFF(current_date(), first_seen_date, DAY) > 1
                          )
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
    sql: ${TABLE}.normalized_country_code_subset ;;
    type: string
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code. Other then those 8 countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: ${TABLE}.funnel_derived;;
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

  measure: new_installs {
    type: sum
    sql:  ${TABLE}.new_installs ;;
    description: "Total number of new installs (no previous installation found)."
  }

  measure: paveover_installs{
    type: sum
    sql:  ${TABLE}.paveover_installs ;;
    description: "Total number of paverover installs (previous install found during install)."
  }

  measure: total_installs {
    type: sum
    sql:  ${TABLE}.installs ;;
    description: "new_installs + paveover_installs"
  }

  measure: new_installs_smoothed {
    type: sum
    sql:  ${TABLE}.new_installs_smoothed ;;
    description: "7 day MA"
  }

  measure: paveover_installs_smoothed{
    type: sum
    sql:  ${TABLE}.paveover_installs_smoothed ;;
    description: "7 day MA"
  }

  measure: total_installs_smoothed {
    type: sum
    sql:  ${TABLE}.installs_smoothed ;;
    description: "7 day MA"
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
