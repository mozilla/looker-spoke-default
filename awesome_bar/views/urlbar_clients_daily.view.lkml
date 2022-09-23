include: "//looker-hub/awesome_bar/views/*"

view: +urlbar_clients_daily {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${TABLE}.client_id, ${TABLE}.submission_date) ;;
  }
}

view: +urlbar_clients_daily__count_picked_by_position {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${urlbar_clients_daily.client_id}, ${urlbar_clients_daily.submission_date}) ;;
  }
}

view: +urlbar_clients_daily__count_picked_by_type {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${urlbar_clients_daily.client_id}, ${urlbar_clients_daily.submission_date}) ;;
  }
}

view: +urlbar_clients_daily__experiments {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${urlbar_clients_daily.client_id}, ${urlbar_clients_daily.submission_date}) ;;
  }
}

view: +urlbar_clients_daily__urlbar_picked_by_type_by_position {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${urlbar_clients_daily.client_id}, ${urlbar_clients_daily.submission_date}) ;;
  }
}

view: +urlbar_clients_daily__urlbar_picked_by_type_by_position__position {
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${urlbar_clients_daily.client_id}, ${urlbar_clients_daily.submission_date}) ;;
  }
}
