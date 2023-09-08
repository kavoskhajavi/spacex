//
//  LaunchSapceXUseCase.swift
//  SpaceX
//
//  Created by david on 9/8/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

let launchSpaceXUseCase = LaunchSpaceXUseCaseImp(repository: launchRepository)

protocol LaunchSpaceXUseCase {
    func getDataLaunchSpacex(parameter:Data,completion: @escaping (LaunchCompletionHandler))
}

class LaunchSpaceXUseCaseImp:LaunchSpaceXUseCase  {
    
      var repository:LaunchSpaceXRepository
     
     init(repository:LaunchSpaceXRepository) {
         self.repository = repository
     }
    func getDataLaunchSpacex(parameter:Data,completion: @escaping LaunchCompletionHandler) {
        repository.getDataLaunchSpacex(parameter: parameter) { data,error     in
            completion(data,error)
        }
    }

}
