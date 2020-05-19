//
//  FakeOpenWeatherService.swift
//  emott
//
//  Created by Ehidiamen Ojielu on 5/18/20.
//  Copyright © 2020 Ehidiamen Ojielu. All rights reserved.
//

import Foundation

struct FakeOpenWeatherService: OpenWeatherServiceProtocol {
    /*
     {
       "id": 88319,
       "dt": 1345284000,
       "name": "Benghazi",
       "coord": {
         "lat": 32.12,
         "lon": 20.07
       },
       "main": {
         "temp": 306.15,
         "pressure": 1013,
         "humidity": 44,
         "temp_min": 306,
         "temp_max": 306
       },
       "wind": {
         "speed": 1,
         "deg": -7
       },
       "weather": [
         {
           "id": 520,
           "main": "rain",
           "description": "light intensity shower rain",
           "icon": "09d"
         }
       ],
       "clouds": {
         "all": 90
       },
       "rain": {
         "3h": 3
       }
     }
     */
    func currentWeather(completion: @escaping (OpenWeather?) -> Void) {
        let fakeMain = Main(temp: 306.15, tempMin: 306, tempMax: 306, feelsLike: 99.0, pressure: 1013, humidity: 44)
        let fakeWeather = Weather(main: "rain", description: "light intensity shower rain")
        let fakeOpenWeather = OpenWeather(main: fakeMain, weather: [fakeWeather])
        
        completion(fakeOpenWeather)
    }
    
}
