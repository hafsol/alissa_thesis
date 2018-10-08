view: park_acre_ranking {
  derived_table: {
    sql: SELECT park_code, park_acres,
      RANK() OVER (ORDER BY park_acres DESC) as rank
      ,RANK() OVER (PARTITION BY state ORDER BY park_acres DESC) as state_rank

      FROM `lookerdata.biodiversity_in_parks.parks`
       ;;
  }

## measures

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

## dimensions

  dimension: park_code {
    description: "National Parks Service park code."
    type: string
    sql: ${TABLE}.park_code ;;
  }

  dimension: rank {
    description: "A park's rank by size."
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: state_rank {
    description: "A park's rank by size within its state."
    type: number
    sql: ${TABLE}.state_rank ;;
  }

  parameter: max_rank {
    hidden: yes
    type: number
  }

  dimension: rank_limit {
    hidden: yes
    type: number
    sql: {% parameter max_rank %} ;;
  }

  dimension: park_acres {
    hidden: yes
    type: number
    sql: ${TABLE}.park_acres ;;
  }


  set: detail {
    fields: [park_code, park_acres, rank]
  }

}
