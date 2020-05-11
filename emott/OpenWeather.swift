//
//  WeatherState.swift
//  emott
//
//  Created by Ehidiamen Ojielu on 5/14/20.
//  Copyright © 2020 Ehidiamen Ojielu. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var main: String
    var description: String
}

struct Wind: Decodable {
    var speed: Double
    var deg: Double
    var gust: Double
}

struct Main: Decodable {
    var temp: Double
    var tempMin: Double
    var tempMax: Double
    var feelsLike: Double
    var pressure: Double
    var humidity: Double
}

struct OpenWeather: Decodable {
    var main: Main
    var weather: [Weather]
}
