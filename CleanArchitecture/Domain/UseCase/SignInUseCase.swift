//
//  SignInUseCase.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/12.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation
import RxSwift

protocol SignInUseCaseType: UseCaseType {
    func signIn(id: String, password: String) -> Single<User>
}

class SignInUsecase: SignInUseCaseType {
    let userRepository: UserRepositoryType
    
    init(userRepository: UserRepositoryType) {
        self.userRepository = userRepository
    }
    
    func signIn(id: String, password: String) -> Single<User> {
        let user = User(id: id, key: password)
        return self.userRepository.postUser(user: user)
        
    }
}


