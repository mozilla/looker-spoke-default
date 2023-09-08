include: "//looker-hub/monitoring/views/airflow_dag_tag.view.lkml"

view: +airflow_dag_tag {

  dimension: dag_id {
    type: string
    description: "Airflow DAG id"
    link: {
      label: "go to (sub-)DAG"
      url: "https://workflow.telemetry.mozilla.org/dags/{{ dag_id }}/grid"
    }
    primary_key: yes
  }

  dimension: tags {
    hidden: yes
    type: number
  }

  dimension: impact {
    type: string
    sql:
      case
        when "impact/tier_1" in unnest(${tags}) then "Tier 1"
        when "impact/tier_2" in unnest(${tags}) then "Tier 2"
        when "impact/tier_3" in unnest(${tags}) then "Tier 3"
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
      end
    ;;
  }

  dimension: triage {
    type: string
    sql:
      case
        when "triage/no_triage" in unnest(tags) then "no triage"
        when "triage/record_only" in unnest(tags) then "record only"
      end
    ;;
  }

  measure: count {
    type: count
  }

}
