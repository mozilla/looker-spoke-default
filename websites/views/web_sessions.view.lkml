view: web_sessions {
  derived_table: {
    sql:
    with events_with_page_ids as (
      select
        *,
        client_info.session_id as session_id,
        sum(if(event_name = 'page_load', 1, 0)) over (session_window) page_id
      from `mozdata.{% parameter app_id %}.events_stream`
      where event_category = 'glean' and client_info.session_id is not null
        and submission_timestamp >= coalesce({% date_start submission_date_filter %}, timestamp_sub(current_timestamp(), interval 28 day))
        and submission_timestamp <= coalesce({% date_end submission_date_filter %}, current_timestamp())
      window session_window as (partition by client_info.session_id order by submission_timestamp)
    ),
    session_level_metrics as (
      select
        session_id,
        first_value(safe.string(event_extra.url)) over (session_win) as landing_url,
        first_value(safe.string(event_extra.referrer)) over (session_win) as landing_referrer,
        first_value(safe.string(event_extra.title)) over (session_win) as landing_title,
        last_value(safe.string(event_extra.title)) over (session_win) as exit_title,
        timestamp_diff(
          last_value(submission_timestamp) over (session_win),
          first_value(submission_timestamp) over (session_win), millisecond) as session_length_ms,
        countif(event_name = 'page_load') over (session_win) as session_page_load_count,
        countif(event_name = 'element_click') over (session_win) as session_click_count,
        max(submission_timestamp) over (session_win) as max_timestamp,
      from events_with_page_ids
      qualify submission_timestamp = max_timestamp
      window session_win as (partition by session_id order by submission_timestamp ROWS BETWEEN unbounded preceding AND unbounded following)
    ),
    page_level_metrics as (
      select
        session_id,
        document_id,
        -- Add page title and url to the click event extras
        case
          when event_name = 'element_click' then
          json_set(event_extra,
            '$.title', first_value(safe.string(event_extra.title)) over (session_page_window),
            '$.url', first_value(safe.string(event_extra.url)) over (session_page_window),
            '$.referrer', first_value(safe.string(event_extra.referrer)) over (session_page_window)
          )
          else event_extra
        end as event_extra,
        case
          when event_name = 'page_load' then
            timestamp_diff(
              greatest(
                -- next page load ts
                max(if(event_name = 'page_load', submission_timestamp, timestamp_millis(0))) over (session_event_window rows between current row and 1 following),
                -- last event on page ts
                max(submission_timestamp) over (session_page_window rows between current row and unbounded following)
              ),
              submission_timestamp,
              MILLISECOND
            )
          else null
        end page_dwell_ms,
        case
          when event_name = 'page_load' then
            countif(event_name = 'element_click') over (session_page_window ROWS BETWEEN current row AND unbounded following)
          else null
        end page_click_count,
      from events_with_page_ids
      window session_page_window as (partition by session_id, page_id order by submission_timestamp),
        session_event_window as (partition by session_id, event_name order by submission_timestamp)
    )

    select
      events_stream.submission_timestamp as submission_timestamp,
      events_stream.session_id as session_id,
      events_stream.document_id as document_id,
      events_stream.client_info.session_count as session_count,
      events_stream.client_info.app_channel as app_channel,
      events_stream.metadata.isp as isp,
      events_stream.metadata.user_agent as user_agent,
      events_stream.client_id as client_id,
      events_stream.normalized_country_code as normalized_country_code,
      events_stream.event_name as event_name,
      events_stream.event_category as event_category,
      page_level_metrics.event_extra as event_extra,
      session_level_metrics.landing_url as landing_url,
      session_level_metrics.landing_referrer as landing_referrer,
      session_level_metrics.landing_title as landing_title,
      session_level_metrics.exit_title as exit_title,
      session_level_metrics.session_length_ms as session_length_ms,
      session_level_metrics.session_page_load_count as session_page_load_count,
      session_level_metrics.session_click_count as session_click_count,
      page_level_metrics.page_click_count as page_click_count,
      page_level_metrics.page_dwell_ms as page_dwell_ms,
    from events_with_page_ids events_stream
    left join session_level_metrics on (session_level_metrics.session_id = events_stream.session_id)
    left join page_level_metrics on (
      page_level_metrics.session_id = events_stream.session_id and
      page_level_metrics.document_id = events_stream.document_id
    );;
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
    allowed_value: {
      label: "Mozilla.org"
      value: "bedrock"
    }
    allowed_value: {
      label: "MDN"
      value: "mdn_yari"
    }
    allowed_value: {
      label: "Monitor"
      value: "monitor_frontend"
    }
    allowed_value: {
      label: "Mozilla Accounts"
      value: "accounts_frontend"
    }
    allowed_value: {
      label: "GLAM"
      value: "glam"
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

  dimension: event_name {
    sql: ${TABLE}.event_name ;;
    type: string
  }

  dimension: new_session {
    sql: ${TABLE}.session_count = 1 ;;
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
    sql: ${TABLE}.app_channel ;;
  }

  dimension: metadata__isp__name {
    sql: ${TABLE}.isp.name ;;
    type: string
    group_label: "Metadata Isp"
    group_item_label: "Name"
  }

  dimension: metadata__isp__organization {
    sql: ${TABLE}.isp.organization ;;
    type: string
    group_label: "Metadata Isp"
    group_item_label: "Organization"
  }

  dimension: metadata__user_agent__browser {
    sql: ${TABLE}.user_agent.browser ;;
    type: string
    group_label: "Metadata User Agent"
    group_item_label: "Browser"
  }

  dimension: metadata__user_agent__os {
    sql: ${TABLE}.user_agent.os ;;
    type: string
    group_label: "Metadata User Agent"
    group_item_label: "Os"
  }

  dimension: metadata__user_agent__version {
    sql: ${TABLE}.user_agent.version ;;
    type: string
    group_label: "Metadata User Agent"
    group_item_label: "Version"
  }

  ###
  # Click dimensions
  ###
  dimension: click_target {
    type: string
    sql: safe.string(${TABLE}.event_extra.target) ;;
  }

  dimension: click_label {
    type: string
    sql: safe.string(${TABLE}.event_extra.label) ;;
  }

  measure: client_count {
    type: count_distinct
    sql: ${client_id} ;;
  }

  measure: session_count {
    type: count_distinct
    sql: ${session_id} ;;
  }

  measure: event_count {
    type: count_distinct
    sql: ${TABLE}.document_id ;;
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

  measure: average_page_dwell {
    type: average
    sql: ${TABLE}.page_dwell_ms ;;
  }

  measure: average_clicks_per_page {
    type: average
    sql: ${TABLE}.page_click_count ;;
  }
}
