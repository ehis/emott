//
//  FakeOpenWeatherService.swift
//  emott
//
//  Created by Ehidiamen Ojielu on 5/18/20.
//  Copyright © 2020 Ehidiamen Ojielu. All rights reserved.
//

import Foundation

struct FakeOpenWeatherService: OpenWeatherServiceProtocol {
    func currentWeather(completion: @escaping (OpenWeather?) -> Void) {
        let fakeMain = Main(temp: 110.0, tempMin: 100.0, tempMax: 89.0, feelsLike: 99.0, pressure: 23.0, humidity: 120.0)
        let fakeWeather = Weather(main: "Cloudy", description: "a chance of meat balls")
        let fakeOpenWeather = OpenWeather(main: fakeMain, weather: [fakeWeather])
        
        completion(fakeOpenWeather)
    }
    
}
