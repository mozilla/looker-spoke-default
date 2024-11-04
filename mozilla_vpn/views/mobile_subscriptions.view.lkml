

include: "/mozilla_vpn/views/subscriptions.view.lkml"
view: mobile_subscriptions {
  extends: [subscriptions]
  fields_hidden_by_default: yes
  dimension: provider{
    hidden: no
  }
  dimension_group: trial_start {
    hidden: no
  }
  dimension_group: trial_end {
    hidden: no
  }

  dimension_group: subscription_start {
    hidden: no
  }

  dimension:  country_name{
    sql: CASE WHEN ${TABLE}.country_name = "Null" THEN NULL ELSE ${TABLE}.country_name END;;
    hidden: no
  }

  dimension: plan_type {
    sql:  REGEXP_EXTRACT(${TABLE}.pricing_plan,r'[1-6]-[a-z]+');;
    hidden: no
  }
  dimension: plan_currency {
    hidden:  no
  }
  dimension: pricing_plan {
    hidden:  no
  }

  dimension: plan_id {
    hidden: no
  }

  measure: non_trial_sub_count{
    sql: CASE WHEN (${TABLE}.trial_start IS NULL AND ${TABLE}.subscription_start_date IS NOT NULL)
      THEN 1 ELSE NULL END ;;
    type:  sum
    hidden: no
  }
  measure: trial_count {
    description: "Counting accounts with a trial start date"
    sql: CASE WHEN ${TABLE}.trial_start IS NOT NULL THEN 1 ELSE NULL END;;
    type: sum
    hidden: no
  }
  measure: converted_sub_count {
    description: "Counting accounts with a trial start date and a subscription start date"
    sql: CASE WHEN (${TABLE}.trial_start IS NOT NULL
          AND ${TABLE}.subscription_start_date IS NOT NULL
          --AND ${TABLE}.plan_interval = 'year' ) #there are disscussions on categorizing non trial subs after trial experience
          )
          THEN 1 ELSE NULL  END;;
    type: sum
    hidden:  no
  }
  measure: sub_count {
    description: "Counting accounts with a subscription start date"
    sql: CASE WHEN ( ${TABLE}.subscription_start_date IS NOT NULL
          )
          THEN 1 ELSE NULL  END;;
    type: sum
    hidden:  no
  }

  measure: Canceled_after_converted_count {
    description: "Counting accounts with a trial converted subscription that is canceled within 45 days from its subscription start date "
    sql: CASE WHEN (${TABLE}.trial_start IS NOT NULL
          AND ${TABLE}.subscription_start_date IS NOT NULL
          AND ${TABLE}.plan_interval ='year'
          AND ${TABLE}.ended_at IS NOT NULL
          AND DATE_DIFF(DATE(ended_at), DATE(subscription_start_date), DAY) <= 45) THEN 1 ELSE NULL END  ;;
    type: sum
    hidden: no
  }
}
