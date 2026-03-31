include: "../views/claude_usage.view.lkml"
include: "../views/claude_api_keys.view.lkml"

explore: claude_usage {
  label: "Claude Usage"
  description: "Anthropic Claude token usage by model and API key, joined with key owner details."

  join: claude_api_keys {
    type: left_outer
    relationship: many_to_one
    sql_on: ${claude_usage.api_key_id} = ${claude_api_keys.api_key_id} ;;
  }
}
