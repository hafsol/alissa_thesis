view: cities {
  sql_table_name: biodiversity_in_parks.cities ;;

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.lng ;;
  }

  dimension: state_id {
    type: string
    sql: ${TABLE}.state_id ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: location {
    description: "The location of a city in terms of its latitude and longitude"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude}g} ;;
  }

  measure: count {
    type: count
    drill_fields: [state_name]
  }
}
