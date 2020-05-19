//
//  OpenWeatherServiceProtocol.swift
//  emott
//
//  Created by Ehidiamen Ojielu on 5/18/20.
//  Copyright © 2020 Ehidiamen Ojielu. All rights reserved.
//

import Foundation

protocol OpenWeatherServiceProtocol {
    func currentWeather(completion: @escaping (OpenWeather?) -> Void)
}
