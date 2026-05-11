- dashboard: relay_mask_firefox_retention
  title: Firefox Retention by Relay Mask Usage
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Firefox Desktop 4th-week retention segmented by Relay mask count. Correlation only — not causation."

  filters:
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: 56 days ago for 28 days
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
    model: relay_backend
    explore: relay_mask_firefox_retention
    listens_to_filters: []
    field: relay_mask_firefox_retention.submission_date

  - name: Premium Status
    title: Premium Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: relay_backend
    explore: relay_mask_firefox_retention
    listens_to_filters: []
    field: relay_mask_firefox_retention.relay_premium_status

  elements:

  # ===== HEADER / CAVEAT =====

  - name: caveat_header
    type: text
    title_text: ''
    body_text: |
      <div style="border-bottom: solid 1px #4285F4; padding: 8px 0;">
        <h2 style="color: #4285F4; margin: 0;">Firefox Retention by Relay Mask Usage</h2>
      </div>
      <p><strong>Note:</strong> This dashboard shows <em>correlation</em> between Relay mask usage
      and Firefox retention. It does <strong>not</strong> demonstrate causation. A controlled
      experiment by Mozilla's cross-product analytics team found no conclusive causal
      effect. Users who create more masks are likely more engaged Firefox users to begin with.</p>
      <p><strong>Related resources:</strong></p>
      <ul>
        <li><a href="https://mozilla.cloud.looker.com/dashboards/1978">Relay Product Stats Dashboard</a></li>
        <li><a href="https://mozilla.cloud.looker.com/dashboards/1777">Firefox Desktop OKR Dashboard (Retention)</a></li>
        <li><a href="https://mozilla.cloud.looker.com/dashboards/1178">DAU KPI Dashboard</a></li>
        <li><a href="https://mozilla-hub.atlassian.net/wiki/spaces/DATA/pages/842629837">Querying Firefox Retention and Engagement (Confluence)</a></li>
        <li><a href="https://mozilla-hub.atlassian.net/wiki/spaces/DATA/pages/314704478">Daily Active Users (DAU) Metric (Confluence)</a></li>
        <li><a href="https://mozilla-hub.atlassian.net/wiki/spaces/DATA/pages/814481685">Firefox New Profiles, Retention and Engagement (Confluence)</a></li>
        <li><a href="https://mozilla-hub.atlassian.net/wiki/spaces/PXI/pages/1608843281">Cross-Product Firefox Analytics (Confluence)</a></li>
        <li><a href="https://mozilla-hub.atlassian.net/browse/MPP-4588">MPP-4588: This ticket</a></li>
      </ul>
    row: 0
    col: 0
    width: 24
    height: 5

  # ===== RETENTION BY MASK TIER =====

  - title: Retention Rate by Mask Count Tier
    name: retention_rate_by_mask_tier
    model: relay_backend
    explore: relay_mask_firefox_retention
    type: looker_column
    fields: [relay_mask_firefox_retention.mask_count_tier, relay_mask_firefox_retention.retention_rate]
    sorts: [relay_mask_firefox_retention.mask_count_tier]
    listen:
      Submission Date: relay_mask_firefox_retention.submission_date
      Premium Status: relay_mask_firefox_retention.relay_premium_status
    row: 5
    col: 0
    width: 12
    height: 12
    series_colors:
      relay_mask_firefox_retention.retention_rate: "#4285F4"
    y_axes:
    - label: Retention Rate
      orientation: left
      series:
      - id: relay_mask_firefox_retention.retention_rate
        name: Retention Rate
      showLabels: true
      showValues: true
      valueFormat: "#.0%"

  - title: Sample Size by Mask Count Tier
    name: sample_size_by_mask_tier
    model: relay_backend
    explore: relay_mask_firefox_retention
    type: looker_column
    fields: [relay_mask_firefox_retention.mask_count_tier, relay_mask_firefox_retention.total_clients]
    sorts: [relay_mask_firefox_retention.mask_count_tier]
    listen:
      Submission Date: relay_mask_firefox_retention.submission_date
      Premium Status: relay_mask_firefox_retention.relay_premium_status
    row: 5
    col: 12
    width: 12
    height: 12
    series_colors:
      relay_mask_firefox_retention.total_clients: "#EA8600"
    y_axes:
    - label: Active Clients
      orientation: left
      series:
      - id: relay_mask_firefox_retention.total_clients
        name: Total Clients
      showLabels: true
      showValues: true

  # ===== RETENTION OVER TIME =====

  - title: Retention Rate Over Time by Relay Usage
    name: retention_over_time_by_relay
    model: relay_backend
    explore: relay_mask_firefox_retention
    type: looker_line
    fields: [relay_mask_firefox_retention.metric_date_date, relay_mask_firefox_retention.has_relay_account,
      relay_mask_firefox_retention.retention_rate]
    pivots: [relay_mask_firefox_retention.has_relay_account]
    fill_fields: [relay_mask_firefox_retention.metric_date_date]
    sorts: [relay_mask_firefox_retention.metric_date_date]
    listen:
      Submission Date: relay_mask_firefox_retention.submission_date
      Premium Status: relay_mask_firefox_retention.relay_premium_status
    row: 17
    col: 0
    width: 12
    height: 12
    y_axes:
    - label: Retention Rate
      orientation: left
      series:
      - id: 'Yes - relay_mask_firefox_retention.retention_rate'
        name: Has Relay Account
      - id: 'No - relay_mask_firefox_retention.retention_rate'
        name: No Relay Account
      showLabels: true
      showValues: true
      valueFormat: "#.0%"

  - title: Retention Rate Over Time by Mask Tier
    name: retention_over_time_by_mask_tier
    model: relay_backend
    explore: relay_mask_firefox_retention
    type: looker_line
    fields: [relay_mask_firefox_retention.metric_date_date, relay_mask_firefox_retention.mask_count_tier,
      relay_mask_firefox_retention.retention_rate]
    pivots: [relay_mask_firefox_retention.mask_count_tier]
    fill_fields: [relay_mask_firefox_retention.metric_date_date]
    sorts: [relay_mask_firefox_retention.metric_date_date]
    listen:
      Submission Date: relay_mask_firefox_retention.submission_date
      Premium Status: relay_mask_firefox_retention.relay_premium_status
    row: 17
    col: 12
    width: 12
    height: 12
    y_axes:
    - label: Retention Rate
      orientation: left
      series:
      - id: relay_mask_firefox_retention.retention_rate
        name: Retention Rate
      showLabels: true
      showValues: true
      valueFormat: "#.0%"

  # ===== SUMMARY TABLE =====

  - title: Summary Table
    name: summary_table
    model: relay_backend
    explore: relay_mask_firefox_retention
    type: looker_grid
    fields: [relay_mask_firefox_retention.mask_count_tier, relay_mask_firefox_retention.total_clients,
      relay_mask_firefox_retention.retained_clients, relay_mask_firefox_retention.retention_rate]
    sorts: [relay_mask_firefox_retention.mask_count_tier]
    listen:
      Submission Date: relay_mask_firefox_retention.submission_date
      Premium Status: relay_mask_firefox_retention.relay_premium_status
    row: 29
    col: 0
    width: 24
    height: 6
