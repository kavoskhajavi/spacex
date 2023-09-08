//
//  MainDataSource.swift
//  SpaceX
//
//  Created by david on 9/5/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

protocol LunchSpaceXDataSource {
    func getDataLauchSpaceX(parameter:Data,completion:@escaping(LaunchCompletionHandler))
}

let launchSpaceXDataSource:LaunchSpaceXDataSourceImp = LaunchSpaceXDataSourceImp(networkingManager: NetworkingManager.share)

class LaunchSpaceXDataSourceImp: LunchSpaceXDataSource {
 
    var networkingManager:NetworkingManager
    
    init(networkingManager:NetworkingManager) {
        self.networkingManager = networkingManager
    }
 
    func getDataLauchSpaceX(parameter:Data,completion: @escaping (LaunchCompletionHandler)) {
       
        networkingManager.request(_absoluteURL: baseUrl,parameter: parameter, type: MainLaunchModel.self) { res in
            switch res {
            case .success(let data):
                completion(data,nil)
            case .failure(let error):
                completion(nil,error.localizedDescription)
            }
            
        }
        
    }
}
