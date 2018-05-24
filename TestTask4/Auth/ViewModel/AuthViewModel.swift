//
//  AuthViewModel.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 24/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import Foundation
import RxSwift

class AuthViewModel {
    private let router: AuthRouter!
    private var model = AuthModel()
    private let disposeBag = DisposeBag()
    
    init(router: AuthRouter) {
        self.router = router
        
        subscribeOnTemp()
    }
    
    private func subscribeOnTemp() {
        model.tempObservable().subscribe(onNext: { temp in
            self.router.showAlertView(withMessage: "Температура в Москве: \(temp)")
        }).disposed(by: disposeBag)
    }
    
    func validateAndLogin(email: String, password: String) {
        if !model.isValid(email: email) {
            router.showAlertView(withMessage: "Email не корректен")
            return
        }
        if !model.isValid(password: password) {
            router.showAlertView(withMessage: "Пароль должен содержать одну строчную букву, одну заглавную и одну цифру")
            return
        }
        model.getWeatherTemp()
    }
    
    //MARK: - EMPTY
    
    func forgetPassword() {
        router.showAlertView(withMessage: "Нам очень жаль!")
    }
    
    func createAccount() {
        router.showAlertView(withMessage: "не получится при всём желании!")
    }
}
