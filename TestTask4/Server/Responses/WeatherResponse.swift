//
//  WeatherResponse.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 24/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import ObjectMapper

struct WeatherResponse {
    var currentTemp: Double!
    
    init() {
    }
}

extension WeatherResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        currentTemp <- map["main.temp"]
    }
}
