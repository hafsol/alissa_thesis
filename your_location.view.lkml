view: your_location {
  derived_table: {
    sql: SELECT city, state_id, lat, lng, CONCAT(city, ", ", state_id) AS city_state
       FROM `lookerdata.biodiversity_in_parks.cities`
       WHERE {% condition enter_your_location %} CONCAT(city, ", ", state_id) {% endcondition %}
       ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state_id {
    type: string
    sql: ${TABLE}.state_id ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lng {
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: city_state {
    type: string
    sql: ${TABLE}.city_state ;;
  }

  dimension: city_location {
    type: location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude: ${TABLE}.lng ;;
  }

  filter: enter_your_location {
    type: string
    suggest_explore: cities
    suggest_dimension: cities.city_state
  }

}
