//
//  UserDIContainer.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/12.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation
import UIKit

final class UserDIContainer: SignInCoordinatorDependencies {
    
    deinit {
        print("UserDIContainer deinit")
    }
    
    // ViewModel
    func makeSignInViewModel(observables: SignInViewModelObservables) -> SignInViewModel {
        return SignInViewModel(useCase: makeSignInUseCase(), observables: observables)
    }
    
    func makeMainViewModel(user: User) -> MainViewModel {
        return MainViewModel()
    }
    
    
    func makeSignInUseCase() -> SignInUseCaseType {
        return SignInUsecase(userRepository: makeUserRepository())
    }
    
    func makeUserRepository() -> UserRepositoryType {
        return UserRepository()
    }
    

    /// Coordinator
    func makeSignInCoordinator(navigationController: UINavigationController) -> SignInCoordinator {
        return SignInCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    func makeMainCoordinator(navigationController: UINavigationController) -> MainCoordinator {
        return MainCoordinator()
    }
}
