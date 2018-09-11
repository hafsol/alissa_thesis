view: parks {
  sql_table_name: biodiversity_in_parks.parks ;;

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: park_acres {
    type: number
    sql: ${TABLE}.Park_Acres ;;
  }

  dimension: park_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.Park_Code ;;
  }

  dimension: park_name {
    type: string
    sql: ${TABLE}.Park_Name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  measure: count {
    type: count
    drill_fields: [park_name]
  }
}
