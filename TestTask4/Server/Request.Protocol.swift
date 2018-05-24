//
//  Request.Protocol.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 24/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import Foundation
import ObjectMapper

protocol Request: Mappable {
    var url: String { get }
}
