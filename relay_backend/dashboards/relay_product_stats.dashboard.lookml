- dashboard: relay_product_stats
  title: Relay Product Stats
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Product statistics for Firefox Relay: users, email, phone, API, and mask metrics."

  filters:
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: this year to second
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: relay_backend
    explore: events_stream
    listens_to_filters: []
    field: events_stream.submission_date

  elements:

  # ===== USERS SECTION =====

  - name: users_header
    type: text
    title_text: ''
    body_text: |
      <div style="border-bottom: solid 1px #4285F4; padding: 8px 0;">
        <h2 style="color: #4285F4; margin: 0;">Users</h2>
      </div>
    row: 0
    col: 0
    width: 24
    height: 3

  - title: Relay DAU
    name: Relay DAU
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, unique_users, relay_email_daus,
      relay_phone_daus, relay_api_daus, relay_mask_labels_dau]
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: unique_users
      based_on: events_stream.extras__string__fxa_id
      type: count_distinct
      label: Unique Users
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - measure: relay_email_daus
      based_on: events_stream.extras__string__fxa_id
      type: count_distinct
      label: Relay Email DAUs
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_category} = \"email\""
    - measure: relay_phone_daus
      based_on: events_stream.extras__string__fxa_id
      type: count_distinct
      label: Relay Phone DAUs
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_category} = \"phone\""
    - measure: relay_api_daus
      based_on: events_stream.extras__string__fxa_id
      type: count_distinct
      label: Relay API DAUs
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_category} = \"api\""
    - measure: relay_mask_labels_dau
      based_on: events_stream.extras__string__fxa_id
      type: count_distinct
      label: Relay Mask Labels DAU
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_category} = \"email_mask\""
    - category: table_calculation
      expression: mean(offset_list(${unique_users},0,14))
      label: 14-day Average Unique Users
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: day_average_unique_users
      _type_hint: number
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    series_colors:
      unique_users: "#d4cac2"
    listen:
      Submission Date: events_stream.submission_date
    row: 3
    col: 0
    width: 24
    height: 12

  # ===== EMAIL STATS SECTION =====

  - name: email_stats_header
    type: text
    title_text: ''
    body_text: |
      <div style="border-bottom: solid 1px #4285F4; padding: 8px 0;">
        <h2 style="color: #4285F4; margin: 0;">Email Stats</h2>
      </div>
    row: 15
    col: 0
    width: 24
    height: 2

  - title: Emails Forwarded
    name: Emails Forwarded
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count,
      unique_users, by_premium_users, by_free_users]
    filters:
      events_stream.event_category: email
      events_stream.event_name: forwarded
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: unique_users
      based_on: events_stream.extras__string__fxa_id
      type: count_distinct
      label: Unique Users
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - measure: by_premium_users
      based_on: events_stream.event_count
      label: By Premium Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} != \"free\""
    - measure: by_free_users
      based_on: events_stream.event_count
      label: By Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} = \"free\""
    - category: table_calculation
      expression: mean(offset_list(${events_stream.event_count},0,7))
      label: Emails Forwarded
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: emails_forwarded
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${by_premium_users},0,7))
      label: Emails Forwarded by Premium Users
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: emails_forwarded_by_premium_users
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${by_free_users},0,7))
      label: Emails Forwarded by Free Users
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: emails_forwarded_by_free_users
      _type_hint: number
    hidden_fields: [events_stream.event_count, unique_users, by_premium_users,
      by_free_users]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average"
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    series_colors:
      emails_forwarded: "#B977A9"
      emails_forwarded_by_premium_users: "#4A80BC"
      emails_forwarded_by_free_users: "#7bc739"
    listen:
      Submission Date: events_stream.submission_date
    row: 17
    col: 0
    width: 8
    height: 9

  - title: Emails Blocked
    name: Emails Blocked
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count,
      unique_users, emails_blocked_by_premium_users, emails_blocked_by_free_users]
    filters:
      events_stream.event_category: email
      events_stream.event_name: blocked
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: unique_users
      based_on: events_stream.extras__string__fxa_id
      type: count_distinct
      label: Unique Users
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - measure: emails_blocked_by_premium_users
      based_on: events_stream.event_count
      label: Emails Blocked by Premium Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} != \"free\""
    - measure: emails_blocked_by_free_users
      based_on: events_stream.event_count
      label: Emails Blocked by Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} = \"free\""
    - category: table_calculation
      expression: mean(offset_list(${events_stream.event_count},0,7))
      label: Emails Blocked
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: emails_blocked
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${emails_blocked_by_premium_users},0,7))
      label: Emails Blocked by Premium Users
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: emails_blocked_by_premium_users_1
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${emails_blocked_by_free_users},0,7))
      label: Emails Blocked by Free Users
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: emails_blocked_by_free_users_1
      _type_hint: number
    hidden_fields: [events_stream.event_count, unique_users, emails_blocked_by_premium_users,
      emails_blocked_by_free_users]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average"
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    series_colors:
      emails_blocked: "#B977A9"
      emails_blocked_by_premium_users_1: "#4A80BC"
      emails_blocked_by_free_users_1: "#7bc739"
    listen:
      Submission Date: events_stream.submission_date
    row: 17
    col: 8
    width: 8
    height: 9

  - title: "% of Emails Blocked"
    name: "% of Emails Blocked"
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, forwarded_emails, blocked_emails,
      blocked_emails_by_premium_users, blocked_emails_by_free_users,
      forwarded_emails_by_premium_users, forwarded_emails_by_free_users]
    filters:
      events_stream.event_category: email
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: forwarded_emails
      based_on: events_stream.event_count
      label: Forwarded Emails
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_name} = \"forwarded\""
    - measure: blocked_emails
      based_on: events_stream.event_count
      label: Blocked Emails
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_name} = \"blocked\""
    - measure: blocked_emails_by_premium_users
      based_on: events_stream.event_count
      label: Blocked Emails by Premium Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_name} = \"blocked\" AND
        ${events_stream.extras__string__premium_status} != \"free\""
    - measure: blocked_emails_by_free_users
      based_on: events_stream.event_count
      label: Blocked Emails by Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_name} = \"blocked\" AND
        ${events_stream.extras__string__premium_status} = \"free\""
    - measure: forwarded_emails_by_premium_users
      based_on: events_stream.event_count
      label: Forwarded Emails by Premium Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_name} = \"forwarded\" AND
        ${events_stream.extras__string__premium_status} != \"free\""
    - measure: forwarded_emails_by_free_users
      based_on: events_stream.event_count
      label: Forwarded Emails by Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.event_name} = \"forwarded\" AND
        ${events_stream.extras__string__premium_status} = \"free\""
    - category: table_calculation
      expression: "${blocked_emails}/(${forwarded_emails}+${blocked_emails})"
      label: "% Blocked"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: average_blocked_age
      _type_hint: number
    - category: table_calculation
      expression: "${blocked_emails_by_free_users}/(${blocked_emails_by_free_users}+${forwarded_emails_by_free_users})"
      label: "% Blocked for Free Users"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: blocked_age_for_free_users
      _type_hint: number
    - category: table_calculation
      expression: "${blocked_emails_by_premium_users}/(${blocked_emails_by_premium_users}+${forwarded_emails_by_premium_users})"
      label: "% Blocked for Premium Users"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: blocked_age_for_premium_users
      _type_hint: number
    hidden_fields: [blocked_emails, forwarded_emails, forwarded_emails_by_free_users,
      forwarded_emails_by_premium_users, blocked_emails_by_free_users,
      blocked_emails_by_premium_users]
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    series_colors:
      average_blocked_age: "#B977A9"
      blocked_age_for_free_users: "#7bc739"
      blocked_age_for_premium_users: "#4A80BC"
    listen:
      Submission Date: events_stream.submission_date
    row: 17
    col: 16
    width: 8
    height: 9

  - title: "% of Masks Created with Websites"
    name: "% of Masks Created with Websites"
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, masks_with_websites,
      masks_without_websites]
    filters:
      events_stream.event_category: email_mask
      events_stream.event_name: created
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: masks_with_websites
      based_on: events_stream.event_count
      label: Masks with Websites
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__boolean__has_website}"
    - measure: masks_without_websites
      based_on: events_stream.event_count
      label: Masks without Websites
      _kind_hint: measure
      _type_hint: number
      filter_expression: "NOT ${events_stream.extras__boolean__has_website}"
    - category: table_calculation
      expression: "mean(offset_list(${masks_with_websites}/(${masks_with_websites}+${masks_without_websites}),0,7))"
      label: "% of Masks Created with Websites"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: of_masks_created_with_websites
      _type_hint: number
    hidden_fields: [masks_with_websites, masks_without_websites]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average"
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 26
    col: 0
    width: 8
    height: 9

  - title: "% of Emails Which Are Replies"
    name: "% of Emails Which Are Replies"
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count,
      emails_replied]
    filters:
      events_stream.event_category: email
      events_stream.extras__string__premium_status: "-free"
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: emails_replied
      based_on: events_stream.event_count
      label: Emails Replied
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__boolean__is_reply}"
    - category: table_calculation
      expression: "${emails_replied}/${events_stream.event_count}"
      label: "% of Emails That Are Replies"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: of_emails_that_are_replies
      _type_hint: number
    - category: table_calculation
      expression: "mean(offset_list(${of_emails_that_are_replies},0,7))"
      label: "% of Emails That Are Replies (7-day avg)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: of_emails_that_are_replies_1
      _type_hint: number
    hidden_fields: [events_stream.event_count, emails_replied,
      of_emails_that_are_replies]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average. Premium users only."
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 26
    col: 8
    width: 8
    height: 9

  - title: Emails Forwarded to Random vs Custom Masks
    name: Emails Forwarded to Random vs Custom Masks
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, to_random_masks, to_custom_masks]
    filters:
      events_stream.event_category: email
      events_stream.event_name: forwarded
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: to_random_masks
      based_on: events_stream.event_count
      label: To Random Masks
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__boolean__is_random_mask}"
    - measure: to_custom_masks
      based_on: events_stream.event_count
      label: To Custom Masks
      _kind_hint: measure
      _type_hint: number
      filter_expression: "NOT ${events_stream.extras__boolean__is_random_mask}"
    - category: table_calculation
      expression: mean(offset_list(${to_custom_masks},0,7))
      label: Emails Forwarded to Custom Masks
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: emails_forwarded_to_custom_masks
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${to_random_masks},0,7))
      label: Emails Forwarded to Random Masks
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: emails_forwarded_to_random_masks
      _type_hint: number
    hidden_fields: [to_random_masks, to_custom_masks]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average"
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 26
    col: 16
    width: 8
    height: 9

  - title: Emails Forwarded to Custom Masks
    name: Emails Forwarded to Custom Masks
    model: relay_backend
    explore: events_stream
    type: single_value
    fields: [to_custom_masks]
    filters:
      events_stream.event_category: email
      events_stream.event_name: forwarded
    dynamic_fields:
    - measure: to_custom_masks
      based_on: events_stream.event_count
      label: To Custom Masks
      _kind_hint: measure
      _type_hint: number
      filter_expression: "NOT ${events_stream.extras__boolean__is_random_mask}"
    note_state: collapsed
    note_display: hover
    note_text: "Only Premium users can receive them."
    show_view_names: false
    listen:
      Submission Date: events_stream.submission_date
    row: 35
    col: 0
    width: 4
    height: 5

  - title: Emails Forwarded to Premium Relay Customers
    name: Emails Forwarded to Premium Relay Customers
    model: relay_backend
    explore: events_stream
    type: single_value
    fields: [to_premium_relay_customers]
    filters:
      events_stream.event_category: email
      events_stream.event_name: forwarded
    dynamic_fields:
    - measure: to_premium_relay_customers
      based_on: events_stream.event_count
      label: To Premium Relay Customers
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} != \"free\""
    show_view_names: false
    listen:
      Submission Date: events_stream.submission_date
    row: 35
    col: 4
    width: 4
    height: 5

  - title: "Replies Sent by Relay Premium Email Users"
    name: "Replies Sent by Relay Premium Email Users"
    model: relay_backend
    explore: events_stream
    type: single_value
    fields: [emails_replied]
    filters:
      events_stream.event_category: email
      events_stream.extras__string__premium_status: "-free"
    dynamic_fields:
    - measure: emails_replied
      based_on: events_stream.event_count
      label: Emails Replied
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__boolean__is_reply}"
    show_view_names: false
    listen:
      Submission Date: events_stream.submission_date
    row: 35
    col: 8
    width: 4
    height: 5

  # ===== EMAIL MASKS STATS SECTION =====

  - name: email_masks_stats_header
    type: text
    title_text: ''
    body_text: |
      <div style="border-bottom: solid 1px #4285F4; padding: 8px 0;">
        <h2 style="color: #4285F4; margin: 0;">Email Masks Stats</h2>
      </div>
    row: 40
    col: 0
    width: 24
    height: 2

  - title: Email Masks Created
    name: Email Masks Created
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count,
      by_premium_users, by_free_users]
    filters:
      events_stream.event_category: email_mask
      events_stream.event_name: created
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: by_premium_users
      based_on: events_stream.event_count
      label: By Premium Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} != \"free\""
    - measure: by_free_users
      based_on: events_stream.event_count
      label: By Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} = \"free\""
    - category: table_calculation
      expression: mean(offset_list(${events_stream.event_count},0,7))
      label: Email Masks Created
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_created
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${by_premium_users},0,7))
      label: By Premium Users
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_created_by_premium_users
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${by_free_users},0,7))
      label: By Free Users
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_created_by_free_users
      _type_hint: number
    hidden_fields: [events_stream.event_count, by_premium_users, by_free_users]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average"
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    series_colors:
      email_masks_created: "#B977A9"
      email_masks_created_by_premium_users: "#4A80BC"
      email_masks_created_by_free_users: "#7bc739"
    listen:
      Submission Date: events_stream.submission_date
    row: 42
    col: 0
    width: 6
    height: 9

  - title: Email Masks Deleted
    name: Email Masks Deleted
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count,
      by_premium_users, by_free_users]
    filters:
      events_stream.event_category: email_mask
      events_stream.event_name: deleted
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: by_premium_users
      based_on: events_stream.event_count
      label: By Premium Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} != \"free\""
    - measure: by_free_users
      based_on: events_stream.event_count
      label: By Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} = \"free\""
    - category: table_calculation
      expression: mean(offset_list(${events_stream.event_count},0,7))
      label: Email Masks Deleted
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_deleted
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${by_premium_users},0,7))
      label: By Premium Users
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_deleted_by_premium_users
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${by_free_users},0,7))
      label: By Free Users
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_deleted_by_free_users
      _type_hint: number
    hidden_fields: [events_stream.event_count, by_premium_users, by_free_users]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average"
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    series_colors:
      email_masks_deleted: "#B977A9"
      email_masks_deleted_by_premium_users: "#4A80BC"
      email_masks_deleted_by_free_users: "#7bc739"
    listen:
      Submission Date: events_stream.submission_date
    row: 42
    col: 6
    width: 6
    height: 9

  - title: Email Masks Label Updated
    name: Email Masks Label Updated
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count,
      by_premium_users, by_free_users]
    filters:
      events_stream.event_category: email_mask
      events_stream.event_name: label_updated
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: by_premium_users
      based_on: events_stream.event_count
      label: By Premium Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} != \"free\""
    - measure: by_free_users
      based_on: events_stream.event_count
      label: By Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} = \"free\""
    - category: table_calculation
      expression: mean(offset_list(${events_stream.event_count},0,7))
      label: Email Masks Label Updated
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_label_updated
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${by_premium_users},0,7))
      label: By Premium Users
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_label_updated_by_premium_users
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${by_free_users},0,7))
      label: By Free Users
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: email_masks_label_updated_by_free_users
      _type_hint: number
    hidden_fields: [events_stream.event_count, by_premium_users, by_free_users]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average"
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    series_colors:
      email_masks_label_updated: "#B977A9"
      email_masks_label_updated_by_premium_users: "#4A80BC"
      email_masks_label_updated_by_free_users: "#7bc739"
    listen:
      Submission Date: events_stream.submission_date
    row: 42
    col: 12
    width: 6
    height: 9

  - title: Non-Random Mask Usage
    name: Non-Random Mask Usage
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, email_forwarded_to_a_random_mask,
      email_forwarded_to_a_non_random_mask]
    filters:
      events_stream.event_category: email
      events_stream.event_name: forwarded
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: email_forwarded_to_a_random_mask
      based_on: events_stream.event_count
      label: Email Forwarded to a Random Mask
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__boolean__is_random_mask}"
    - measure: email_forwarded_to_a_non_random_mask
      based_on: events_stream.event_count
      label: Email Forwarded to a Non-Random Mask
      _kind_hint: measure
      _type_hint: number
      filter_expression: "NOT ${events_stream.extras__boolean__is_random_mask}"
    - category: table_calculation
      expression: "mean(offset_list(${email_forwarded_to_a_non_random_mask}/(${email_forwarded_to_a_random_mask}+${email_forwarded_to_a_non_random_mask}),0,7))"
      label: "% of Emails to Non-Random Masks"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: age_of_emails_to_non_random_masks_1
      _type_hint: number
    hidden_fields: [email_forwarded_to_a_random_mask, email_forwarded_to_a_non_random_mask]
    note_state: collapsed
    note_display: hover
    note_text: "7-day moving average. Not filtered to Premium only."
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 42
    col: 18
    width: 6
    height: 9

  # ===== PHONE STATS SECTION =====

  - name: phone_stats_header
    type: text
    title_text: ''
    body_text: |
      <div style="border-bottom: solid 1px #4285F4; padding: 8px 0;">
        <h2 style="color: #4285F4; margin: 0;">Phone Stats</h2>
      </div>
    row: 51
    col: 0
    width: 24
    height: 2

  - title: Phone Calls Received
    name: Phone Calls Received
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count]
    filters:
      events_stream.event_category: phone
      events_stream.event_name: call_received
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${events_stream.event_count},0,7))
      label: 7-day Rolling Average Phone Calls Received
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: day_rolling_average_phone_calls_received
      _type_hint: number
    hidden_fields: [events_stream.event_count]
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 53
    col: 0
    width: 8
    height: 9

  - title: Texts Received
    name: Texts Received
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count]
    filters:
      events_stream.event_category: phone
      events_stream.event_name: text_received
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${events_stream.event_count},0,7))
      label: 7-day Rolling Average Texts Received
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: day_rolling_average_texts_received
      _type_hint: number
    hidden_fields: [events_stream.event_count]
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 53
    col: 8
    width: 8
    height: 9

  - title: Texts vs Calls
    name: Texts vs Calls
    model: relay_backend
    explore: events_stream
    type: looker_pie
    fields: [events_stream.event_count, events_stream.event_name]
    filters:
      events_stream.event_category: phone
    sorts: [events_stream.event_name]
    show_view_names: false
    show_value_labels: true
    inner_radius: 60
    listen:
      Submission Date: events_stream.submission_date
    row: 53
    col: 16
    width: 8
    height: 9

  # ===== API STATS SECTION =====

  - name: api_stats_header
    type: text
    title_text: ''
    body_text: |
      <div style="border-bottom: solid 1px #4285F4; padding: 8px 0;">
        <h2 style="color: #4285F4; margin: 0;">API Stats</h2>
      </div>
    row: 62
    col: 0
    width: 24
    height: 2

  - title: API Calls
    name: API Calls
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count]
    filters:
      events_stream.event_category: api
      events_stream.event_name: accessed
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${events_stream.event_count},0,7))
      label: 7-day Rolling Average API Calls
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: day_rolling_average_api_calls
      _type_hint: number
    hidden_fields: [events_stream.event_count]
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 64
    col: 0
    width: 6
    height: 9

  - title: API Calls per User
    name: API Calls per User
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count,
      unique_users]
    filters:
      events_stream.event_category: api
      events_stream.event_name: accessed
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: unique_users
      based_on: events_stream.extras__string__fxa_id
      type: count_distinct
      label: Unique Users
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${events_stream.event_count}/${unique_users}"
      label: Calls per User
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: calls_per_user
      _type_hint: number
    hidden_fields: [events_stream.event_count, unique_users]
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 64
    col: 6
    width: 6
    height: 9

  - title: API Usage per OS
    name: API Usage per OS
    model: relay_backend
    explore: events_stream
    type: looker_bar
    fields: [events_stream.event_count, events_stream.metadata__user_agent__os]
    filters:
      events_stream.event_category: api
    sorts: [events_stream.event_count desc]
    note_state: collapsed
    note_display: hover
    note_text: "Website, Firefox integration, extensions, and Bitwarden integration"
    show_view_names: false
    show_null_points: true
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    listen:
      Submission Date: events_stream.submission_date
    row: 64
    col: 12
    width: 6
    height: 9

  - title: API Methods Used
    name: API Methods Used
    model: relay_backend
    explore: events_stream
    type: looker_bar
    fields: [events_stream.extras__string__method, events_stream.event_count]
    filters:
      events_stream.event_category: api
      events_stream.event_name: accessed
    sorts: [events_stream.event_count desc]
    show_view_names: false
    show_null_points: true
    show_value_labels: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    listen:
      Submission Date: events_stream.submission_date
    row: 64
    col: 18
    width: 6
    height: 9

  # ===== OTHER STATS SECTION =====

  - name: other_stats_header
    type: text
    title_text: ''
    body_text: |
      <div style="border-bottom: solid 1px #4285F4; padding: 8px 0;">
        <h2 style="color: #4285F4; margin: 0;">Other Stats</h2>
      </div>
    row: 73
    col: 0
    width: 24
    height: 2

  - title: DAUs and Extension Usage
    name: DAUs and Extension Usage
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_count,
      events_stream.extras__boolean__has_extension]
    pivots: [events_stream.extras__boolean__has_extension]
    filters:
      events_stream.event_category: 'email,email_mask'
    sorts: [events_stream.submission_date desc]
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 75
    col: 0
    width: 8
    height: 9

  - title: Emails Forwarded by Subscription Type
    name: Emails Forwarded by Subscription Type
    model: relay_backend
    explore: events_stream
    type: looker_grid
    fields: [events_stream.submission_date, by_premium_users, by_free_users]
    filters:
      events_stream.event_category: email
      events_stream.event_name: forwarded
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: by_premium_users
      based_on: events_stream.event_count
      label: By Premium Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} != \"free\""
    - measure: by_free_users
      based_on: events_stream.event_count
      label: By Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} = \"free\""
    - category: table_calculation
      expression: "${by_free_users}/(${by_free_users}+${by_premium_users})"
      label: "% Free Users"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: age_free_users
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    listen:
      Submission Date: events_stream.submission_date
    row: 75
    col: 8
    width: 7
    height: 9

  - title: Email Masks Created and Deleted by Free Users
    name: Email Masks Created and Deleted by Free Users
    model: relay_backend
    explore: events_stream
    type: looker_line
    fields: [events_stream.submission_date, events_stream.event_name,
      masks_by_free_users]
    pivots: [events_stream.event_name]
    filters:
      events_stream.event_category: email_mask
      events_stream.event_name: deleted,created
    sorts: [events_stream.submission_date desc]
    dynamic_fields:
    - measure: masks_by_free_users
      based_on: events_stream.event_count
      label: Masks by Free Users
      _kind_hint: measure
      _type_hint: number
      filter_expression: "${events_stream.extras__string__premium_status} = \"free\""
    show_view_names: false
    show_null_points: true
    interpolation: monotone
    x_axis_gridlines: false
    y_axis_gridlines: true
    x_axis_zoom: true
    y_axis_zoom: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    listen:
      Submission Date: events_stream.submission_date
    row: 84
    col: 0
    width: 15
    height: 12
