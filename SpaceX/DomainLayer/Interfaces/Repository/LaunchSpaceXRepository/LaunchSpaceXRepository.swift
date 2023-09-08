//
//  LaunchSpaceXRepository.swift
//  SpaceX
//
//  Created by david on 9/8/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

protocol LaunchSpaceXRepository {
    func getDataLaunchSpacex(parameter:Data,completion: @escaping (LaunchCompletionHandler))
}
