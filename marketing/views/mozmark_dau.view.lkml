view: mozmark_dau {

    derived_table: {
      sql: WITH dau_raw AS
  (SELECT submission_date,LAST_DAY(submission_date, MONTH) as month_end,
          countries.region_name  AS countries_region_name,
          country,
          case when app_name='Firefox Desktop' then 'Desktop'
 else 'Mobile'
          end as Platform,
          sum(dau) as dau,
          sum(case when adjust_network in ('Google Ads ACI', 'Apple Search Ads')
                   AND first_seen_year = 2024
                   then dau end) AS growth_contribution,
          sum(case when (adjust_network in ('Google Ads ACI', 'Apple Search Ads')
                         OR attribution_medium in ("paidsearch", "paiddisplay", "cpc", "email"
                                          , "display", "Display", "paidsocial", "paidvideo"
                                          , "social", "ppc", "banner", "Email", "ad-unit", "newsletter")
                        )
                   AND first_seen_year = 2024
                   then dau end) AS overall_marketing_contribution
   FROM `mozdata.telemetry.active_users_aggregates` as active_users_aggregates
    LEFT JOIN `mozdata.static.country_codes_v1`  AS countries ON active_users_aggregates.country = countries.code
   WHERE submission_date >= date('2023-01-01')
     AND app_name NOT LIKE "%BrowserStack%"
   GROUP BY 1,
            2,
            3,
            4,
            5)
, ma28 as (SELECT *,
       avg(dau) over(PARTITION BY Platform,countries_region_name, country
                     ORDER BY submission_date ROWS BETWEEN 27 preceding AND CURRENT ROW) AS ma_28_dau,
      avg(growth_contribution) over(PARTITION BY Platform,countries_region_name, country
                     ORDER BY submission_date ROWS BETWEEN 27 preceding AND CURRENT ROW) AS ma_28_dau_growth,
      avg(overall_marketing_contribution) over(PARTITION BY Platform,countries_region_name, country
                     ORDER BY submission_date ROWS BETWEEN 27 preceding AND CURRENT ROW) AS ma_28_dau_marketing
FROM dau_raw
)
, agg_for_lag as (
select
      Platform,
      FORMAT_DATE('%m-%b',  submission_date) as month,
      countries_region_name,
      country,
       sum(case when  extract (year from submission_date) = 2023 then ma_28_dau end) AS dau_prior,
       sum(case when  extract (year from submission_date) = 2024 then ma_28_dau end) AS dau_current,
       sum(case when  extract (year from submission_date) = 2024 then ma_28_dau_growth end) AS dau_current_gc,
       sum(case when  extract (year from submission_date) = 2024 then ma_28_dau_marketing end) AS dau_current_marketing
from ma28
where submission_date = month_end
group by 1, 2, 3, 4
)
SELECT *, LAG(dau_current_gc) OVER (PARTITION BY Platform,countries_region_name, country ORDER BY MONTH) as prev_month_gc
        , LAG(dau_current_marketing) OVER (PARTITION BY Platform,countries_region_name, country ORDER BY MONTH) as prev_month_marketing
FROM agg_for_lag
order by 2 desc
;;
    }

    dimension: Platform {
      label: "Platform"
      type: string
      sql: ${TABLE}.Platform ;;
    }

    dimension: countries_region_name {
      label: "Region"
      type: string
      sql: ${TABLE}.countries_region_name ;;
    }

    dimension: month {
      label: "Month"
      type: string
      sql: ${TABLE}.month;;
    }

    dimension: country {
      label: "Country"
      type: string
      sql: ${TABLE}.country ;;
    }



    measure: dau_prior {
      label: "Previous Year DAU"
      type: sum
      sql: ${TABLE}.dau_prior ;;
    }

    measure: dau_current {
      label: "Current Year DAU"
      type: sum
      sql: ${TABLE}.dau_current ;;
    }

    measure: dau_current_gc {
      label: "Growth DAU"
      description: "Attribututable Growth contributions to DAU"
      type: sum
      sql: ${TABLE}.dau_current_gc ;;
    }

    measure: dau_current_marketing {
      label: "Attributable Marketing DAU"
      description: "Attribututable Marketing contributions to DAU"
      type: sum
      sql: ${TABLE}.dau_current_marketing ;;
    }

  measure: prev_month_growth {
    label: "Prev Growth DAU"
    type: sum
    sql: ${TABLE}.prev_month_gc ;;
  }

  measure: prev_month_marketing {
    label: "Prev Marketing DAU"
    type: sum
    sql: ${TABLE}.prev_month_marketing;;
  }

  }
