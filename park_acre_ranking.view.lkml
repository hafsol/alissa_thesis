view: park_acre_ranking {
  derived_table: {
    sql: SELECT park_code, park_acres,
      RANK() OVER (ORDER BY park_acres DESC) as rank

      FROM `lookerdata.biodiversity_in_parks.parks`
       ;;
  }

## measures

  measure: count {
    type: count
    drill_fields: [detail*]
  }


## dimensions

  dimension: park_code {
    type: string
    sql: ${TABLE}.park_code ;;
  }

  dimension: park_acres {
    type: number
    sql: ${TABLE}.park_acres ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  set: detail {
    fields: [park_code, park_acres, rank]
  }
}
