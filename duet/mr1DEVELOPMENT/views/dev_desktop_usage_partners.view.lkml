view: dev_desktop_usage_partners {
  derived_table: {
    sql:
    WITH tbl AS (
SELECT first_seen_date AS submission_date,
       CASE
           WHEN country_code IN ('US',
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
                                 'RU') THEN country_code
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
       CASE
           WHEN channel = 'release'
                AND LOWER(os) LIKE '%windows%'
                AND DATE_DIFF(-- Only use builds from the last month
 DATE(first_seen_date), SAFE.PARSE_DATE('%Y%m%d', SUBSTR(build_id, 0, 8)), WEEK) <= 6
                AND attribution_source IS NOT NULL
                AND attribution_ua != 'firefox'
                AND attribution_ua IS NOT NULL
                AND startup_profile_selection_reason IN ('firstrun-created-default')
                AND distribution_id IS NULL THEN 'mozorg windows funnel'
           WHEN distribution_id IS NOT NULL THEN 'partner'
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
           WHEN distribution_id IN ('mozilla139',
                                    'mozilla101',
                                    'mozilla138',
                                    'mozilla102',
                                    'mozilla86',
                                    'mozilla63',
                                    'mozilla116',
                                    'mozilla14',
                                    'mozilla134') THEN 'Mozilla - Funnelcakes'
           WHEN distribution_id IS NULL THEN 'non-distribution'
           ELSE 'other'
       END AS partner_org,
       CASE
           WHEN distribution_id IN ('1und1',
                                    'gmx',
                                    'gmxcouk',
                                    'gmxes',
                                    'gmxfr',
                                    'mail.com',
                                    'webde') THEN 'current partner'
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
                                    'orku-001') THEN 'inactive partner'
           WHEN distribution_id IN ('seznam') THEN 'inactive partner'
           WHEN distribution_id IN ('softonic-004',
                                    'softonic-003',
                                    'softonic-002',
                                    'softonic-005',
                                    'softonic-009',
                                    'softonic-006',
                                    'softonic-008') THEN 'inactive partner'
           WHEN distribution_id IN ('yahoo',
                                    'yahoode',
                                    'yahoofr',
                                    'yahootw',
                                    'yahoohk',
                                    'yahoogb',
                                    'yahooca',
                                    'yahooid') THEN 'inactive partner'
           WHEN distribution_id IN ('aol',
                                    'aoluk',
                                    'aolde') THEN 'inactive partner'
           WHEN distribution_id IN ('mozilla-chipde-001') THEN 'no'
           WHEN distribution_id IN ('canonical',
                                    'canonical-001',
                                    'canonical-002') THEN 'current partner'
           WHEN distribution_id IN ('mint-001',
                                    'mint') THEN 'current partner'
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
                                    'suse') THEN 'no'
           WHEN distribution_id IN ('mozilla-deb',
                                    'Debian',
                                    'debian') THEN 'platform'
           WHEN distribution_id IN ('mozilla-flatpak') THEN 'platform'
           WHEN distribution_id IN ('mozilla-MSIX') THEN 'platform'
           WHEN distribution_id IN ('euballot') THEN 'platform'
           WHEN distribution_id IN ('toshiba-001') THEN 'inactive partner'
           WHEN distribution_id IN ('acer',
                                    'acer-001',
                                    'acer-002',
                                    'acer-g-003',
                                    'acer-003',
                                    'acer-004') THEN 'inactive partner'
           WHEN distribution_id IN ('wildtangent-001') THEN 'current partner'
           WHEN distribution_id IN ('sweetlabs-b-oem2',
                                    'sweetlabs-oem2',
                                    'sweetlabs-b-r-oem2',
                                    'sweetlabs-b-oem1',
                                    'sweetlabs-b-oem3',
                                    'sweetlabs-b-r-oem1',
                                    'sweetlabs-oem1') THEN 'current partner'
           WHEN distribution_id IN ('playanext-wt-001',
                                    'playanext-wt-us-001') THEN 'no'
           WHEN distribution_id IN ('isltd-g-001',
                                    'isltd-g-aura-001',
                                    'isltd-y-aura-001',
                                    'isltd-y-001',
                                    'isltd-001',
                                    'isltd-002',
                                    'isltd-003') THEN 'inactive partner'
           WHEN distribution_id IN ('MozillaOnline') THEN 'internal'
           WHEN distribution_id IN ('mozilla-win-eol-esr115',
                                    'mozilla-mac-eol-esr1',
                                    'mozilla-mac-eol-esr115') THEN 'internal'
           WHEN distribution_id IN ('mozilla-EMEfree',
                                    'EMEfree') THEN 'internal'
           WHEN distribution_id IN ('mozilla139',
                                    'mozilla101',
                                    'mozilla138',
                                    'mozilla102',
                                    'mozilla86',
                                    'mozilla63',
                                    'mozilla116',
                                    'mozilla14',
                                    'mozilla134') THEN 'internal'
           WHEN distribution_id IS NULL THEN 'non-distribution'
           ELSE 'other'
       END AS partnership_status,
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
                                    'mozilla-mac-eol-esr115') THEN 'NA'
           WHEN distribution_id IN ('mozilla-EMEfree',
                                    'EMEfree') THEN 'NA'
           WHEN distribution_id IN ('mozilla139',
                                    'mozilla101',
                                    'mozilla138',
                                    'mozilla102',
                                    'mozilla86',
                                    'mozilla63',
                                    'mozilla116',
                                    'mozilla14',
                                    'mozilla134') THEN 'NA'
           WHEN distribution_id IS NULL THEN 'non-distribution'
           ELSE 'other'
       END AS distribution_model,
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
         6,
         7
        )
    SELECT
      *,

      AVG(new_profiles) OVER
      (PARTITION BY funnel_derived, normalized_country_code_subset,
      os_group, partner_org, partnership_status, distribution_model
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      AS new_profiles_smoothed,

      AVG(returned_second_day) OVER
      (PARTITION BY funnel_derived, normalized_country_code_subset,
      os_group, partner_org, partnership_status, distribution_model
      ORDER BY submission_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      AS returned_second_day_smoothed,
      AVG(retained_week4) OVER
      (PARTITION BY funnel_derived, normalized_country_code_subset,
      os_group, partner_org, partnership_status, distribution_model
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

  dimension: partnership_status {
    sql: ${TABLE}.partnership_status
      ;;
    type: string
    description: "if partnership is active - only valid for funnel_derived = partner, otherwise will be non-distribution"
  }

  dimension: distribution_model {
    sql: ${TABLE}.distribution_model
      ;;
    type: string
    description: "how partner distributes FF - only valid for funnel_derived = partner, otherwise will be non-distribution"
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
