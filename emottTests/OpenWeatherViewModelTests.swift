//
//  OpenWeatherViewModelTests.swift
//  emottTests
//
//  Created by Ehidiamen Ojielu on 5/19/20.
//  Copyright © 2020 Ehidiamen Ojielu. All rights reserved.
//

@testable import emott
import XCTest

class OpenWeatherViewModelTests: XCTestCase {

    let fakeOpenWeatherService: OpenWeatherServiceProtocol = FakeOpenWeatherService()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCurrentWeather() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let viewModel = OpenWeatherViewModel(openWeatherService: fakeOpenWeatherService)
        viewModel.fetchCurrentWeather()
        XCTAssert(viewModel.openWeather != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
