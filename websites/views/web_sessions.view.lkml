view: web_sessions {
  derived_table: {
    sql:
    with page_session_dimensions as (
      select
        client_info.session_id as session_id,
        first_value(safe.string(event_extra.url)) over (session_win) as landing_url,
        first_value(safe.string(event_extra.referrer)) over (session_win) as landing_referrer,
        first_value(safe.string(event_extra.title)) over (session_win) as landing_title,
        last_value(safe.string(event_extra.title)) over (session_win) as exit_title,
        timestamp_diff(
          last_value(submission_timestamp) over (session_win),
          first_value(submission_timestamp) over (session_win), millisecond) as session_length_ms,
        count(1) over (session_win) as session_page_load_count,
        max(submission_timestamp) over (session_win) as max_timestamp,
      from `mozdata.{% parameter app_id %}.events_stream`
      where event_name = 'page_load' and event_category = 'glean'
      and submission_timestamp >= coalesce({% date_start submission_date_filter %}, timestamp_sub(current_timestamp(), interval 28 day))
      and submission_timestamp <= coalesce({% date_end submission_date_filter %}, current_timestamp())
      qualify submission_timestamp = max_timestamp
      window session_win as (partition by client_info.session_id order by submission_timestamp ROWS BETWEEN unbounded preceding AND unbounded following)
    )
    select
      page_session_dimensions.*,
      events_stream.*
    from `mozdata.{% parameter app_id %}.events_stream` events_stream
    left join page_session_dimensions on (page_session_dimensions.session_id = events_stream.client_info.session_id)
    where event_category = 'glean'
      and submission_timestamp >= coalesce({% date_start submission_date_filter %}, timestamp_sub(current_timestamp(), interval 28 day))
      and submission_timestamp <= coalesce({% date_end submission_date_filter %}, current_timestamp())
    ;;
  }

  filter: submission_date_filter {
    type: date
  }

  parameter: app_id {
    type: unquoted
    default_value: "debug_ping_view"
    allowed_value: {
      label: "Glean Debug Ping View"
      value: "debug_ping_view"
    }
    allowed_value: {
      label: "Glean Dictionary"
      value: "glean_dictionary"
    }
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
  }

  dimension: session_id {
    # primary_key: yes
    sql: ${TABLE}.session_id ;;
    type: string
  }

  dimension: client_id {
    # primary_key: yes
    sql: ${TABLE}.client_id ;;
    type: string
  }

  ##
  # Session level dimensions
  ##
  dimension: landing_url {
    type: string
    sql: ${TABLE}.landing_url ;;
  }

  dimension: landing_referrer {
    type: string
    sql: ${TABLE}.landing_referrer ;;
  }

  dimension: landing_title {
    type: string
    sql: ${TABLE}.landing_title ;;
  }

  dimension: exit_title {
    type: string
    sql: ${TABLE}.exit_title ;;
  }

  dimension: session_page_load_count {
    type: number
    sql: ${TABLE}.session_page_load_count ;;
  }

  dimension: session_duration {
    type: number
    sql: round(${TABLE}.session_length_ms/1000, 1) ;;
  }

  dimension: is_bounce {
    type: yesno
    sql: ${session_page_load_count} = 1 ;;
  }

  dimension: traffic_source {
    type: string
    sql: case
      when regexp_contains(${landing_referrer}, r"bing|google|baidu|yahoo|duckduckgo") then
        if(regexp_contains(${landing_referrer}, r'utm_(campaign|source|medium)'), "Paid Search", "Organic Search")
      when trim(${landing_referrer}) = "" then "Direct"
      when regexp_contains(${landing_referrer}, r'utm_(campaign|source|medium)') then "Paid"
      else "Other"
    end;;
  }

  ##
  # Event level dimensions
  ##
  dimension: new_session {
    sql: ${TABLE}.client_info.session_count = 1 ;;
    type: yesno
  }

  dimension: normalized_country_code {
    sql: ${TABLE}.normalized_country_code ;;
    type: string
    map_layer_name: countries
  }

  dimension: page_url {
    type: string
    sql: safe.string(${TABLE}.event_extra.url) ;;
    hidden: yes
  }

  dimension: page_path {
    type: string
    sql: regexp_extract(${page_url},r"(?:http[s]?:\/\/)?(?:[^\/\s]+)(\/.*)") ;;
  }

  dimension: page_title {
    type: string
    sql: safe.string(${TABLE}.event_extra.title) ;;
  }

  dimension: referrer {
    type: string
    sql: safe.string(${TABLE}.event_extra.referrer) ;;
  }

  dimension: external_referrer {
    type: string
    sql: if(net.host(${referrer}) = net.host(${page_url}) or ${referrer} = "", null, ${referrer}) ;;
  }

  dimension: referrer_host {
    type: string
    sql: net.host(${referrer}) ;;
  }

  dimension: utm_params__utm_source {
    sql: mozfun.utils.extract_utm_from_url(${page_url}).utm_source ;;
    type: string
    group_label: "UTM Parameters"
    group_item_label: "UTM Source"
  }

  dimension: utm_params__utm_medium {
    sql: mozfun.utils.extract_utm_from_url(${page_url}).utm_medium ;;
    type: string
    group_label: "UTM Parameters"
    group_item_label: "UTM Medium"
  }

  dimension: utm_params__utm_campaign {
    sql: mozfun.utils.extract_utm_from_url(${page_url}).utm_campaign ;;
    type: string
    group_label: "UTM Parameters"
    group_item_label: "UTM Campaign"
  }

  dimension: utm_params__utm_content {
    sql: mozfun.utils.extract_utm_from_url(${page_url}).utm_content ;;
    type: string
    group_label: "UTM Parameters"
    group_item_label: "UTM Content"
  }

  ##
  # A Selection of Events Stream Dimensions
  ##

  dimension: app_channel {
    type: string
    sql: ${TABLE}.client_info.app_channel ;;
  }

  dimension: metadata__isp__name {
    sql: ${TABLE}.metadata.isp.name ;;
    type: string
    group_label: "Metadata Isp"
    group_item_label: "Name"
  }

  dimension: metadata__isp__organization {
    sql: ${TABLE}.metadata.isp.organization ;;
    type: string
    group_label: "Metadata Isp"
    group_item_label: "Organization"
  }

  dimension: metadata__user_agent__browser {
    sql: ${TABLE}.metadata.user_agent.browser ;;
    type: string
    group_label: "Metadata User Agent"
    group_item_label: "Browser"
  }

  dimension: metadata__user_agent__os {
    sql: ${TABLE}.metadata.user_agent.os ;;
    type: string
    group_label: "Metadata User Agent"
    group_item_label: "Os"
  }

  dimension: metadata__user_agent__version {
    sql: ${TABLE}.metadata.user_agent.version ;;
    type: string
    group_label: "Metadata User Agent"
    group_item_label: "Version"
  }



  measure: client_count {
    type: count_distinct
    sql: ${client_id} ;;
  }

  measure: session_count {
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: average_session_duration {
    type: average
    sql: ${session_duration} ;;
  }

  measure: bounced_count {
    type: sum_distinct
    sql: if(${is_bounce}, 1, 0)  ;;
    sql_distinct_key: ${session_id} ;;
  }

  measure: bounce_rate {
    type: number
    sql: safe_divide(${bounced_count}, ${session_count}) ;;
  }
}
