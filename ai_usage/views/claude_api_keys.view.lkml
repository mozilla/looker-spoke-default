view: claude_api_keys {
  sql_table_name: `moz-fx-data-shared-prod.ai_usage_derived.claude_api_keys_v1` ;;

  dimension: api_key_id {
    primary_key: yes
    description: "Unique identifier for the API key"
    type: string
    sql: ${TABLE}.api_key_id ;;
  }

  dimension: api_key_name {
    description: "Human-readable name of the API key"
    type: string
    sql: ${TABLE}.api_key_name ;;
  }

  dimension: api_key_status {
    description: "Status of the API key (active, inactive, archived)"
    type: string
    sql: ${TABLE}.api_key_status ;;
  }

  dimension: created_by_user_id {
    description: "ID of the user who created the API key"
    type: string
    sql: ${TABLE}.created_by_user_id ;;
  }

  dimension: user_email {
    description: "Email address of the user who created the API key"
    type: string
    sql: ${TABLE}.user_email ;;
  }

  dimension: user_name {
    description: "Name of the user who created the API key"
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: workspace_id {
    description: "ID of the workspace the API key belongs to"
    type: string
    sql: ${TABLE}.workspace_id ;;
  }

}
