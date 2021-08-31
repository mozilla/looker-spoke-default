view: countries {
  sql_table_name: `mozdata.static.country_codes_v1` ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "Official country name per ISO 3166"
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
    description: "ISO 3166 alpha-2 country code"
    primary_key: yes
  }

  dimension: tier {
    type: string
    sql:
      CASE
      WHEN
        ${TABLE}.code IN ('US', 'CA', 'DE', 'FR', 'GB') THEN 'Tier 1'
      ELSE 'Other'
      END ;;
    description: "Country tier, as used in relation to browser KPIs. The specific meaning of "Tier 1" may vary across different products."
  }
}
