//
//  LaunchSpaceXDetailUseCase.swift
//  SpaceX
//
//  Created by david on 9/8/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

let launchSpaceXDetailUseCase = LaunchSpaceXDetailUseCaseImp(repository: launchSpaceXDetailRepository)

protocol LaunchSpaceXDetailUseCase {
    
    func creatBookMark(id:String,name:String)
    
    func deleteBookMark(id:String)
    
    func isBookMark(id:String,completion:@escaping(Bool) -> Void)
}

class LaunchSpaceXDetailUseCaseImp: LaunchSpaceXDetailUseCase {
    
    let repository:LaunchSpaceXDetailRepository
    init(repository:LaunchSpaceXDetailRepository) {
        self.repository = repository
    }
    
    
    func creatBookMark(id: String, name: String) {
        repository.creatBookMark(id: id, name: name)
    }
    
    func deleteBookMark(id: String) {
        repository.deleteBookMark(id: id)
    }
    
    func isBookMark(id: String, completion complition: @escaping (Bool) -> Void) {
        
        repository.isBookMark(id: id){ result in
            complition(result)
        }
        
    }
}
