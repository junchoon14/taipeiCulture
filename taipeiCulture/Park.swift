//
//  Park.swift
//  taipeiCulture
//
//  Created by Jason Hsu on 2018/8/21.
//  Copyright © 2018 junchoon. All rights reserved.
//

import Foundation

struct SpotResult: Codable {
    var result: SpotResults
}

struct SpotResults: Codable {
    var offset: Double
    var limit: Double
    var count: Double
    var sort: String
    var results: [Spot]
}


struct Spot: Codable {
    
    var ParkName: String
    var Name: String
    var Image: String
    var Introduction: String
}

