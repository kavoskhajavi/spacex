//
//  MainRepository.swift
//  SpaceX
//
//  Created by david on 9/5/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

typealias LaunchCompletionHandler = (MainLaunchModel?,String?)->Void

let launchRepository:LaunchSpaceXRepositoryImp = LaunchSpaceXRepositoryImp(dataSource: launchSpaceXDataSource)

class LaunchSpaceXRepositoryImp:LaunchSpaceXRepository  {
    var dataSource:LunchSpaceXDataSource
    
    init(dataSource:LunchSpaceXDataSource) {
        self.dataSource = dataSource
    }
    
    func getDataLaunchSpacex(parameter:Data,completion: @escaping LaunchCompletionHandler) {
        dataSource.getDataLauchSpaceX(parameter: parameter) { data,error     in
            completion(data,error)
        }
    }

}
