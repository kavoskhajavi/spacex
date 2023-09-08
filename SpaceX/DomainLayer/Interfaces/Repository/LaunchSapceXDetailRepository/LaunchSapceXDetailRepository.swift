//
//  LaunchSapceXDetail.swift
//  SpaceX
//
//  Created by david on 9/8/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
protocol LaunchSpaceXDetailRepository {
    
    func creatBookMark(id:String,name:String)
    
    func deleteBookMark(id:String)
    
    func isBookMark(id:String,completion:@escaping(Bool) -> Void)
    
}
