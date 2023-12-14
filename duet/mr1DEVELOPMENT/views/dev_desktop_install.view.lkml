
view: dev_desktop_install {
  derived_table: {
    sql:  SELECT
            submission_timestamp,
            silent,
            update_channel,
            build_id,
            attribution,
            normalized_country_code,
            CASE WHEN succeeded = TRUE AND had_old_install IS NOT TRUE THEN 1 ELSE 0 END AS new_install,
            CASE WHEN succeeded = TRUE AND had_old_install = TRUE THEN 1 ELSE 0 END AS paveover_install,
            CASE WHEN succeeded = TRUE THEN 1 ELSE 0 END AS install
          FROM `mozdata.firefox_installer.install`
          WHERE date(submission_timestamp) >= '2021-01-01'
    ;;
  }

  dimension: normalized_country_code_subset {
    sql: CASE WHEN ${TABLE}.normalized_country_code IN ('US', 'GB', 'DE', 'FR','CA', 'BR','MX', 'CN', 'IN', 'AU', 'NL', 'ES', 'RU')
              THEN ${TABLE}.normalized_country_code
              ELSE 'ROW'
              END
              ;;
    type: string
    description: "A subset standardized_country_names formated in ISO 3166-1 alpha-2 country code. Other then those 8 countries, rest are defined as Rest of World"
  }

  dimension: funnel_derived {
    sql: CASE
          WHEN (${TABLE}.silent = FALSE OR ${TABLE}.silent IS NULL)
          AND ${TABLE}.update_channel = 'release'
          AND DATE_DIFF(  -- Only use builds from the last month
                DATE(${TABLE}.submission_timestamp),
                SAFE.PARSE_DATE('%Y%m%d', SUBSTR(${TABLE}.build_id, 0, 8)),
                WEEK
                ) <= 6
          AND IF((attribution IS NULL OR attribution = '' OR attribution = '0'),
             NULL,
             SPLIT(
                SPLIT(
                    ${TABLE}.attribution,
                    '26ua%3D')[SAFE_OFFSET(1)],
                    '%')[SAFE_OFFSET(0)]
                    ) != 'firefox'
          AND IF((attribution IS NULL OR attribution = '' OR attribution = '0'),
             NULL,
             SPLIT(
                SPLIT(
                    attribution,
                    '26ua%3D')[SAFE_OFFSET(1)],
                    '%')[SAFE_OFFSET(0)]
                    ) IS NOT NULL
          THEN 'mozorg windows funnel'
          ELSE 'other'
          END
          ;;
    type: string
    description: "defining membership in the different firefox acquisition funnels"
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_timestamp ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
    description: "Time when the ingestion edge server accepted this message"
  }

  measure: new_installs {
    type: sum
    sql:  ${TABLE}.new_install ;;
    description: "Total number of new installs (no previous installation found)."
  }

  measure: paveover_installs{
    type: sum
    sql:  ${TABLE}.paveover_install ;;
    description: "Total number of paverover installs (previous install found during install)."
  }

  measure: total_installs {
    type: sum
    sql:  ${TABLE}.install ;;
    description: "new_installs + paveover_installs"
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
