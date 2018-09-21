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

  dimension: park_code_images {
    type: string
    sql: ${TABLE}.Park_Code ;;
    html: {% if value == "YOSE" %}
            <img src="https://www.nps.gov/common/uploads/banner_image/pwr/homepage/36C683FE-1DD8-B71B-0B6B4AE9C34946B8.jpg" style="width:1500px;height:500px;" />
          {% elsif value == "REDW" %}
            <img src="https://www.nps.gov/common/uploads/banner_image/pwr/secondary/E7886391-B283-E7E6-3AB2428BB1035429.jpg" style="width:1500px;height:500px;" />
          {% else %}
            {{value}}
          {% endif %}
    ;;
  }

}
