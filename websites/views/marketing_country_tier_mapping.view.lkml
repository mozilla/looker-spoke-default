view: marketing_country_tier_mapping {
  sql_table_name: `moz-fx-data-shared-prod.static.marketing_country_tier_mapping_v1` ;;

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
    primary_key: yes
    hidden: yes
  }

  dimension: tier {
    type: string
    sql: ${TABLE}.tier ;;
  }

    dimension: has_web_cookie_consent {
      type: yesno
      sql: ${TABLE}.has_web_cookie_consent ;;
      description: "Whether the country requires web cookie consent"
    }


}
