//
//  AppCoordinator.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/13.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

protocol Coordinatorable {
    func start()
}

final class AppCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    deinit {
        print("AppCoordinator deinit")
    }
    
    func start() {
        let userDIcontainer = appDIContainer.makeUserDIContainer()
        let signInCoordinator = userDIcontainer.makeSignInCoordinator(navigationController: navigationController)
        signInCoordinator.start()

        print("start end")
    }
    
}
