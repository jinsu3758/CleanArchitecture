//
//  SignInViewModel.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/11.
//  Copyright © 2020 jinsu. All rights reserved.
//

import RxSwift
import RxCocoa
import NSObject_Rx

enum UserError: Error {
    case emptyUser
    case wrongPassword
}

struct SignInViewModelObservables {
    //    let presentMainViewContoller: PublishSubject<User>
    let presentMainViewContoller: (User) -> Void
}

class SignInViewModel: NSObject, ViewModelType {
    private let observables: SignInViewModelObservables
    
    private var user: User?
    
    struct Input {
        let signInAction: Driver<Void>
        let presentSignUp: Driver<Void>
        let id: Driver<String>
        let password: Driver<String>
    }
    
    struct Output {
        let isEnabledId: Driver<Bool>
        let isEnabledPassword: Driver<Bool>
    }
    
    let useCase: SignInUseCaseType
    
    init(useCase: UseCaseType, observables: SignInViewModelObservables) {
        self.useCase = useCase as! SignInUseCaseType
        self.observables = observables
    }
    
    func transform(input: Input) -> Output {
        let isEnabledId = input.id
            .map { $0.count > 10 }
        
        let isEnabledPassword = input.password
            .map { $0.count > 10 }
        
        let userData = Driver.combineLatest(input.id, input.password)
        
        input.signInAction.withLatestFrom(userData)
            .flatMapLatest { [unowned self] in
                self.useCase.signIn(id: $0, password: $1).asDriver(onErrorJustReturn: User())
            }
            .drive(onNext: { [unowned self] user in
                self.observables.presentMainViewContoller(user)
            }).disposed(by: rx.disposeBag)
        
        return Output(isEnabledId: isEnabledId, isEnabledPassword: isEnabledPassword)
    }
}
