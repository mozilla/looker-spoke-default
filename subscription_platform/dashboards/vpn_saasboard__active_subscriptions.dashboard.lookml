- dashboard: vpn_saasboard__active_subscriptions
  title: VPN SaaSboard - Active Subscriptions
  extends: [saasboard__active_subscriptions]
  filters:
  - name: Service ID
    default_value: VPN
    ui_config:
      options:
      - VPN
  elements:
  - name: nav
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px;">

      <nav style="font-size: 20px;">

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px; border: 1px solid white; font-weight: bold; text-decoration: underline;">
          Active Subscriptions
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::vpn_saasboard__subscriptions_growth" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Subscriptions Growth
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::vpn_saasboard__retention" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Retention
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::vpn_saasboard__churn" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Churn
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::vpn_saasboard__revenue" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Revenue
        </a>

        <!--<a href="" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Docs
        </a>-->

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
