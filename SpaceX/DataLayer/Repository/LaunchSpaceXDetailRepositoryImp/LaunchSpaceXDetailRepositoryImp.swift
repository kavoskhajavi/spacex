//
//  LaunchSpaceXDetailRepository.swift
//  SpaceX
//
//  Created by david on 9/7/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation


let launchSpaceXDetailRepository:LaunchSpaceXDetailRepositoryImp = LaunchSpaceXDetailRepositoryImp(localDataSource: localSaceXDetail)




class LaunchSpaceXDetailRepositoryImp: LaunchSpaceXDetailRepository {

    let localDataSource:LaunchSpaceXDetailLocal
    
    init(localDataSource:LaunchSpaceXDetailLocal) {
        self.localDataSource = localDataSource
    }
    
    func creatBookMark(id: String, name: String) {
        localDataSource.creatBookMark(id: id, name: name)
    }
    
    func deleteBookMark(id: String) {
        localDataSource.deleteBookMark(id: id)
    }
    
    func isBookMark(id: String, completion complition: @escaping (Bool) -> Void) {
        
        localDataSource.isBookMark(id: id){ result in
            complition(result)
        }
        
    }
    
}
