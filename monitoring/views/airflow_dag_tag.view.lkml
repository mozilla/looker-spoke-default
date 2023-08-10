include: "//looker-hub/monitoring/views/dag_tag.view.lkml"

# If necessary, uncomment the line below to include explore_source.
# include: "dag_run.explore.lkml"

view: dag_tag_2 {
  derived_table: {
    explore_source: dag_tag {
      column: dag_id {}
      column: tags {}
    }
  }
  dimension: dag_id {
    hidden: yes
    description: "Airflow DAG id"
  }
  dimension: tags {
    hidden: yes
    description: ""
    type: number
  }
  dimension: impact {
    type: string
    sql:
      case
        when "impact/tier_1" in unnest(${tags}) then "tier 1"
        when "impact/tier_2" in unnest(${tags}) then "tier 2"
        when "impact/tier_3" in unnest(${tags}) then "tier 3"
        else "unspecified"
      end
    ;;
  }

  dimension: repo {
    type: string
    sql:
      case
        when "repo/bigquery-etl" in unnest(tags) then "bigquery-etl"
        when "repo/telemetry-airflow" in unnest(tags) then "telemetry-airflow"
        when "repo/private-bigquery-etl" in unnest(tags) then "private-bigquery-etl"
        else "not specified"
      end
    ;;
  }

  dimension: triage {
    type: string
    sql:
      case
        when "triage/no_triage" in unnest(tags) then "no triage"
        when "triage/record_only" in unnest(tags) then "record only"
        else "not specified"
      end
    ;;
  }
  measure: count {
    type: count
  }
}

view: +dag_tag {
  dimension: dag_id {
    hidden: yes
  }
  dimension: tag_name {
    hidden: yes
  }
  measure: tags {
    type: string
    sql: ARRAY_AGG(DISTINCT ${tag_name}) ;;
  }
}

view: airflow_dag_tag {
  derived_table: {
    sql:
      SELECT
        dag_id,
        ARRAY_AGG(DISTINCT tag_name) AS tags
      FROM `mozdata.monitoring.airflow_dag_tag`
      GROUP BY dag_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dag_id {
    hidden: yes
    type: string
    sql: ${TABLE}.dag_id ;;
  }

  dimension: tags {
    hidden: yes
    type: string
    sql: ${TABLE}.tags ;;
  }

  set: detail {
    fields: [
      dag_id,
      tags
    ]
  }

  dimension: impact {
    type: string
    sql:
      case
        when "impact/tier_1" in unnest(${tags}) then "tier 1"
        when "impact/tier_2" in unnest(${tags}) then "tier 2"
        when "impact/tier_3" in unnest(${tags}) then "tier 3"
        else "no tag"
      end
    ;;
  }

  dimension: repo {
    type: string
    sql:
      case
        when "repo/bigquery-etl" in unnest(tags) then "bigquery-etl"
        when "repo/telemetry-airflow" in unnest(tags) then "telemetry-airflow"
        when "repo/private-bigquery-etl" in unnest(tags) then "private-bigquery-etl"
        else "no tag"
      end
    ;;
  }

  dimension: triage {
    type: string
    sql:
      case
        when "triage/no_triage" in unnest(tags) then "no triage"
        when "triage/record_only" in unnest(tags) then "record only"
        else "no tag"
      end
    ;;
  }
}
