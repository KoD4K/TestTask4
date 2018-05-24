//
//  AuthViewController.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 21/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import UIKit
import RxKeyboard
import RxSwift

class AuthViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private var router: AuthRouter!
    private var viewModel: AuthViewModel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var contentViewBottomConstraint: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        router = AuthRouter(withRootViewController: self)
        viewModel = AuthViewModel(router: router)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        hadleKeyboard()
    }
    
    private func hadleKeyboard() {
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { keyboardVisibleHeight in
                self.contentViewBottomConstraint.constant = -keyboardVisibleHeight
                self.view.layoutIfNeeded()
            })
            .disposed(by: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func emptySpaceTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func forgetPasswordPress(_ sender: DesignableButton) {
        viewModel.forgetPassword()
    }
    
    @IBAction func enterButtonPress(_ sender: DesignableButton) {
        viewModel.validateAndLogin(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func createAccountPress(_ sender: UIButton) {
        viewModel.createAccount()
    }
}
