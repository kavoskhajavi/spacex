//
//  ModelSpacx.swift
//  SpaceX
//
//  Created by david on 9/5/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

struct MainLaunchModel: Codable {

        let docs : [LaunchModel]?
        let totalDocs : Int?
        let offset : Int?
        let limit : Int?
        let totalPages : Int?
        let page : Int?
        let pagingCounter : Int?
        let hasPrevPage : Bool?
        let hasNextPage : Bool?
        let prevPage : Int?
        let nextPage : Int?

    }
struct LaunchModel : Codable {
    let links : Links?
    let success : Bool?
    let details : String?
    let flight_number : Int?
    let name : String?
    let date_utc : String?
    let upcoming : Bool?
    let id : String?
}

struct Links : Codable {
    let patch : Patch?
    let wikipedia : String?

}

struct Patch : Codable {
    let small : String?
    let large : String?
}
