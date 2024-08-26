project_name: "spoke-default"

local_dependency: {
  project: "looker-hub"
}

# LAMS
# rule: no_view_wildcards {
#  description: "Prohibit wildcard view include to avoid increasing LookML verification time"
#  match: "$.file.*..include.*"
#  expr_rule:  ($not ($boolean ($match "views/.*\\*" ::match))) ;;
# }
