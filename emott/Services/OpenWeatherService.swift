//
//  Weather.swift
//  emott
//
//  Created by Ehidiamen Ojielu on 5/14/20.
//  Copyright © 2020 Ehidiamen Ojielu. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import Willow

struct OpenWeatherService: OpenWeatherServiceProtocol {
    let log = Logger(logLevels: [.all], writers: [ConsoleWriter()])
    private let host: String = "https://api.openweathermap.org/data/2.5/weather"
    private let key: String = "e55f53380debde659a4de59fdcbc7904"
    
    func currentWeather(completion: @escaping (OpenWeather?) -> Void) {
        let parameters = [
            "q": "dallas",
            "appid": key
        ]
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(host, parameters: parameters)
            .validate()
            .responseDecodable(of: OpenWeather.self, decoder: decoder) { response in
                switch response.result {
                    case .success(let openWeather):
                        completion(openWeather)
                    case .failure(let error):
                        self.log.infoMessage("Error occurred \(error)")
                        completion(nil)
                }
        }
    }
}
