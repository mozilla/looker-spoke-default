view: firefox_desktop_usage_2021 {
derived_table: {
  sql:
    select
        submission_date,
        sum(dau) as dau,
        sum(wau) as wau,
        sum(mau) as mau,
        sum(cdou) as cdou,
        sum(new_profiles) as new_profiles,
        sum(cumulative_new_profiles) as cumulative_new_profiles,
    from
        ${firefox_desktop_usage_fields.SQL_TABLE_NAME} AS firefox_desktop_usage_fields
    where
        {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.country_name %} country_name {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.attributed %} attributed {% endcondition %}
    group by 1 ;;
}

  filter: activity_segment {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.activity_segment
    type: string
  }

  filter: campaign {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.campaign
    type: string
  }

  filter: channel {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.channel
    type: string
  }

  filter: content {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.content
    type: string
  }

  filter: country {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.country
    type: string
  }

  filter: country_name {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.country_name
    type: string
  }

  filter: distribution_id {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.distribution_id
    type: string
  }

  filter: id_bucket {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.id_bucket
    type: number
  }

  filter: medium {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.medium
    type: string
  }

  filter: os {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.os
    type: string
  }

  filter: source {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.source
    type: string
  }

  filter: attributed {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.attributed
    type: yesno
  }

  parameter: show_2020 {
    type: yesno
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP) ;;
  }

  measure: dau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau ;;
  }

  measure: mau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.mau ;;
  }

  measure: new_profiles {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_cumulative {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.cumulative_new_profiles ;;
  }

  measure: cdou {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.cdou ;;
  }

  measure: new_profiles_cumulative_2021 {
    hidden: yes
    type: sum
    sql: ${TABLE}.cumulative_new_profiles ;;
    filters: [
      date: "after 2021-01-01"
    ]
  }

  measure: recent_new_profiles_cumulative {
    hidden: yes
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.cumulative_new_profiles ;;
  }

  measure: recent_cdou {
    hidden: yes
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.cdou ;;
  }

  measure: recent_date {
    hidden: yes
    type: date
    sql: MAX(CAST(${TABLE}.submission_date AS TIMESTAMP)) ;;
  }

  measure: wau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.wau ;;
  }

  measure: delta_from_forecast {
    label: "Cdou: Relative Delta from Forecast"
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${prediction.recent_cdou_forecast} ) - 1 ;;
  }

  measure: delta_from_target {
    label: "Cdou: Relative Delta from Target"
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / (${prediction.recent_cdou_target}) ) - 1 ;;
  }

  measure: delta_from_target_count {
    label: "Cdou: Absolute Delta from Target"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${prediction.cdou_target} ;;
  }

  measure: delta_from_forecast_count {
    label: "Cdou: Absolute Delta from Forecast"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${prediction.cdou_forecast}  ;;
  }

  measure: delta_from_forecast_new_profiles {
    hidden: yes
    type: number
    value_format: "0.000%"
    sql: (${recent_new_profiles_cumulative} / ${prediction.recent_cum_new_profiles_forecast} ) - 1 ;;
  }

  measure: delta_from_target_new_profiles {
    hidden: yes
    type: number
    value_format: "0.000%"
    sql: (${recent_new_profiles_cumulative} / (${prediction.recent_cum_new_profiles_target}) ) - 1 ;;
  }

  measure: delta_from_forecast_new_profiles_count {
    label: "New Profiles: Absolute Delta from Forecast"
    type: number
    value_format: "#,##0"
    sql: ${new_profiles_cumulative} - ${prediction.cum_new_profiles_forecast}  ;;
  }

  measure: delta_from_target_new_profiles_count {
    label: "New Profiles: Absolute Delta from Target"
    type: number
    value_format: "#,##0"
    sql: ${new_profiles_cumulative} - ${prediction.cum_new_profiles_target} ;;
  }

  measure: delta_from_forecast_format{
    type: number
    hidden: yes
    sql: ${delta_from_forecast_new_profiles} ;;
    html:
    {% assign target_delta = firefox_desktop_usage_2021.delta_from_target_new_profiles._value | times: 100 %}
    {% assign forecast_delta = firefox_desktop_usage_2021.delta_from_forecast_new_profiles._value | times: 100 %}
    <div class="topline" style="font-size: 30px; background-color: #d7d7db; color:#000000; padding: 12px; margin: 12px;">
      <center>
      <h1><b><u><font color="#ff9400">Progress in Desktop Cumulative New Profiles As Of {{ firefox_desktop_usage_2021.recent_date._rendered_value }}</font></u></b></h1>
      <img src="https://d33wubrfki0l68.cloudfront.net/06185f059f69055733688518b798a0feb4c7f160/9f07a/images/product-identity-assets/firefox.png" alt="Firefox Logo" style="width:300px;height:300px;float:right">
      <img src="https://d33wubrfki0l68.cloudfront.net/06185f059f69055733688518b798a0feb4c7f160/9f07a/images/product-identity-assets/firefox.png" alt="Firefox Logo" style="width:300px;height:300px;float:left">
      <h2><b><font color= "#45a1ff">Current Cumulative New Profiles: {{ firefox_desktop_usage_2021.recent_new_profiles_cumulative._rendered_value }} </font></b></h2>
      <p><em>{% if target_delta > 0 %} <font color="#30e60b">▲ {{ firefox_desktop_usage_2021.delta_from_target_new_profiles._rendered_value }}</font> {% else %} <font color="#ff0039">▼ {{ firefox_desktop_usage_2021.delta_from_target_new_profiles._rendered_value }}</font> {% endif %}  from +5% Target Pace ({{ prediction.recent_cum_new_profiles_target._rendered_value }})</em></p>
      <p>{% if forecast_delta > 0 %} <font color="#30e60b">▲ {{ firefox_desktop_usage_2021.delta_from_forecast_new_profiles._rendered_value }}</font> {% else %} <font color="#ff0039">▼ {{ firefox_desktop_usage_2021.delta_from_forecast_new_profiles._rendered_value }}</font> {% endif %} from Forecast ({{ prediction.recent_cum_new_profiles_forecast._rendered_value }})</p>
      <a href="#explainer" style="color: #0000EE"><u>Explainer</u></a>
      </center>
    </div>
   ;;
  }

  measure: delta_from_forecast_format2{
    type: number
    hidden: yes
    sql: ${delta_from_forecast} ;;
    html:
    {% assign target_delta = firefox_desktop_usage_2021.delta_from_target._value | times: 100 %}
    {% assign forecast_delta = firefox_desktop_usage_2021.delta_from_forecast._value | times: 100 %}
    <div class="topline" style="font-size: 30px; background-color: #d7d7db; color:#000000; padding: 12px; margin: 12px;">
      <center>
      <h1><b><u><font color="#ff9400">Progress in Desktop Cumulative Days of Use (CDOU) As Of {{ firefox_desktop_usage_2021.recent_date._rendered_value }}</font></u></b></h1>
      <img src="https://d33wubrfki0l68.cloudfront.net/06185f059f69055733688518b798a0feb4c7f160/9f07a/images/product-identity-assets/firefox.png" alt="Firefox Logo" style="width:300px;height:300px;float:right">
      <img src="https://d33wubrfki0l68.cloudfront.net/06185f059f69055733688518b798a0feb4c7f160/9f07a/images/product-identity-assets/firefox.png" alt="Firefox Logo" style="width:300px;height:300px;float:left">
      <h2><b><font color= "#45a1ff">Current CDOU: {{ firefox_desktop_usage_2021.recent_cdou._rendered_value }}</font></b></h2>
      <p><em>{% if target_delta > 0 %} <font color="#30e60b">▲ {{ firefox_desktop_usage_2021.delta_from_target._rendered_value }}</font> {% else %} <font color="#ff0039">▼ {{ firefox_desktop_usage_2021.delta_from_target._rendered_value }}</font> {% endif %}  from +5% Target Pace ({{ prediction.recent_cdou_target._rendered_value }})</em></p>
      <p>{% if forecast_delta > 0 %} <font color="#30e60b">▲ {{ firefox_desktop_usage_2021.delta_from_forecast._rendered_value }}</font> {% else %} <font color="#ff0039">▼ {{ firefox_desktop_usage_2021.delta_from_forecast._rendered_value }}</font> {% endif %} from Forecast ({{ prediction.recent_cdou_forecast._rendered_value }})</p>
      <a href="#explainer" style="color: #0000EE"><u>Explainer</u></a>
      </center>
    </div>
   ;;
  }

  # YoY Measures

  measure: year_over_year_dau {
    label: "2020 Dau"
    type: number
    sql: ${firefox_desktop_usage_2020.dau} ;;
  }

  measure: year_over_year_wau {
    label: "2020 Wau"
    type: number
    sql: ${firefox_desktop_usage_2020.wau} ;;
  }

  measure: year_over_year_mau {
    label: "2020 Mau"
    type: number
    sql: ${firefox_desktop_usage_2020.mau} ;;
  }

  measure: year_over_year_cdou {
    label: "2020 Cdou"
    type: number
    sql:
      {% if show_2020._parameter_value == 'Yes' %} ${firefox_desktop_usage_2020.cdou} {% else %} NULL {% endif %} ;;
  }

  measure: year_over_year_cdou_delta_count {
    label: "Cdou: Absolute Delta from 2020"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${year_over_year_cdou} ;;
  }

  measure: year_over_year_new_profiles {
    label: "2020 New Profiles"
    type: number
    sql: ${firefox_desktop_usage_2020.new_profiles} ;;
  }

  measure: year_over_year_new_profiles_cumulative {
    label: "2020 Cumulative New Profiles"
    type: number
    sql: ${firefox_desktop_usage_2020.new_profiles_cumulative} ;;
  }

  measure: year_over_year_new_profile_delta_count {
    label: "New Profiles: Absolute Delta from 2020"
    type: number
    value_format: "#,##0"
    sql: ${new_profiles_cumulative} - ${year_over_year_new_profiles_cumulative} ;;
  }

}
