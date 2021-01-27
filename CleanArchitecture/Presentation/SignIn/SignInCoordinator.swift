//
//  SignInCoordinator.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/13.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

protocol SignInCoordinatorDependencies {
    func makeSignInViewModel(observables: SignInViewModelObservables) -> SignInViewModel
    func makeMainViewModel(user: User) -> MainViewModel
}


class SignInCoordinator: NSObject, Coordinatorable {
    private let navigationController: UINavigationController
    private let dependencies: SignInCoordinatorDependencies
    
    init(navigationController: UINavigationController, dependencies: SignInCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    deinit {
        print("SignInCoordinator deinit")
    }
    
    func start() {
        let observables = SignInViewModelObservables(presentMainViewContoller: presentMainViewController)
        
        var signInViewController: SignInViewController = Scene.signIn.getViewController()
        let signInViewModel = dependencies.makeSignInViewModel(observables: observables)
        signInViewController.bindViewModel(signInViewModel)
        self.navigationController.pushViewController(signInViewController, animated: true)
    }
    
    func presentMainViewController(user: User) {
        var mainViewController: MainViewController = Scene.main.getViewController()
        let mainViewModel = self.dependencies.makeMainViewModel(user: user)
        mainViewController.bindViewModel(mainViewModel)
        self.navigationController.pushViewController(mainViewController, animated: true)
    }
}


class MainCoordinator: NSObject, Coordinatorable {
    func start() {
        
    }
    
    
}
