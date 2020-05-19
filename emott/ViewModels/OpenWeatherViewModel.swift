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
    
    func currentTempDetails() -> String {
        if let main = self.openWeather?.main {
            return "\(main.temp)"
        } else {
            return "No available temperature details"
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
}
