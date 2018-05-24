//
//  AuthModel.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 24/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import Foundation
import RxSwift

class AuthModel {
    lazy private var server: Server = {
        return Server()
    }()
    private let disposeBag = DisposeBag()
    private let temp = Variable(Double(0))
    
    init() {}
    
    func isValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValid(password:String) -> Bool {
        let passwordRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,64}"
        
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    func getWeatherTemp() {
        server.loadWeatherTemp().subscribe(onNext: { weather in
            self.temp.value = weather.currentTemp - 273.15
        }).disposed(by: disposeBag)
    }
    
    func tempObservable() -> Observable<Double> {
        return temp.asObservable().skip(1).share()
    }
}
