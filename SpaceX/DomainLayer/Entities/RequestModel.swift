//
//  RequestModel.swift
//  SpaceX
//
//  Created by david on 9/7/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

struct RequestModel: Codable {
    var query : Query?
    var options:Options?
}
struct Options: Codable {
    var limit:Int = 50
    var page:Int = 1
    var sort:Sort?
}
struct Sort : Codable{
    var flighNumber:String = "desc"
}

struct Query : Codable {
    var upcoming:Bool = false
}
