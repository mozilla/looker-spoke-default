include: "//looker-hub/bigeye/views/users.view.lkml"

view: +users {
    measure: distinct_user_count {
        type: count_distinct
        sql: ${user_id} ;;
        description: "Count of distinct users"
    }
}
