//
//  AppDelegate.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/10.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let appDIContainer: AppDIContainer = AppDIContainer()
    
    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        
        coordinator = AppCoordinator(navigationController: navigationController, appDIContainer: appDIContainer)
        coordinator?.start()
        
        window?.makeKeyAndVisible()
        
        return true
    }


}

