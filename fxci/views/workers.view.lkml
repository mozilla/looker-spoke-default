view: workers {
  derived_table: {
    sql:
      WITH metrics AS (
        SELECT
          project,
          zone,
          instance_id,
          SUM(uptime) AS uptime
        FROM `moz-fx-data-shared-prod.fxci.worker_metrics`
        WHERE submission_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
        GROUP BY
          project,
          zone,
          instance_id
      ),
      costs AS (
        SELECT
          project,
          zone,
          instance_id,
          SUM(total_cost) AS total_cost
        FROM `moz-fx-data-shared-prod.fxci.worker_costs`
        WHERE usage_start_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
        GROUP BY
          project,
          zone,
          instance_id
      )
      SELECT
        metrics.project AS project,
        metrics.zone AS zone,
        metrics.instance_id AS instance_id,
        metrics.uptime AS uptime,
        costs.total_cost AS cost
      FROM
        metrics
      INNER JOIN
        costs
        ON metrics.project = costs.project
        AND metrics.zone = costs.zone
        AND metrics.instance_id = costs.instance_id
      ;;
    persist_for:  "24 hours"
  }

  dimension: key {
    primary_key: yes
    sql: CONCAT(${TABLE}.project, '-', ${TABLE}.zone, '-', ${TABLE}.instance_id) ;;
  }

  dimension: project {
    type:  string
    sql:  ${TABLE}.project ;;
  }

  dimension: zone {
    type:  string
    sql:  ${TABLE}.zone ;;
  }

  dimension: instance_id {
    type:  string
    sql:  ${TABLE}.instance_id ;;
  }

  dimension: uptime {
    type: number
    sql:  ${TABLE}.uptime ;;
  }

  dimension: cost {
    type: number
    sql:  ${TABLE}.cost ;;
  }
}
