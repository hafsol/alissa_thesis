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
    description: "Size of the national park in acres"
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
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: location {
    description: "The location of a park in terms of latitude and longitude"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: drill_state {

  }

  dimension: region {
    description: "The region in which the park is located, as defined by the NPS"
    case: {
      when: {
        sql: ${state} in ('CA', 'OR', 'WA', 'ID', 'NV', 'HI', 'AS', 'GU' ) ;;
        label: "Pacific West"
      }
      when: {
        sql: ${state} in ('MT', 'WY', 'UT', 'AZ', 'CO', 'NM', 'TX', 'OK') ;;
        label: "Intermountain"
      }
      when: {
        sql: ${state} in ('ND', 'SD', 'NE', 'KS', 'MN', 'IA', 'MO', 'AR', 'WI', 'MI', 'IL', 'IN', 'OH') ;;
        label: "Midwest"
      }
      when: {
        sql: ${state} in ('ME', 'NH', 'VT', 'NY', 'MA', 'CT', 'RI', 'PA', 'NJ', 'DE', 'MD', 'VA', 'WV') ;;
        label: "Northeast"
      }
      when: {
        sql: ${state} in ('KY', 'TN', 'LA', 'MS', 'AL', 'GA', 'FL', 'SC', 'NC', 'VI', 'PR') ;;
        label: "Southeast"
      }
      when: {
        sql: ${state} = 'AK' ;;
        label: "Alaska"
      }
      when: {
        sql: ${state} = 'DC' ;;
        label: "National Capitol"
      }
      else: "Unknown"
    }

  }

  measure: count {
    type: count
  }

  measure: total_acres {
    type: sum
    sql: ${park_acres} ;;
  }


}
