# Whether Sweater Weather?

### Overview

A backend Rails application designed to support a fictional weather information application.

### Author

- [Krista Stadler](https://github.com/kristastadler)

### Local Setup

 - Clone
 - bundle
 - rails db:{create,migrate,seed}
 - rails s
 - All endpoints are available at: `https://whether-sweater-weather.herokuapp.com/`


### Endpoints

  - ``backgrounds``
    - Description: Get request to return an image of a requested city.
    - Location param is required
    - Example Request Params:
      ``location=San Diego, CA``
    - Expected Request Type: JSON
    - Example Response:
    ``` {
    "data": {
        "image_url": "https://images.unsplash.com/photo-1534729607933-5904a7f99ff9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE0MDYxMn0"
    }
    }```

  - ``forecast``
    - Description: Get request to return full forecast information for a requested city.
    - Location param is required
    - Example Request Params:
      ``location=San Diego, CA``
    - Expected Request Type: JSON
    - Example Response:
    ```{
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "city": "Denver, CO",
            "date_time": "2020-07-27T22:08:42.000+00:00",
            "current_temp": 85,
            "high_temp": 85,
            "low_temp": 76,
            "current_description": "Clouds",
            "feels_like": 85,
            "humidity": 36,
            "uvi": 11.59,
            "sunrise": 1595850892,
            "sunset": 1595902669,
            "hourly_forecast": [
                {
                    "date_time": "2020-07-27T22:00:00.000+00:00",
                    "description": "Clouds",
                    "temperature": 85
                },
                {
                    "date_time": "2020-07-27T23:00:00.000+00:00",
                    "description": "Clouds",
                    "temperature": 86
                },
                {
                    "date_time": "2020-07-28T00:00:00.000+00:00",
                    "description": "Clouds",
                    "temperature": 85
                },
                {
                    "date_time": "2020-07-28T01:00:00.000+00:00",
                    "description": "Clouds",
                    "temperature": 83
                },
                {
                    "date_time": "2020-07-28T02:00:00.000+00:00",
                    "description": "Clouds",
                    "temperature": 81
                },
                {
                    "date_time": "2020-07-28T03:00:00.000+00:00",
                    "description": "Clouds",
                    "temperature": 79
                },
                {
                    "date_time": "2020-07-28T04:00:00.000+00:00",
                    "description": "Clouds",
                    "temperature": 77
                },
                {
                    "date_time": "2020-07-28T05:00:00.000+00:00",
                    "description": "Clouds",
                    "temperature": 76
                }
            ],
            "daily_forecast": [
                {
                    "date": "2020-07-27",
                    "description": "Clouds",
                    "rain_accumulation": null,
                    "high_temp": 85,
                    "low_temp": 76
                },
                {
                    "date": "2020-07-28",
                    "description": "Rain",
                    "rain_accumulation": 3.82,
                    "high_temp": 85,
                    "low_temp": 70
                },
                {
                    "date": "2020-07-29",
                    "description": "Rain",
                    "rain_accumulation": 0.62,
                    "high_temp": 94,
                    "low_temp": 70
                },
                {
                    "date": "2020-07-30",
                    "description": "Rain",
                    "rain_accumulation": 0.87,
                    "high_temp": 72,
                    "low_temp": 66
                },
                {
                    "date": "2020-07-31",
                    "description": "Clear",
                    "rain_accumulation": null,
                    "high_temp": 86,
                    "low_temp": 66
                }
            ]
        }
    }
}```

  - ``users``
    - Description: Post request to create new user and assign them an API key.
    - Example Request Body:
      ``{ "email": "brandnew@example.com", "password": "password", "password_confirmation": "password" }``
    - Expected Request Type: JSON
    - Example Response:
    ``` {
    "data": {
        "id": "6",
        "type": "users",
        "attributes": {
            "email": "brandnew@example.com",
            "api_key": "FQxAi9dI-4KS21rfH27Q9A"
        }
    }```

  - ``sessions``
    - Description: Post request to log an existing user in to the system.
    - Example Request Body:
      ``{ "email": "whatever@example.com", "password": "password" }``
    - Expected Request Type: JSON
    - Example Response:
    ```{
      "data": {
          "id": "1",
          "type": "users",
          "attributes": {
              "email": "whatever@example.com",
              "api_key": "yV2dxgdKiDZDf8d6uH9sQA"
          }
      }
      }```

  - ``road_trip``
    - Description: Post request for user to get travel time and forecast information for a requested trip. Requires a user to have an assigned API key.
    - Example Request Body:
      ``{ "origin": "Denver,CO", "destination": "Pueblo,CO", "api_key": "yV2dxgdKiDZDf8d6uH9sQA" }``
    - Expected Request Type: JSON
    - Example Response:
    ```{
    "data": {
        "id": "null",
        "type": "road_trip",
        "attributes": {
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "travel_time": "1 hour 47 mins",
            "destination_forecast": {
                "summary": "Clear",
                "temperature": 76
            }
        }
    }
}```    
