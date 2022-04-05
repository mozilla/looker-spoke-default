view: country_buckets {
  derived_table: {
    sql:
      WITH country_codes AS (
        SELECT name, code FROM
            mozdata.static.country_codes_v1 c
          UNION ALL
          SELECT "OTHER" AS name, "OTHER" as code
      ),
      buckets AS (SELECT bucket
        FROM UNNEST([
          "Overall", "tier-1", "non-tier-1", "US", "CA", "DE", "FR", "GB", "MX", "BR", "CN"
        ]) AS bucket
      )
      SELECT * FROM
        country_codes c
      CROSS JOIN buckets
      WHERE
      bucket = "Overall" OR (
        bucket = "tier-1" AND code IN ('US', 'CA', 'DE', 'FR', 'GB')
      ) OR (
        bucket = "non-tier-1" AND code NOT IN ('US', 'CA', 'DE', 'FR', 'GB')
      ) OR bucket = code;;
  }

  dimension: bucket {
    type: string
    sql: ${TABLE}.bucket ;;
  }

  dimension: code {
    type: string
    sql:  ${TABLE}.code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
