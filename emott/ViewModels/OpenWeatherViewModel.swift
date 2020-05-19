//
//  OpenWeatherViewModel.swift
//  emott
//
//  Created by Ehidiamen Ojielu on 5/15/20.
//  Copyright © 2020 Ehidiamen Ojielu. All rights reserved.
//

import Foundation

class OpenWeatherViewModel: ObservableObject {
    @Published private (set) var openWeather: OpenWeather?
    @Published private (set) var openWeatherRequestState: NetworkStateMachine = .idle
    
    var openWeatherService: OpenWeatherServiceProtocol
    
    init(openWeatherService: OpenWeatherServiceProtocol = OpenWeatherService()) {
        self.openWeatherService = openWeatherService
            // fetch current weather
        self.fetchCurrentWeather()
    }
    
    func fetchCurrentWeather() {
        self.openWeatherRequestState = .loading
        self.openWeatherService.currentWeather {
            result in
            self.openWeather = result

            if result == nil {
                self.openWeatherRequestState = .failed
            } else {
                self.openWeatherRequestState = .success
            }
        }
    }
    
    func currentTemp() -> String {
        if let temp = self.openWeather?.main.temp {
            let tempInFahrenheit = self.convertKelvinToFahrenheit(from: temp)
            return String(format: "%.1f", tempInFahrenheit)
        } else {
            return "No available current temp"
        }
    }
    
    func currentWeatherDescription() -> String {
        guard let weather = self.openWeather?.weather,
            !weather.isEmpty,
            let activeWeather = weather.first
            else {
                return "No available weather description"
        }
        
        return "\(activeWeather.main)"
    }
    
    func currentWeatherIcon() -> String {
        if let main = self.openWeather?.weather.first?.main.lowercased() {
            switch main {
            case "thunderstorm":
                return "cloud.bolt.fill"
            case "rain":
                return "cloud.rain.fill"
            case "snow":
                return "cloud.snow.fill"
            case "mist", "fog":
                return "cloud.fog.fill"
            case "smoke":
                return "smoke.fill"
            case "tornado":
                return "tornado"
            case "clear":
                return "cloud.sun.fill"
            case "clouds":
                return "cloud.fill"
            default:
                return "questionmark.circle.fill"
            }
        } else {
            return "clouds"
        }
    }
    
    func convertKelvinToCelsius(from kelvin: Double) -> Double {
        return kelvin - 273.15
    }
    
    func convertKelvinToFahrenheit(from kelvin: Double) -> Double {
//        Formula 1.8(K - 273) + 32
        return 1.8 * (kelvin - 273) + 32
    }
}
