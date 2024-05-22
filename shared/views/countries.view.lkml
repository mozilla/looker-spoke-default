include: "//looker-hub/shared/views/countries.view"

view: +countries {

  # Almost unbelievelably, Looker throws a validation error when a suggest_dimension
  # references the field itself, _even_ if coming from a different view.
  # For that reason, we had to add the hidden "_suggest_*" fields, so Looker
  # doesn't think the field is referencing itself.

  dimension: tier {
    type: string
    sql:
      CASE
      WHEN
        ${TABLE}.code IN ('US', 'CA', 'DE', 'FR', 'GB') THEN 'Tier 1'
      ELSE 'Other'
      END ;;

    description: "Country tier, as used in relation to browser KPIs. The specific meaning of Tier 1 may vary across different products."
    suggestable: yes
    suggest_explore: countries_suggest_explore
    suggest_dimension: countries_suggest_explore._suggest_tier
  }
  
  dimension: _suggest_tier {
    hidden: yes
    sql: ${tier} ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
    type: string
    description: "Official country name per ISO 3166"
    map_layer_name: countries
    suggestable: yes
    suggest_explore: countries_suggest_explore
    suggest_dimension: countries_suggest_explore._suggest_name
  }
  
  dimension: _suggest_name {
    hidden: yes
    sql: ${name} ;;
  }

  dimension: code {
    sql: ${TABLE}.code ;;
    type: string
    description: "ISO 3166 alpha-2 country code"
    map_layer_name: countries
    suggestable: yes
    suggest_explore: countries_suggest_explore
    suggest_dimension: countries_suggest_explore._suggest_code
  }
  
  dimension: _suggest_code {
    hidden: yes
    sql: ${code} ;;
  }
}

explore: countries_suggest_explore {
  from: countries
}
