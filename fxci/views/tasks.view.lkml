include: "//looker-hub/fxci/views/tasks_base.view.lkml"

view: tasks {
  extends: [tasks_base]
}

view: tasks__tags {
  extends: [tasks_base__tags]
}
