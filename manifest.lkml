project_name: "spoke-default"

local_dependency: {
  project: "looker-hub"
}

# LAMS
# rule: no_view_wildcards {
#  description: "Please don't use wildcard view include (e.g. include: 'views/*') to avoid increasing LookML verification time. Explicitly list views to be included."
#   match: "$.file.*..include"
#   expr_rule:
#     ($let includes ($if ($is-list match) match ($list match)))
#     ($not ($any ...($map includes (-> (include) ($boolean ($match "views/.*\\*" include))))))
#   ;;
# }
