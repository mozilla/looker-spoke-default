include: "//looker-hub/shared/views/countries.view"

view: +countries {

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

  dimension: name {
    sql: ${TABLE}.name ;;
    type: string
    description: "Official country name per ISO 3166"
    map_layer_name: countries
  }

  dimension: code {
    sql: ${TABLE}.code ;;
    type: string
    description: "ISO 3166 alpha-2 country code"
    map_layer_name: countries
  }


}
