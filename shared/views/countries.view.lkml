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
  }

  dimension: tier {
    type: string
    sql:
      CASE
      WHEN
        ${TABLE}.code IN ('US', 'CA', 'DE', 'FR', 'GB') THEN 'tier-1'
      ELSE 'non-tier-1'
      END ;;
    description: "Country tier"
  }
}
