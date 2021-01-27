//
//  ViewController.swift
//  CleanArchitecture
//
//  Created by 박진수 on 2020/08/10.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class SignInViewController: UIViewController, ViewControllerType {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var viewModel: SignInViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindView() {
        let input = SignInViewModel.Input(signInAction: signInButton.rx.tap.asDriver(),
                                        presentSignUp: signUpButton.rx.tap.asDriver(),
                                        id: idTextField.rx.text.orEmpty.asDriver(),
                                        password: passwordTextField.rx.text.orEmpty.asDriver())
        
        let output = viewModel.transform(input: input)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }

}

