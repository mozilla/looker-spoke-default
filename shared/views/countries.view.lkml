view: countries {
  sql_table_name: `mozdata.static.country_codes_v1` ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    map_layer_name: countries
    description: "Official country name per ISO 3166"
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
    map_layer_name: countries
    description: "ISO 3166 alpha-2 country code"
    primary_key: yes
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region_name ;;
    description: "The UNSD region name."
  }

  dimension: subregion {
    type: string
    sql: ${TABLE}.subregion_name ;;
    description: "The UNSD sub-region name."
  }

  dimension: intermediate_region {
    type: string
    sql: ${TABLE}.intermediate_region_name ;;
    description: "The UNSD intermediate region name."
  }

  dimension: tier {
    type: string
    sql:
      CASE
      WHEN
        ${TABLE}.code IN ('US', 'CA', 'DE', 'FR', 'GB') THEN 'Tier 1'
      ELSE 'Other'
      END ;;

    description: "Country tier, as used in relation to browser KPIs. The specific meaning of Tier 1 may vary across different products."
  }
}
