//
//  AppDelegate.swift
//  SpaceX
//
//  Created by david on 9/4/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: LaunchSpaceXVC())
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        
        return true
    }

}

