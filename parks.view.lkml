view: parks {
  sql_table_name: biodiversity_in_parks.parks ;;

  dimension: park_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.Park_Code ;;
  }

  dimension: park_name {
    type: string
    sql: ${TABLE}.Park_Name ;;
    link: {
      label: "View park profile"
      url: "https://productday.dev.looker.com/dashboards/221" # need to figure out how to do this
      icon_url: "https://looker.com/favicon.ico"
    }
    link: {
      label: "View the profile for this park on www.nps.gov"
      url: "https://www.nps.gov/{{ parks.park_code._value }}/index.htm"
      icon_url: "https://www.google.com/s2/favicons?domain=www.nps.gov"
    }
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: park_acres {
    group_label: "Geography"
    description: "Size of the national park in acres"
    type: number
    sql: ${TABLE}.Park_Acres ;;
  }

  dimension: state {
    description: "The US state in which a park is located"
    group_label: "Geography"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: location {
    description: "The location of a park in terms of latitude and longitude"
    group_label: "Geography"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: region {
    description: "The region in which the park is located, as defined by the NPS"
    group_label: "Geography"
    case: {
      when: {
        sql: ${parks.state} in ('CA', 'OR', 'WA', 'ID', 'NV', 'HI', 'AS', 'GU' ) ;;
        label: "Pacific West"
      }
      when: {
        sql: ${parks.state} in ('MT', 'WY', 'UT', 'AZ', 'CO', 'NM', 'TX', 'OK') ;;
        label: "Intermountain"
      }
      when: {
        sql: ${parks.state} in ('ND', 'SD', 'NE', 'KS', 'MN', 'IA', 'MO', 'AR', 'WI', 'MI', 'IL', 'IN', 'OH') ;;
        label: "Midwest"
      }
      when: {
        sql: ${parks.state} in ('ME', 'NH', 'VT', 'NY', 'MA', 'CT', 'RI', 'PA', 'NJ', 'DE', 'MD', 'VA', 'WV') ;;
        label: "Northeast"
      }
      when: {
        sql: ${parks.state} in ('KY', 'TN', 'LA', 'MS', 'AL', 'GA', 'FL', 'SC', 'NC', 'VI', 'PR') ;;
        label: "Southeast"
      }
      when: {
        sql: ${parks.state} = 'AK' ;;
        label: "Alaska"
      }
      when: {
        sql: ${parks.state} = 'DC' ;;
        label: "National Capitol"
      }
      else: "Multiple States"
    }
  }

  measure: count {
    type: count
  }

  measure: park_count {
    label: "Number of Parks"
    type: count_distinct
    sql: ${park_code} ;;
  }


  measure: total_acres {
    label: "Acreage of the park"
    type: sum
    sql: ${park_acres} ;;
  }


}
