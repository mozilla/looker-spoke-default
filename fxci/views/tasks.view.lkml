include: "//looker-hub/fxci/views/tasks_base.view.lkml"

view: tasks {
  extends: [tasks_base]

  parameter: group_by_tag_field {
    type: string
    allowed_value: { label: "None" value: "none" }
    allowed_value: { label: "Label" value: "label" }
    allowed_value: { label: "Kind" value: "kind" }
    allowed_value: { label: "Project" value: "project" }
    allowed_value: { label: "Trust Domain" value: "trust_domain" }
    default_value: "none"
  }

  dimension: group_by_tag {
    type: string
    sql:
    CASE
      WHEN {% parameter group_by_tag_field %}  = 'label' THEN ${tags__label}
      WHEN {% parameter group_by_tag_field %}  = 'kind' THEN ${tags__kind}
      WHEN {% parameter group_by_tag_field %}  = 'project' THEN ${tags__project}
      WHEN {% parameter group_by_tag_field %}  = 'trust_domain' THEN ${tags__trust_domain}
      ELSE "All Tasks"
    END
  ;;
  }
}
