view: park_acre_ranking_state {
  derived_table: {
    sql: SELECT park_code, park_acres, state,
    RANK() OVER (PARTITION BY state ORDER BY park_acres DESC) as state_rank

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
    type: string
    sql: ${TABLE}.park_code ;;
  }

  dimension: park_acres {
    type: number
    sql: ${TABLE}.park_acres ;;
  }


  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_rank {
    type: number
    sql: ${TABLE}.state_rank ;;
  }

  set: detail {
    fields: [park_code, park_acres, state_rank]
  }

}
