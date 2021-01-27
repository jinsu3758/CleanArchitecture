//
//  UserRepository.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/12.
//  Copyright © 2020 jinsu. All rights reserved.
//

import Foundation
import RxSwift

protocol UserRepositoryType {
    func postUser(user: User) -> Single<User>
}

class UserRepository: UserRepositoryType {    
    
//    func postUser(user: User) -> Single<User> {
//        // apiSerive.post()
//        let user = PublishSubject<User>()
//
//        user.onNext(User(id: "ewr", key: "wer"))
//        return user.asSingle()
//
//    }
    
    func postUser(user: User) -> Single<User> {
        
        
        let remoteUser = User(id: "asdf", key: "asdf")
        let isValid = checkValidation(inputUser: user, remoteUser: remoteUser)
        let resultUser = isValid ?
            User(id: user.id, key: user.key) :
            User()
        
        
        return Observable<User>.of(remoteUser).asSingle()
    }
    
//    // 원래 여기서 체크하는게 아니라 서버에서 할 작업. 테스트용임.
    func checkValidation(inputUser: User, remoteUser: User) -> Bool {
        return inputUser.id == remoteUser.id && inputUser.key == remoteUser.key
    }
}

