//
//  weatherByCityRequest.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 24/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherRequest: Request {
    var url = "http://api.openweathermap.org/data/2.5/weather"
    
    private var cityId = "524901"
    private var appId = "421dc8eda2217044006063214e046958"
    
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        cityId <- map["id"]
        appId <- map["appid"]
    }
}
