view: mobile_usage_2021 {
  derived_table: {
    sql:
      with
      dau as (
        select
            submission_date,
            app_name,
            canonical_app_name,
            sum(dau) as dau,
            sum(wau) as wau,
            sum(mau) as mau,
            sum(cdou) as cdou
        from
            ${mobile_usage_fields.SQL_TABLE_NAME} AS mobile_usage_fields
        where
            {% condition mobile_usage_2021.campaign %} campaign {% endcondition %}
            AND {% condition mobile_usage_2021.channel %} channel {% endcondition %}
            AND {% condition mobile_usage_2021.country %} country {% endcondition %}
            AND {% condition mobile_usage_2021.country_name %} country_name {% endcondition %}
            AND {% condition mobile_usage_2021.distribution_id %} distribution_id {% endcondition %}
            AND {% condition mobile_usage_2021.id_bucket %} id_bucket {% endcondition %}
            AND {% condition mobile_usage_2021.os %} os {% endcondition %}
        group by 1,2,3
        ),

      # temporary - this is NOT using first_seen_date for now.
      new_profiles as (
        select
            cohort_date as submission_date,
            case when product in ("Fenix", "Fennec") then "fennec_fenix"
              when product = "Firefox iOS" then "firefox_ios"
              when product = "Focus iOS" then "focus_ios"
              when product = "Focus Android" then "focus_android" end as app_name,
            case when product in ("Fenix", "Fennec") then "Firefox for Android (Fennec + Fenix)"
              when product = "Firefox iOS" then "Firefox for iOS"
              when product = "Focus iOS" then "Firefox Focus for iOS"
              when product = "Focus Android" then "Firefox Focus for Android" end as canonical_app_name,
            sum(new_profiles) AS new_profiles
        from `mozdata.telemetry.firefox_nondesktop_day_2_7_activation`
        where
          {% condition mobile_usage_2021.country %} country {% endcondition %}
        group by 1,2,3
      )

      select
        *,
        avg(dau.dau) over (partition by app_name order by submission_date rows between 6 preceding and current row) as dau_7day_ma,
        avg(new_profiles.new_profiles) over (partition by app_name order by submission_date rows between 6 preceding and current row) as new_profiles_7day_ma,
        sum(new_profiles.new_profiles) over (partition by extract(year from submission_date), app_name order by submission_date) as new_profiles_cumulative
      from dau
      left join new_profiles
      using(submission_date, app_name, canonical_app_name)
      ;;
  }

  filter: campaign {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.campaign
    type: string
    description: "The (UTM) campaign that profiles are attributed to."
  }

  filter: channel {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.channel
    type: string
    description: "Mobile Firefox release channel."
  }

  filter: country {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.country
    type: string
    description: "Country codes derived from the client's IP address."
  }

  filter: country_name {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.country_name
    type: string
    description: "Full country names derived from the client's IP address."
  }

  filter: distribution_id {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.distribution_id
    type: string
    description: "The distribution ID, through a partner or a repack."
  }

  filter: id_bucket {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.id_bucket
    type: number
    description: "For sampling: each client_id is mapped to one of twenty id_buckets."
  }

  filter: os {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.os
    type: string
    description: "Profile's Operating System."
  }

  dimension: app_name {
    type: string
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.app_name
    sql: ${TABLE}.app_name ;;
    description: "Snake-cased mobile application name."
  }

  dimension: canonical_app_name {
    type: string
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.canonical_app_name
    sql: ${TABLE}.canonical_app_name ;;
    description: "Human readable mobile application name."
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP) ;;
  }

  measure: cdou {
    type: sum
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou ;;
    description: "Cumulative Days of Use, in that calendar year."
  }

  measure: dau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau ;;
    description: "Daily Active Users."
  }


  measure: dau_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_7day_ma ;;
    hidden: yes
  }

  measure: mau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.mau ;;
    description: "Monthly Active Users."
  }

  measure: new_profiles {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles ;;
    description: "New Profiles."
  }

  measure: new_profiles_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles_7day_ma ;;
    hidden: no
  }

  measure: recent_cdou {
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou ;;
    hidden: yes
  }

  measure: recent_date {
    type: date
    sql: MAX(CAST(${TABLE}.submission_date AS TIMESTAMP)) ;;
    hidden: yes
  }

  measure: wau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.wau ;;
    description: "Weekly Active Users."
  }

  measure: delta_from_forecast {
    type: number
    value_format: "0.00%"
    sql: (${recent_cdou} / ${mobile_prediction.recent_cdou_forecast} ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and forecasted CDOU."
  }

  measure: delta_from_forecast_daily {
    type: number
    value_format: "0.00%"
    sql: (${dau} / ${mobile_prediction.dau_forecast} ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and forecasted CDOU."
    hidden: yes
  }

  measure: delta_from_forecast_format{
    type: number
    hidden: yes
    sql: ${delta_from_forecast} ;;
    html:
    {% assign target_delta = mobile_usage_2021.delta_from_target._value | times: 100 %}
    {% assign forecast_delta = mobile_usage_2021.delta_from_forecast._value | times: 100 %}
    {% assign app_type = mobile_usage_2021.app_name._value %}
    <div class="topline" style="font-size: 30px; background-color: #d7d7db; color:#000000; padding: 12px; margin: 12px;">
      <center>
      <h1><b><u><font color="#ff9400">Progress in {{ mobile_usage_2021.canonical_app_name._value }} Cumulative Days of Use (CDOU) As Of {{ mobile_usage_2021.recent_date._rendered_value }}</font></u></b></h1>
      {% if app_type == 'fennec_fenix' or app_type == 'firefox_ios' %} <img src="https://d33wubrfki0l68.cloudfront.net/06185f059f69055733688518b798a0feb4c7f160/9f07a/images/product-identity-assets/firefox.png" alt="Firefox Logo" style="width:300px;height:300px;float:right"> {% else %} <img src="https://design.firefox.com/product-identity/firefox-focus/firefox-logo-focus.png" alt="Firefox Focus Logo" style="width:200px;height:200px;float:right"> {% endif %}
      {% if app_type == 'fennec_fenix' or app_type == 'firefox_ios' %} <img src="https://d33wubrfki0l68.cloudfront.net/06185f059f69055733688518b798a0feb4c7f160/9f07a/images/product-identity-assets/firefox.png" alt="Firefox Logo" style="width:300px;height:300px;float:left"> {% else %} <img src="https://design.firefox.com/product-identity/firefox-focus/firefox-logo-focus.png" alt="Firefox Focus Logo" style="width:200px;height:200px;float:left"> {% endif %}
      <h1><b><font color= "#45a1ff">Current CDOU: {{ mobile_usage_2021.recent_cdou._rendered_value }}</font></b></h1>
      <p><em>{% if target_delta > 0 %} <font color="#30e60b">▲ {{ mobile_usage_2021.delta_from_target._rendered_value }}</font> {% else %} <font color="#ff0039">▼ {{ mobile_usage_2021.delta_from_target._rendered_value }}</font> {% endif %}  from +{{ mobile_usage_2021.target_lift._rendered_value }} Target Pace ({{ mobile_prediction.recent_cdou_target._rendered_value }})</em></p>
      <p>{% if forecast_delta > 0 %} <font color="#30e60b">▲ {{ mobile_usage_2021.delta_from_forecast._rendered_value }}</font> {% else %} <font color="#ff0039">▼ {{ mobile_usage_2021.delta_from_forecast._rendered_value }}</font> {% endif %} from Forecast ({{ mobile_prediction.recent_cdou_forecast._rendered_value }})</p>
      <a href="#explainer" style="color: #0000EE"><u>Explainer</u></a>
      </center>
    </div>
   ;;
  }

  measure: delta_from_target {
    type: number
    value_format: "0.00%"
    sql: (${recent_cdou} / ${mobile_prediction.recent_cdou_target} ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and targeted CDOU."
  }

  measure: delta_from_target_daily {
    type: number
    value_format: "0.00%"
    sql: (${dau} / ${mobile_prediction.dau_target} ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and forecasted CDOU."
    hidden: yes
  }

  measure: delta_from_forecast_count {
    type: number
    value_format: "0.00,, \"Million\""
    sql: ${cdou} - ${mobile_prediction.cdou_forecast}  ;;
    description: "Absolute (given as a whole number) difference between actual CDOU and forecasted CDOU."

  }

  measure: delta_from_target_count {
    type: number
    value_format: "0.00,, \"Million\""
    sql: ${cdou} - ${mobile_prediction.cdou_target}  ;;
    description: "Absolute (given as a whole number) difference between actual CDOU and targeted CDOU."

  }

  measure: target_lift {
    type: number
    value_format: "0.0%"
    sql: (${mobile_prediction.recent_cdou_target} / ${mobile_prediction.recent_cdou_forecast} ) - 1 ;;
    hidden: yes
  }

  measure: new_profiles_cumulative {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles_cumulative ;;
    description: "Cumulative New Profiles in that calendar year."
  }

  # YoY Measures

  measure: year_over_year_dau {
    label: "2020 Dau"
    type: number
    sql: ${mobile_usage_2020.dau} ;;
    description: "Daily Active Users on this day in 2020."
  }

  measure: year_over_year_dau_7day_ma {
    label: "2020 Dau MA"
    type: number
    sql: ${mobile_usage_2020.dau_7day_ma} ;;
    hidden: yes
  }

  measure: year_over_year_wau {
    label: "2020 Wau"
    type: number
    sql: ${mobile_usage_2020.wau} ;;
    description: "Weekly Active Users on this day in 2020."
  }

  measure: year_over_year_mau {
    label: "2020 Mau"
    type: number
    sql: ${mobile_usage_2020.mau} ;;
    description: "Monthly Active Users on this day in 2020."
  }

  measure: year_over_year_cdou {
    label: "2020 CDOU"
    type: number
    sql: ${mobile_usage_2020.cdou} ;;
    description: "Cumulative Days of Use on this day in 2020."
  }

  measure: year_over_year_cdou_delta_count {
    label: "CDOU: Absolute Delta from 2020"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${year_over_year_cdou} ;;
    description: "Absolute (given as a whole number) difference between 2020's CDOU and 2021's CDOU."
  }

  measure: year_over_year_cdou_delta_percent {
    label: "CDOU: Percent Delta from 2020"
    type: number
    value_format: "0.00%"
    sql: ${dau} / ${year_over_year_dau} - 1 ;;
    description: "Percent difference between 2020's CDOU and 2021's CDOU."
  }

  measure: year_over_year_new_profiles {
    label: "2020 New Profiles"
    type: number
    sql: ${mobile_usage_2020.new_profiles} ;;
    description: "Number of New Profiles on this day in 2020."
  }

  measure: year_over_year_new_profiles_7day_ma {
    label: "2020 New Profiles MA"
    type: number
    sql: ${mobile_usage_2020.new_profiles_7day_ma} ;;
    hidden: yes
  }

  measure: year_over_year_new_profiles_cumulative {
    type: number
    value_format: "#,##0"
    sql: ${mobile_usage_2020.new_profiles_cumulative} ;;
    description: "Cumulative New Profiles on this day in 2020."
  }

  measure: year_over_year_new_profiles_delta {
    type: number
    value_format: "0.000%"
    sql: (${mobile_usage_2021.new_profiles_cumulative} / ${mobile_usage_2020.year_over_year_new_profiles_cumulative}) - 1 ;;
    description: "Cumulative New Profiles on this day in 2020."
  }


}
